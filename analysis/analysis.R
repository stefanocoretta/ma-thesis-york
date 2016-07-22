
results_raw <- read.csv("~/Documents/Projects/mathesis-is/analysis/results.csv")
words <- read.csv("~/Documents/Projects/mathesis-is/task/task-src/words.csv")

results <- merge(results_raw, words, by.x = "word", by.y = "lex")

results_mono <- subset(results, syl_no == 1)
results_bi <- subset(results, syl_no == 2)

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

wilcox.test(results_mono_asp_stop$norm_abs_voic~results_mono_asp_stop$asp)

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

plot(density(results_mono_nasal$norm_abs_voic))
boxplot(results_mono_nasal$norm_abs_voic~results_mono_nasal$asp)
shapiro.test(results_mono_nasal$norm_abs_voic)

t.test(results_mono_nasal$norm_abs_voic~results_mono_nasal$asp)

#### Mono laterals ####

results_mono_lateral <- subset(results_mono, manner == "lateral")

plot(density(results_mono_lateral$norm_abs_voic))
boxplot(results_mono_lateral$norm_abs_voic~results_mono_lateral$asp)
shapiro.test(results_mono_lateral$norm_abs_voic)

t.test(results_mono_lateral$norm_abs_voic~results_mono_lateral$asp)

#### Bi rhotics ####

results_bi_rhotic <- subset(results_bi, manner == "rhotic")

plot(density(results_bi_rhotic$norm_abs_voic))
boxplot(results_bi_rhotic$norm_abs_voic~results_bi_rhotic$asp)
shapiro.test(results_bi_rhotic$norm_abs_voic)

wilcox.test(results_bi_rhotic$norm_abs_voic~results_bi_rhotic$asp)


