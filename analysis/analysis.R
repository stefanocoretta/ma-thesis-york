## ----setup, include=FALSE, cache=FALSE-----------------------------------
library(knitr)
library(highlight)
opts_knit$set(root.dir=normalizePath('../'))
opts_chunk$set(fig.path='img/', fig=TRUE, out.width="0.8\\textwidth", echo=FALSE, cache=FALSE)

## ----start---------------------------------------------------------------
results_raw <- read.csv("analysis/results.csv")
words <- read.csv("task/task-src/words.csv")
results_all <- merge(results_raw, words, by.x = "word", by.y = "lex")
results <- subset(results_all, comp == "c")
results <- droplevels(results)
results$syl_no = factor(results$syl_no,c("mono","di"))
results_stop <- subset(results, manner == "stop")
results_stop_asp <- subset(results_stop, asp == "yes")
results_stop_nasp <- subset(results_stop, asp == "no")
results_nas <- subset(results, manner == "nasal")
results_lat <- subset(results, manner == "lateral")
results_rho <- subset(results, manner == "rhotic")
results_son <- rbind(results_nas, results_lat, results_rho)
results_son <- droplevels(results_son)
results_asp <- subset(results, asp == "yes" & spread != "")
mono <- subset(results, syl_no == "mono")
di <- subset(results, syl_no == "di")
mono_c <- subset(mono, cons1 != "no")
mono_v <- subset(mono, cons1 == "no")
di_c <- subset(di, cons1 != "no")
di_v <- subset(di, cons1 == "no")
mono_stop <- subset(mono, manner == "stop")
mono_stop_asp <- subset(mono_stop, asp == "yes")
mono_stop_nasp <- subset(mono_stop, asp == "no")
mono_nas <- subset(mono, manner == "nasal")
mono_nas_asp <- subset(mono_nas, asp == "yes")
mono_nas_nasp <- subset(mono_nas, asp == "no")
mono_lat <- subset(mono, manner == "lateral")
mono_lat_asp <- subset(mono_lat, asp == "yes")
mono_lat_nasp <- subset(mono_lat, asp == "no")
di_stop <- subset(di, manner == "stop")
di_stop_asp <- subset(di_stop, asp == "yes")
di_stop_nasp <- subset(di_stop, asp == "no")
di_nas <- subset(di, manner == "nasal")
di_nas_asp <- subset(di_nas, asp == "yes")
di_nas_nasp <- subset(di_nas, asp == "no")
di_lat <- subset(di, manner == "lateral")
di_lat_asp <- subset(di_lat, asp == "yes")
di_lat_nasp <- subset(di_lat, asp == "no")
di_rho <- subset(di, manner == "rhotic")
di_rho_asp <- subset(di_rho, asp == "yes")
di_rho_nasp <- subset(di_rho, asp == "no")
asp <- rbind(mono_stop_asp, di_stop_asp, mono_nas_asp, di_nas_asp, mono_lat_asp, di_lat_asp, di_rho_asp)
asp <- droplevels(asp)
source("./analysis/games-howell.R")

## ----intro, child='rnw/intro.Rnw'----------------------------------------



## ----review, child='rnw/review.Rnw'--------------------------------------



## ----method, child='rnw/method.Rnw'--------------------------------------



## ----results, child='rnw/results.Rnw'------------------------------------

## ----word-duration-------------------------------------------------------
boxplot(mono_c$dur_word,
        mono_v$dur_word,
        di_c$dur_word,
        di_v$dur_word,
        names = c("CVCC", "VCC", "CVCCV", "VCCV"),
        ylab = "duration (msec)"
        )

## ----voic-syll, include=FALSE--------------------------------------------
shapiro.test(mono$norm_abs_voic)
shapiro.test(di$norm_abs_voic)
test <- wilcox.test(norm_abs_voic ~ syl_no, data = results)

shapiro.test(mono$vor)
shapiro.test(mono$vor)
wilcox.test(vor ~ syl_no, data = results)

## ----voic-syll-box-------------------------------------------------------
boxplot(abs_voic ~ syl_no,
        data = results,
        names = c("monosyllabic", "disyllabic"),
        ylab = "duration (msec)"
        )

## ----vor, include=FALSE--------------------------------------------------
shapiro.test(mono_stop_asp$vor)
shapiro.test(mono_stop_nasp$vor)
var.test(vor ~ asp, data = mono_stop)
t.test(vor ~ asp, data = mono_stop)

shapiro.test(di_stop_asp$vor)
shapiro.test(di_stop_nasp$vor)
var.test(vor ~ asp, data = di_stop)
wilcox.test(vor ~ asp, data = di_stop)

shapiro.test(mono_nas_asp$vor)
shapiro.test(mono_nas_nasp$vor)
var.test(vor ~ asp, data = mono_nas)
t.test(vor ~ asp, data = mono_nas)

shapiro.test(di_nas_asp$vor)
shapiro.test(di_nas_nasp$vor)
var.test(vor ~ asp, data = di_nas)
t.test(vor ~ asp, data = di_nas)

shapiro.test(mono_lat_asp$vor)
shapiro.test(mono_lat_nasp$vor)
var.test(vor ~ asp, data = mono_lat)
t.test(vor ~ asp, data = mono_lat)

shapiro.test(di_lat_asp$vor)
shapiro.test(di_lat_nasp$vor)
var.test(vor ~ asp, data = di_lat)
t.test(vor ~ asp, data = di_lat)

shapiro.test(di_rho_asp$vor)
shapiro.test(di_rho_nasp$vor)
var.test(vor ~ asp, data = di_rho)
t.test(vor ~ asp, data = di_rho)

## ----mono-stop-vor, out.width="\\textwidth"------------------------------
boxplot(vor ~ asp,
        data = mono_stop,
        names = c("non-asp", "pre-asp"),
        ylab = "duration (msec)",
        main = "-VKK",
        ylim = c(150,450)
        )

## ----di-stop-vor, out.width="\\textwidth"--------------------------------
boxplot(vor ~ asp,
        data = di_stop,
        names = c("non-asp", "pre-asp"),
        ylab = "duration (msec)",
        main = "-VKKV",
        ylim = c(150,450)
        )

## ----mono-nas-vor, out.width="\\textwidth"-------------------------------
boxplot(vor ~ asp,
        data = mono_nas,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "-VNC",
        ylim = c(150,450)
        )

## ----di-nas-vor, out.width="\\textwidth"---------------------------------
boxplot(vor ~ asp,
        data = di_nas,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "-VNCV",
        ylim = c(150,450)
        )

## ----mono-lat-vor, out.width="\\textwidth"-------------------------------
boxplot(vor ~ asp,
        data = mono_lat,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "-VLC",
        ylim = c(150,450)
        )

## ----di-lat-vor, out.width="\\textwidth"---------------------------------
boxplot(vor ~ asp,
        data = di_lat,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "-VLCV",
        ylim = c(150,450)
        )

## ----di-rho-vor----------------------------------------------------------
boxplot(vor ~ asp,
        data = di_rho,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "-VRCV"
        )

## ----mono-stop-test,include=F--------------------------------------------
shapiro.test(mono_stop_asp$norm_abs_voic)
shapiro.test(mono_stop_nasp$norm_abs_voic)
wilcox.test(norm_abs_voic ~ asp, data = mono_stop)

## ----mono-stop-box, out.width="\\textwidth"------------------------------
boxplot(norm_abs_voic ~ asp,
        data = mono_stop,
        names = c("non-asp", "pre-asp"),
        ylab = "duration (ratio)",
        main = "-VKK",
        ylim = c(0.10,0.60)
        )

## ----di-stop-box, out.width="\\textwidth"--------------------------------
boxplot(norm_abs_voic ~ asp,
        data = di_stop,
        names = c("non-asp", "pre-asp"),
        ylab = "duration (ratio)",
        main = "-VKKV",
        ylim = c(0.10,0.60)
        )

## ----mono-nas-box, out.width="\\textwidth"-------------------------------
boxplot(norm_abs_voic ~ asp,
        data = mono_nas,
        names = c("non-asp", "asp"),
        ylab = "duration (ratio)",
        main = "-VNC",
        ylim = c(0.10,0.60)
        )

## ----di-nas-box, out.width="\\textwidth"---------------------------------
boxplot(norm_abs_voic ~ asp,
        data = di_nas,
        names = c("non-asp", "asp"),
        ylab = "duration (ratio)",
        main = "-VNCV",
        ylim = c(0.10,0.60)
        )

## ----mono-lat-box, out.width="\\textwidth"-------------------------------
boxplot(norm_abs_voic ~ asp,
        data = mono_lat,
        names = c("non-asp", "asp"),
        ylab = "duration (ratio)",
        main = "-VLC",
        ylim = c(0.10,0.60)
        )

## ----di-lat-box, out.width="\\textwidth"---------------------------------
boxplot(norm_abs_voic ~ asp,
        data = di_lat,
        names = c("non-asp", "asp"),
        ylab = "duration (ratio)",
        main = "-VLCV",
        ylim = c(0.10,0.60)
        )

## ----di-rho-box----------------------------------------------------------
boxplot(norm_abs_voic ~ asp,
        data = di_rho,
        names = c("non-asp", "asp"),
        ylab = "duration (ratio)",
        main = "-VRCV",
        ylim = c(0.10,0.60)
        )

## ----di-stop-test,include=F----------------------------------------------
shapiro.test(di_stop_asp$norm_abs_voic)
shapiro.test(di_stop_nasp$norm_abs_voic)
t.test(norm_abs_voic ~ asp, data = di_stop)

## ----mono-nas-test, include=F--------------------------------------------
shapiro.test(mono_nas_asp$norm_abs_voic)
shapiro.test(mono_nas_nasp$norm_abs_voic)
wilcox.test(norm_abs_voic ~ asp, data = mono_nas)

## ----di-nas-test, include=F----------------------------------------------
shapiro.test(di_nas_asp$norm_abs_voic)
shapiro.test(di_nas_nasp$norm_abs_voic)
t.test(norm_abs_voic ~ asp, data = di_nas)

## ----mono-la\textit{t}-test, include=F-----------------------------------
shapiro.test(mono_lat_asp$norm_abs_voic)
shapiro.test(mono_lat_nasp$norm_abs_voic)
t.test(norm_abs_voic ~ asp, data = mono_lat)

## ----di-la\textit{t}-test, include=F-------------------------------------
shapiro.test(di_lat_asp$norm_abs_voic)
shapiro.test(di_lat_nasp$norm_abs_voic)
t.test(norm_abs_voic ~ asp, data = di_lat)

## ----di-rho-test, include=F----------------------------------------------
shapiro.test(di_rho_asp$norm_abs_voic)
shapiro.test(di_rho_nasp$norm_abs_voic)
t.test(norm_abs_voic ~ asp, data = di_rho)

## ----closure-test, include=FALSE-----------------------------------------
shapiro.test(mono_nas_asp$norm_clos)
shapiro.test(mono_nas_asp$norm_clos)
wilcox.test(norm_clos ~ asp, data = mono_nas)

shapiro.test(di_nas_asp$norm_clos)
shapiro.test(di_nas_asp$norm_clos)
t.test(norm_clos ~ asp, data = di_nas)

shapiro.test(mono_lat_asp$norm_clos)
shapiro.test(mono_lat_asp$norm_clos)
t.test(norm_clos ~ asp, data = mono_lat)

shapiro.test(di_lat_asp$norm_clos)
shapiro.test(di_lat_asp$norm_clos)
t.test(norm_clos ~ asp, data = di_lat) # p = 0.014

shapiro.test(di_rho_asp$norm_clos)
shapiro.test(di_rho_asp$norm_clos)
t.test(norm_clos ~ asp, data = di_rho) # p < 0.001

## ----di-lat-clos-box, out.width="\\textwidth"----------------------------
boxplot(dur_clos ~ asp,
        data = di_lat,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "-VLCV",
        ylim = c(40,140)
        )

## ----di-rho-clos-box, out.width="\\textwidth"----------------------------
boxplot(dur_clos ~ asp,
        data = di_rho,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "-VRCV",
        ylim = c(40,140)
        )

## ----glottal-test, include=FALSE-----------------------------------------
kruskal.test(spread ~ manner, data = results)
games.howell(results_asp$manner, results_asp$spread)

## ----gs-box, out.width="\\textwidth"-------------------------------------
boxplot(spread ~ manner,
        data = results_asp,
        names = c("lateral", "nasal", "trill", "stop"),
        ylab = "duration (msec)"
        )

## ----mann-dur-test, include=FALSE----------------------------------------
shapiro.test(mono_nas_asp$norm_mann)
shapiro.test(mono_nas_nasp$norm_mann)
wilcox.test(norm_mann ~ asp, data = mono_nas) # *

shapiro.test(di_nas_asp$norm_mann)
shapiro.test(di_nas_nasp$norm_mann)
wilcox.test(norm_mann ~ asp, data = di_nas) # ***

shapiro.test(mono_lat_asp$norm_mann)
shapiro.test(mono_lat_nasp$norm_mann)
t.test(norm_mann ~ asp, data = mono_lat) # ***

shapiro.test(di_lat_asp$norm_mann)
shapiro.test(di_lat_nasp$norm_mann)
t.test(norm_mann ~ asp, data = di_lat) # ***

shapiro.test(di_rho_asp$norm_mann)
shapiro.test(di_rho_nasp$norm_mann)
t.test(norm_mann ~ asp, data = di_rho) # ***

summary(lm(dur_mann ~ manner * asp + vor, data = results_son))


## ----discussion, child='rnw/discussion.Rnw'------------------------------

## ----dur-voic-test, include=FALSE----------------------------------------
shapiro.test(results_stop$dur_voic[results_stop$asp == "yes"])
shapiro.test(results_stop$dur_voic[results_stop$asp == "no"])
var.test(results_stop$dur_voic[results_stop$asp == "yes"], 
         results_stop$dur_voic[results_stop$asp == "no"])
wilcox.test(results_stop$dur_voic ~ results_stop$asp)

## ----vow-stop------------------------------------------------------------
boxplot(abs_voic ~ asp,
        data = results_stop,
        names = c("non-asp", "pre-asp"),
        ylab = "duration (msec)"
        )

## ----voicing-stop--------------------------------------------------------
boxplot(dur_voic ~ asp,
        data = results_stop,
        names = c("non-asp", "pre-asp"),
        ylab = "duration (msec)"
        )

## ----geminate-duration-test, include=FALSE-------------------------------
shapiro.test(results_stop_asp$abs_clos)
shapiro.test(results_stop_nasp$abs_clos)
t.test(abs_clos ~ asp, data = results_stop)

## ----geminates-duration--------------------------------------------------
boxplot(abs_clos ~ asp,
        data = results_stop,
        names = c("non-asp", "pre-asp"),
        ylab = "duration (msec)"
        )


## ----conclusion, child='rnw/conclusion.Rnw'------------------------------



