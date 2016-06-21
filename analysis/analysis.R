

results <- read.csv("~/Documents/Projects/mathesis-is/analysis/results.csv")
words <- read.csv("~/Documents/Projects/mathesis-is/task/task-src/words.csv")

# need to check what can be compared with what

results$asp <- words[match(results$word, words$lex),"asp"]
results$manner <- words[match(results$word, words$lex),"manner"]
results_try <- merge(results, words, by.x = "word", by.y = "lex")

results_voi <- subset(results_try, label == "voi")

results_stop <- subset(results_voi, manner == "stop")
results_stop_asp <- subset(results_stop, cons1 == "asp")
results_stop_nasp <- subset(results_stop, cons1 == "nasp")
results_nasal <- subset(results_voi, manner == "nasal")

results_stop <- subset(results_voi, manner == "stop")

plot(density(results_stop$dur_int))
boxplot(results_stop$dur_int~results_stop$asp)

plot(density(results_stop_asp$dur_int))
boxplot(results_stop_asp$dur_int~results_stop_asp$asp)

plot(density(results_stop_nasp$dur_int))
boxplot(results_stop_nasp$dur_int~results_stop_nasp$asp)

plot(density(results_stop_asp$dur_int[results_stop_asp$asp == "no"]))
plot(density(results_stop_asp$dur_int[results_stop_asp$asp == "yes"]))

wilcox.test(results_stop$dur_int~results_stop$asp)
wilcox.test(results_nasal$dur_int~results_nasal$asp)
wilcox.test(results_stop_asp$dur_int~results_stop_asp$asp)
wilcox.test(results_stop_nasp$dur_int~results_stop_nasp$asp)

boxplot(results_try$dur_int~results_try$cons1)

wilcox.test(results_try$dur_int[results_try$cons1 == "asp"], 
            results_try$dur_int[results_try$cons1 == "nasp"])






