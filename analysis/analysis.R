## ----setup, include=FALSE, cache=FALSE-----------------------------------
library(knitr)
library(highlight)
opts_knit$set(root.dir=normalizePath('../'))
opts_chunk$set(fig.path='img/', fig=TRUE, out.width="0.6\\textwidth", echo=FALSE)

## ----start---------------------------------------------------------------
results_raw <- read.csv("analysis/results.csv")
words <- read.csv("task/task-src/words.csv")
results_all <- merge(results_raw, words, by.x = "word", by.y = "lex")
results <- subset(results_all, comp == "c")
results_stop <- subset(results, manner == "stop")
results_nas <- subset(results, manner == "nasal")
results_lat <- subset(results, manner == "lateral")
results_rho <- subset(results, manner == "rhotic")
results_son <- rbind(results_nas, results_lat, results_rho)
results_son <- droplevels(results_son)
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
test <- wilcox.test(vor ~ syl_no, data = results)

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
        main = "-VCC"
        )

## ----di-stop-vor, out.width="\\textwidth"--------------------------------
boxplot(vor ~ asp,
        data = di_stop,
        names = c("non-asp", "pre-asp"),
        ylab = "duration (msec)",
        main = "-VCCV"
        )

## ----mono-nas-vor, out.width="\\textwidth"-------------------------------
boxplot(vor ~ asp,
        data = mono_nas,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "-VNC"
        )

## ----di-nas-vor, out.width="\\textwidth"---------------------------------
boxplot(vor ~ asp,
        data = di_nas,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "-VNCV"
        )

## ----mono-lat-vor, out.width="\\textwidth"-------------------------------
boxplot(vor ~ asp,
        data = mono_lat,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "-VLC"
        )

## ----di-lat-vor, out.width="\\textwidth"---------------------------------
boxplot(vor ~ asp,
        data = di_lat,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "-VLCV"
        )

## ----di-rho-vor, out.width="0.6\\textwidth"------------------------------
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

## ----mono-stop-box-------------------------------------------------------
boxplot(norm_abs_voic ~ asp,
        data = mono_stop,
        names = c("non-asp", "pre-asp"),
        ylab = "duration (ratio)",
        main = "-VCC"
        )

## ----di-stop-box---------------------------------------------------------
boxplot(norm_abs_voic ~ asp,
        data = di_stop,
        names = c("non-asp", "pre-asp"),
        ylab = "duration (ratio)",
        main = "-VCCV"
        )

## ----mono-nas-box--------------------------------------------------------
boxplot(norm_abs_voic ~ asp,
        data = mono_nas,
        names = c("non-asp", "asp"),
        ylab = "duration (ratio)",
        main = "-VNC"
        )

## ----di-nas-box----------------------------------------------------------
boxplot(norm_abs_voic ~ asp,
        data = di_nas,
        names = c("non-asp", "asp"),
        ylab = "duration (ratio)",
        main = "-VNCV"
        )

## ----mono-lat-box--------------------------------------------------------
boxplot(norm_abs_voic ~ asp,
        data = mono_lat,
        names = c("non-asp", "asp"),
        ylab = "duration (ratio)",
        main = "-VLC"
        )

## ----di-lat-box----------------------------------------------------------
boxplot(norm_abs_voic ~ asp,
        data = di_lat,
        names = c("non-asp", "asp"),
        ylab = "duration (ratio)",
        main = "-VLCV"
        )

## ----di-rho-box----------------------------------------------------------
boxplot(norm_abs_voic ~ asp,
        data = di_rho,
        names = c("non-asp", "asp"),
        ylab = "duration (ratio)",
        main = "VRCV"
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

## ----mono-lat-test, include=F--------------------------------------------
shapiro.test(mono_lat_asp$norm_abs_voic)
shapiro.test(mono_lat_nasp$norm_abs_voic)
t.test(norm_abs_voic ~ asp, data = mono_lat)

## ----di-lat-test, include=F----------------------------------------------
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

## ----di-lat-clos-box-----------------------------------------------------
boxplot(dur_clos ~ asp,
        data = di_lat,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "-LCV"
        )

## ----di-rho-clos-box-----------------------------------------------------
boxplot(dur_clos ~ asp,
        data = di_rho,
        names = c("non-asp", "asp"),
        ylab = "duration (msec)",
        main = "VRCV"
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



## ----discussion, child='rnw/discussion.Rnw'------------------------------

## ----voic-stop-----------------------------------------------------------
boxplot(norm_voic ~ asp,
        data = results_stop,
        names = c("non-asp", "pre-asp"),
        ylab = "duration (ratio)"
        )


