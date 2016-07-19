
results_raw <- read.csv("~/Documents/Projects/mathesis-is/analysis/results.csv")
words <- read.csv("~/Documents/Projects/mathesis-is/task/task-src/words.csv")

results <- merge(results_raw, words, by.x = "word", by.y = "lex")

results_mono <- subset(results, syl_no == 1)
results_bi <- subset(results, syl_no == 2)

results_mono_stop <- subset(results_mono, manner == "stop")
results_mono_stop_asp <- subset(results_mono_stop, cons1 == "asp")
results_mono_stop_nasp <- subset(results_mono_stop, cons1 == "nasp")

boxplot(results_mono_stop_asp$norm_voic~results_mono_stop_asp$asp)

