out_directory$ = "../dissertation/img"

Create Strings as file list: "list", "../data/derived/samples"
number_strings = Get number of strings

for file to number_strings
	selectObject: "Strings list"
    file_name$ = Get string: file
    Read from file: "../data/derived/samples/'file_name$'"
endfor

####
# dokk
####

Erase all

start = 0.1
end = 0.5

Select inner viewport: 1, 5.5, 1.5, 3
selectObject: "Spectrogram dokk"
Paint: start, end, 0, 0, 100, "yes", 45, 6, 0, "no"
Draw inner box

Select inner viewport: 1, 5.5, 1, 3.5

selectObject: "TextGrid dokk"
Draw: start, end, "yes", "yes", "no"
Select inner viewport: 1, 5.5, 1, 1.5

selectObject: "Sound dokk"
Draw: start, end, 0, 0, "no", "Curve"

Select inner viewport: 1, 5.5, 1.5, 3
Axes: 0, end-start, 0, 8000
Marks left: 2, "yes", "yes", "no"
Text left: "no", "Frequency (Hz)"

Select inner viewport: 1, 5.5, 1, 3.5
Draw inner box
Marks bottom every: 1, 0.1, "yes", "yes", "no"
Text bottom: "yes", "Times (s)"


Select outer viewport: 0.5, 5.75, 0.75, 4
Save as PDF file: "'out_directory$'/dokk.pdf"

####
# kamb
####

Erase all

start = 224.35
end = 224.8

Select inner viewport: 1, 5.5, 1.5, 3
selectObject: "Spectrogram kamb"
Paint: 0, 0.45988662131519276, 0, 0, 100, "yes", 45, 6, 0, "no"
Draw inner box

Select inner viewport: 1, 5.5, 1, 4.5

selectObject: "TextGrid kamb"
Draw: start, end, "yes", "yes", "no"
Select inner viewport: 1, 5.5, 1, 1.5

selectObject: "Sound kamb"
Draw: start, end, 0, 0, "no", "Curve"

Select inner viewport: 1, 5.5, 1.5, 3
Axes: 0, end-start, 0, 8000
Marks left: 2, "yes", "yes", "no"
Text left: "no", "Frequency (Hz)"

Select inner viewport: 1, 5.5, 1, 4.5
Draw inner box
Marks bottom every: 1, 0.1, "yes", "yes", "no"
Text bottom: "yes", "Times (s)"


Select outer viewport: 0.5, 5.75, 0.75, 5
Save as PDF file: "'out_directory$'/kamb.pdf"

####
# kamp
####

Erase all

start = 300.96
end = 301.39

Select inner viewport: 1, 5.5, 1.5, 3
selectObject: "Spectrogram kamp"
Paint: 0, 0.4397732426303855, 0, 0, 100, "yes", 45, 6, 0, "no"
Draw inner box

Select inner viewport: 1, 5.5, 1, 4.5

selectObject: "TextGrid kamp"
Draw: start, end, "yes", "yes", "no"
Select inner viewport: 1, 5.5, 1, 1.5

selectObject: "Sound kamp"
Draw: start, end, 0, 0, "no", "Curve"

Select inner viewport: 1, 5.5, 1.5, 3
Axes: 0, end-start, 0, 8000
Marks left: 2, "yes", "yes", "no"
Text left: "no", "Frequency (Hz)"

Select inner viewport: 1, 5.5, 1, 4.5
Draw inner box
Marks bottom every: 1, 0.1, "yes", "yes", "no"
Text bottom: "yes", "Times (s)"


Select outer viewport: 0.5, 5.75, 0.75, 5
Save as PDF file: "'out_directory$'/kamp.pdf"

####
# duld
####

Erase all

start = 376.182
end = 376.62

Select inner viewport: 1, 5.5, 1.5, 3
selectObject: "Spectrogram duld"
Paint: 0, 0.4390249433106576, 0, 0, 100, "yes", 45, 6, 0, "no"
Draw inner box

Select inner viewport: 1, 5.5, 1, 4.5

selectObject: "TextGrid duld"
Draw: start, end, "yes", "yes", "no"
Select inner viewport: 1, 5.5, 1, 1.5

selectObject: "Sound duld"
Draw: start, end, 0, 0, "no", "Curve"

Select inner viewport: 1, 5.5, 1.5, 3
Axes: 0, end-start, 0, 8000
Marks left: 2, "yes", "yes", "no"
Text left: "no", "Frequency (Hz)"

Select inner viewport: 1, 5.5, 1, 4.5
Draw inner box
Marks bottom every: 1, 0.1, "yes", "yes", "no"
Text bottom: "yes", "Times (s)"


Select outer viewport: 0.5, 5.75, 0.75, 5
Save as PDF file: "'out_directory$'/duld.pdf"

####
# dult
####

Erase all

start = 100.63
end = 101.12

Select inner viewport: 1, 5.5, 1.5, 3
selectObject: "Spectrogram dult"
Paint: 0, 0.5273696145124717, 0, 0, 100, "yes", 45, 6, 0, "no"
Draw inner box

Select inner viewport: 1, 5.5, 1, 4.5

selectObject: "TextGrid dult"
Draw: start, end, "yes", "yes", "no"
Select inner viewport: 1, 5.5, 1, 1.5

selectObject: "Sound dult"
Draw: start, end, 0, 0, "no", "Curve"

Select inner viewport: 1, 5.5, 1.5, 3
Axes: 0, end-start, 0, 8000
Marks left: 2, "yes", "yes", "no"
Text left: "no", "Frequency (Hz)"

Select inner viewport: 1, 5.5, 1, 4.5
Draw inner box
Marks bottom every: 1, 0.1, "yes", "yes", "no"
Text bottom: "yes", "Times (s)"


Select outer viewport: 0.5, 5.75, 0.75, 5
Save as PDF file: "'out_directory$'/dult.pdf"

####
# kopp - release
####

Erase all

start = 0
end = 0.25

Select inner viewport: 1, 5.5, 1.5, 3
selectObject: "Spectrogram kopp"
Paint: start, end, 0, 0, 100, "yes", 45, 6, 0, "no"
Draw inner box

Select inner viewport: 1, 5.5, 1, 4

selectObject: "TextGrid kopp"
Draw: start, end, "yes", "yes", "no"
Select inner viewport: 1, 5.5, 1, 1.5

selectObject: "Sound kopp"
Draw: start, end, 0, 0, "no", "Curve"

Select inner viewport: 1, 5.5, 1.5, 3
Axes: 0, end-start, 0, 8000
Marks left: 2, "yes", "yes", "no"
Text left: "no", "Frequency (Hz)"

Select inner viewport: 1, 5.5, 1, 4
Draw inner box
Marks bottom every: 1, 0.1, "yes", "yes", "no"
Text bottom: "yes", "Times (s)"


Select outer viewport: 0.5, 5.75, 0.75, 4.5
Save as PDF file: "'out_directory$'/kopp.pdf"

####
# dokk spreading
####

Erase all

start = 0.1
end = 0.5

Select inner viewport: 1, 5.5, 1.5, 3
selectObject: "Spectrogram dokk"
Paint: start, end, 0, 0, 100, "yes", 45, 6, 0, "no"
Draw inner box

Select inner viewport: 1, 5.5, 1, 4.5

selectObject: "TextGrid dokk_spr"
Draw: start, end, "yes", "yes", "no"
Select inner viewport: 1, 5.5, 1, 1.5

selectObject: "Sound dokk"
Draw: start, end, 0, 0, "no", "Curve"

Select inner viewport: 1, 5.5, 1.5, 3
Axes: 0, end-start, 0, 8000
Marks left: 2, "yes", "yes", "no"
Text left: "no", "Frequency (Hz)"

Select inner viewport: 1, 5.5, 1, 4.5
Draw inner box
Marks bottom every: 1, 0.1, "yes", "yes", "no"
Text bottom: "yes", "Times (s)"


Select outer viewport: 0.5, 5.75, 0.75, 5
Save as PDF file: "'out_directory$'/dokk-spr.pdf"

####
# dogg spreading
####

Erase all

start = 0.1
end = 0.5

Select inner viewport: 1, 5.5, 1.5, 3
selectObject: "Spectrogram dogg"
Paint: start, end, 0, 0, 100, "yes", 45, 6, 0, "no"
Draw inner box

Select inner viewport: 1, 5.5, 1, 4.5

selectObject: "TextGrid dogg_spr"
Draw: start, end, "yes", "yes", "no"
Select inner viewport: 1, 5.5, 1, 1.5

selectObject: "Sound dogg"
Draw: start, end, 0, 0, "no", "Curve"

Select inner viewport: 1, 5.5, 1.5, 3
Axes: 0, end-start, 0, 8000
Marks left: 2, "yes", "yes", "no"
Text left: "no", "Frequency (Hz)"

Select inner viewport: 1, 5.5, 1, 4.5
Draw inner box
Marks bottom every: 1, 0.1, "yes", "yes", "no"
Text bottom: "yes", "Times (s)"


Select outer viewport: 0.5, 5.75, 0.75, 5
Save as PDF file: "'out_directory$'/dogg-spr.pdf"
