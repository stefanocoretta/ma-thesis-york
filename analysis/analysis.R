

results <- read.csv("~/Documents/Projects/mathesis-is/analysis/results.csv")
words <- read.csv("~/Documents/Projects/mathesis-is/task/task-src/words.csv")

# need to check what can be compared with what

results$asp <- words[match(results$word, words$lex),"asp"]
results$manner <- words[match(results$word, words$lex),"manner"]
results_try <- merge(results, words, by.x = "word", by.y = "lex")

results_voi <- subset(results, label == "voi")

results_stop <- subset(results_voi, manner == "stop")
results_nasal <- subset(results_voi, manner == "nasal")

results_stop <- subset(results_voi, manner == "stop")

boxplot(results_stop$dur_int~results_stop$asp)
plot(density(results_stop$dur_int))

wilcox.test(results_stop$dur_int~results_stop$asp)
wilcox.test(results_nasal$dur_int~results_nasal$asp)
