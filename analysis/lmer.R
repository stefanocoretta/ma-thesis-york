
library(lme4)
library(effects)
library(knitr)
library(highlight)
opts_knit$set(root.dir=normalizePath('../'))
opts_chunk$set(fig.path='img/', fig=TRUE, out.width="0.8\\textwidth", echo=FALSE, cache=FALSE)

results_raw <- read.csv("analysis/results.csv")
words <- read.csv("task/task-src/words.csv")
results_all <- merge(results_raw, words, by.x = "word", by.y = "lex")
results <- subset(results_all, comp == "c")
results <- droplevels(results)
results$syl = factor(results$syl,c("mono","di"))
results$height = factor(results$height, c("high", "mid", "low", "diph"))
results_stop <- subset(results, manner == "stop")
stops <- subset(results_stop, results_stop$vowel != "ɪ" & results_stop$vowel != "ou"
              & results_stop$vowel != "ʏ")
stops <- subset(stops, stops$place != "labial")
stops <- droplevels(stops)

model <- lmer(dur_vowel ~ asp + (1|speaker)+(1|word),
              data = stops, REML = FALSE)
model.null <- lmer(dur_vowel ~ (1|speaker)+(1|word),
                   data = stops, REML = FALSE)

anova(model.null, model)

vor.model <- lmer(vor ~ asp + (1|speaker) + (1|word),
                  data = stops, REML = FALSE)
vor.model.null <- lmer(vor ~ (1|speaker) + (1|word),
                  data = stops, REML = FALSE)

anova(vor.model.null, vor.model)
plot(allEffects(vor.model))

cc.model <- lmer(dur_cc ~ asp + (1|speaker) + (1|word),
                  data = stops, REML = FALSE)
cc.model.null <- lmer(dur_cc ~ (1|speaker) + (1|word),
                       data = stops, REML = FALSE)

anova(cc.model.null, cc.model)
plot(allEffects(cc.model))

interactions.model <- lmer(dur_vowel ~ asp * place * syl + (1|speaker) + (1|word),
                           data = stops, REML = FALSE)
height.model <- lm(dur_vowel ~ asp * height, data = stops)
plot(allEffects(interactions.model))
plot(allEffects(height.model))

#### Sonorants ####

results_nas <- subset(results, manner == "nasal")
results_lat <- subset(results, manner == "lateral")
results_rho <- subset(results, manner == "rhotic")
results_son <- rbind(results_nas, results_lat, results_rho)
results_son <- droplevels(results_son)

rc.model <- lmer(dur_cc ~ asp + syl + (1 | speaker) + (1 | word),
                  data = results_son)
rc.model.null <- lmer(dur_cc ~ asp + (1 | speaker) + (1 | word),
                  data = results_son)
anova(rc.model, rc.model.null)
plot(allEffects(rc.model))

son.model <- lmer(dur_mann ~ asp + (1 | speaker) + (1 | word),
                 data = results_son, REML = FALSE)
rc.model.null <- lmer(dur_mann ~ (1 | speaker) + (1 | word),
                      data = results_son, REML = FALSE)
anova(son.model, son.model.null)
plot(allEffects(son.model))

#model2 <- lmer(abs_voic ~ (1|file_name)+(1|word)+ manner+spread, data = nastop,
#               subset=asp=='yes')
# ggplot(nastop[nastop$asp=='yes',], aes(x=spread, y=abs_voic)) + geom_point() + 
#     facet_grid(~manner) + geom_smooth(method='lm')
