

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










