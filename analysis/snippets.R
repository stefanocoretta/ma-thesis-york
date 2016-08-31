

results <- read.csv("~/Documents/Projects/mathesis-is/analysis/results.csv")
words <- read.csv("~/Documents/Projects/mathesis-is/task/task-src/words.csv")

# need to check what can be compared with what

#results$asp <- words[match(results$word, words$lex),"asp"]
#results$manner <- words[match(results$word, words$lex),"manner"]
results_try <- merge(results, words, by.x = "word", by.y = "lex")

# results_voi <- subset(results_try, label == "voi")
# ths was for previous layout of data

results_stop <- subset(results_try, manner == "stop")
results_stop_asp <- subset(results_stop, cons1 == "asp")
results_stop_nasp <- subset(results_stop, cons1 == "nasp")
results_nasal <- subset(results_try, manner == "nasal")

plot(density(results_stop$dur_voic))
boxplot(results_stop$dur_voic~results_stop$asp)

plot(density(results_stop_asp$dur_voic))
boxplot(results_stop_asp$dur_voic~results_stop_asp$asp)

plot(density(results_stop_nasp$dur_int))
boxplot(results_stop_nasp$dur_int~results_stop_nasp$asp)

plot(density(results_stop_asp$dur_int[results_stop_asp$asp == "no"]))
plot(density(results_stop_asp$dur_int[results_stop_asp$asp == "yes"]))

wilcox.test(results_stop$dur_int~results_stop$asp)
wilcox.test(results_nasal$dur_int~results_nasal$asp)
wilcox.test(results_stop_asp$dur_voic~results_stop_asp$asp)
wilcox.test(results_stop_nasp$dur_int~results_stop_nasp$asp)

boxplot(results_try$dur_voic~results_try$cons1)

#wilcox.test(results_try$dur_int[results_try$cons1 == "asp"], 
#            results_try$dur_int[results_try$cons1 == "nasp"])

boxplot(results_stop_asp$dur_v_to_m[results_stop_asp$asp == "yes"],
        results_stop_asp$dur_voic[results_stop_asp$asp == "no"])

boxplot(results_stop_asp$abs_voic~results_stop_asp$asp)

wilcox.test(results_stop_asp$abs_voic~results_stop_asp$asp)

plot(density(results_stop_asp$dur_v_to_m[results_stop_nasp$asp == "yes"]))


results_cc <- subset(results, contx == "cc")
cc_stop <- subset(results_cc, manner == "stop")
cc_nasal <- subset(results_cc, manner == "nasal")
cc_lateral <- subset(results_cc, manner == "lateral")
cc_rhotic <- subset(results_cc, manner == "rhotic")

boxplot(norm_abs_voic ~ asp,
        data = cc_stop,
        names = c("non-asp", "asp"),
        ylab = "duration (s)",
        main = "Duration (in seconds) of modal voicing in (C)VCC(V) words"
)
mean(cc_stop$abs_voic[cc_stop$asp == "yes"])
mean(cc_stop$abs_voic[cc_stop$asp == "no"])

wilcox.test(norm_abs_voic ~ asp, data = cc_stop)


wilcox.test(mono$abs_voic, bi$abs_voic)

norm_abs_voic_mono_density <- density(mono$abs_voic)
norm_abs_voic_bi_density <- density(bi$abs_voic)

norm_abs_voic_density_x <- c(norm_abs_voic_mono_density$x, 
                             norm_abs_voic_bi_density$x)
norm_abs_voic_density_y <- c(norm_abs_voic_mono_density$y, 
                             norm_abs_voic_bi_density$y)

x.limits <- range(norm_abs_voic_density_x)
y.limits <- range(norm_abs_voic_density_y)

plot(
    c(), c(),
    xlim = x.limits,
    ylim = y.limits,
    xlab = "duration (s)", ylab = "density"
)

lines(norm_abs_voic_mono_density, lw = 1, col = "blue")
lines(norm_abs_voic_bi_density, lw = 1, col = "red")

wilcox.test(mono$v_to_rel, bi$v_to_rel)

boxplot(mono$v_to_rel, bi$v_to_rel)

#### Analysis ####


results_raw <- read.csv("~/Documents/Projects/mathesis-is/analysis/results.csv")
words <- read.csv("~/Documents/Projects/mathesis-is/task/task-src/words.csv")

results <- merge(results_raw, words, by.x = "word", by.y = "lex")

results_mono <- subset(results, syl_no == "mono")
results_bi <- subset(results, syl_no == "bi")

#### Stops ####

results_mono_stop <- subset(results_mono, manner == "stop")
results_mono_asp_stop <- subset(results_mono_stop, cons1 == "asp")
results_mono_nasp_stop <- subset(results_mono_stop, cons1 == "nasp")
results_mono_voi_stop <- subset(results_mono_stop, cons1 == "voi")
results_mono_vls_stop <- subset(results_mono_stop, cons1 == "vls")
results_mono_no_stop <- subset(results_mono_stop, cons1 == "no")

results_bi_stop <- subset(results_bi, manner == "stop")
results_bi_asp_stop <- subset(results_bi_stop, cons1 == "asp")
results_bi_nasp_stop <- subset(results_bi_stop, cons1 == "nasp")


#### Mono aspirated C1, stops ####
plot(density(results_mono_asp_stop$norm_abs_voic))
boxplot(results_mono_asp_stop$norm_abs_voic~results_mono_asp_stop$asp)
shapiro.test(results_mono_asp_stop$norm_abs_voic)

t.test(results_mono_asp_stop$norm_abs_voic~results_mono_asp_stop$asp)


#### Mono non-aspirated C1, stops ####
plot(density(results_mono_nasp_stop$norm_abs_voic))
boxplot(results_mono_nasp_stop$norm_abs_voic~results_mono_nasp_stop$asp)
shapiro.test(results_mono_nasp_stop$norm_abs_voic)

t.test(results_mono_nasp_stop$norm_abs_voic~results_mono_nasp_stop$asp)

#### Mono voiced C1, stops ####
plot(density(results_mono_voi_stop$norm_abs_voic))
boxplot(results_mono_voi_stop$norm_abs_voic~results_mono_voi_stop$asp)
shapiro.test(results_mono_voi_stop$norm_abs_voic)

wilcox.test(results_mono_voi_stop$norm_abs_voic~results_mono_voi_stop$asp)

#### Mono voiceless C1, stops ####
plot(density(results_mono_vls_stop$norm_abs_voic))
boxplot(results_mono_vls_stop$norm_abs_voic~results_mono_vls_stop$asp)
shapiro.test(results_mono_vls_stop$norm_abs_voic)

t.test(results_mono_vls_stop$norm_abs_voic~results_mono_vls_stop$asp)

#### Mono no C1, stops ####
plot(density(results_mono_no_stop$norm_abs_voic))
boxplot(results_mono_no_stop$norm_abs_voic~results_mono_no_stop$asp)
shapiro.test(results_mono_no_stop$norm_abs_voic)

wilcox.test(results_mono_no_stop$norm_abs_voic~results_mono_no_stop$asp)


#### Mono nasals ####

results_mono_nasal <- subset(results_mono, manner == "nasal")

plot(density(results_mono_nasal$norm_mann))
boxplot(results_mono_nasal$norm_mann~results_mono_nasal$asp)
shapiro.test(results_mono_nasal$norm_mann)

t.test(results_mono_nasal$norm_mann~results_mono_nasal$asp)

#### Mono laterals ####

results_mono_lateral <- subset(results_mono, manner == "lateral")

plot(density(results_mono_lateral$norm_mann))
boxplot(results_mono_lateral$norm_mann~results_mono_lateral$asp)
shapiro.test(results_mono_lateral$norm_mann)

t.test(results_mono_lateral$norm_mann~results_mono_lateral$asp)

#### Bi aspirated C1, stops ####
plot(density(results_bi_asp_stop$norm_abs_voic))
boxplot(results_bi_asp_stop$norm_abs_voic~results_bi_asp_stop$asp)
shapiro.test(results_bi_asp_stop$norm_abs_voic)

t.test(results_bi_asp_stop$norm_abs_voic~results_bi_asp_stop$asp)

#### Bi non-aspirated C1, stops ####
plot(density(results_bi_nasp_stop$norm_abs_voic))
boxplot(results_bi_nasp_stop$norm_abs_voic~results_bi_nasp_stop$asp)
shapiro.test(results_bi_nasp_stop$norm_abs_voic)

t.test(results_bi_nasp_stop$norm_abs_voic~results_bi_nasp_stop$asp)


#### Bi rhotics ####

results_bi_rhotic <- subset(results_bi, manner == "rhotic")

plot(density(results_bi_rhotic$norm_mann))
boxplot(results_bi_rhotic$norm_mann~results_bi_rhotic$asp)
shapiro.test(results_bi_rhotic$norm_mann)

t.test(results_bi_rhotic$norm_mann~results_bi_rhotic$asp)

#### Word length ####

plot(density(results_mono_stop$dur_word))
boxplot(results_mono_stop$dur_word~results_mono_stop$asp)
shapiro.test(results_mono_stop$dur_word)

wilcox.test(results_mono_stop$dur_word)
wilcox.test(results_mono_asp_stop$dur_word)

wilcox.test(results_mono_stop$dur_word~results_mono_stop$asp)
kruskal.test(results_mono_stop$dur_word~results_mono_stop$cons1)


#### Multiple regression

results_stop <- subset(results, manner == "stop")
results_son <- subset(results, manner != "stop")


model_stop <- lm(results_stop$norm_abs_voic ~ results_stop$asp)
model_stop <- lm(results_stop$norm_abs_voic ~ results_stop$asp +
                     results_stop$syl_no + results_stop$cons1)
model_stop <- lm(results_stop$norm_abs_voic ~ results_stop$asp:results_stop$syl_no)
summary(model_stop)

model_son <- lm(results_son$norm_mann ~ results_son$asp +
                    results_son$syl_no + results_son$cons1 +
                    results_son$manner)
model_son <- lm(results_son$norm_mann ~ results_son$asp:results_son$manner)
summary(model_son)

plot(density(log(results_stop$norm_abs_voic)))
plot(density(results_stop$norm_abs_voic))

boxplot(results$norm_abs_voic ~ results$syl_no)
plot(density(results$norm_abs_voic[results$syl_no == "mono"]))
plot(density(results$norm_abs_voic[results$syl_no == "bi"]))
shapiro.test(results$norm_abs_voic[results$syl_no == "mono"])
shapiro.test(results$norm_abs_voic[results$syl_no == "bi"])

wilcox.test(results_stop$norm_abs_voic ~ results_stop$syl_no)

model_abs_voic <- lm(results$norm_abs_voic ~ results$syl_no)
summary(model_abs_voic)

anova(lm(results_stop$norm_abs_voic ~ results_stop$asp +
             results_stop$syl_no + results_stop$cons1))

polr(norm_abs_voic ~ asp + syl_no + cons1, data = results_stop)

model <- glm(results_stop$norm_abs_voic ~ results_stop$asp +
                 results_stop$syl_no + results_stop$place)
summary(model)

# Is place of articulation of the target consonant affecting the lenght of the target vowel?

boxplot(results_stop$norm_abs_voic~results_stop$place)
kruskal.test(results_stop$norm_abs_voic, results_stop$place)

# Seems so...

model <- glm(results_stop$norm_abs_voic ~ results_stop$asp + results_stop$place)
summary(model)
plot(density(results_mono_stop$norm_abs_voic[results_mono_stop$asp == "yes"]))
plot(density(log(results_mono_asp_stop$norm_abs_voic[results_mono_asp_stop$asp == "yes"])))
shapiro.test(results_mono_asp_stop$norm_abs_voic)


t.test(results_mono_asp_stop$norm_abs_voic, results_bi_asp_stop$norm_abs_voic)

#### Closure measure ####
boxplot(norm_clos ~ asp, data = mono_stop)

#### Barplot ####
mean(mono_stop_asp$norm_abs_voic)
mean(mono_stop_asp$norm_clos)
mean(mono_stop_asp$norm_spread)
mean(mono_stop_nasp$norm_abs_voic)
mean(mono_stop_nasp$norm_clos)

#### Geminate duration ####
boxplot(results_stop$voffr[results_stop$asp == "no"],
        results_stop$mor[results_stop$asp == "yes"]
        )

t.test(results_stop$voffr[results_stop$asp == "no"],
            results_stop$mor[results_stop$asp == "yes"]
            )

results$syl_no = factor(results$syl_no,c("mono","di"))

boxplot(abs_voic ~ syl_no,
        data = results,
        names = c("disyllabic", "monosyllabic"),
        ylab = "duration (msec)"
)



