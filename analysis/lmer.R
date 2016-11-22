library(lme4)

nastop=results_all[results_all$manner=='stop'|results_all$manner=='nasal',]
model <- lmer(abs_voic ~ (1|file_name)+(1|word)+ asp*manner, data = nastop)


model2 <- lmer(abs_voic ~ (1|file_name)+(1|word)+ manner+spread, data = nastop, subset=asp=='yes')
ggplot(nastop[nastop$asp=='yes',], aes(x=spread, y=abs_voic)) + geom_point() + facet_grid(~manner) + geom_smooth(method='lm')
