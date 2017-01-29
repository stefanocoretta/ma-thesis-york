# Get measurements (Praat script)

## get-measurements.praat
```praat
<<<header>>>

<<<form>>>

<<<strings>>>

<<<results header>>>

<<<main loop>>>
```

## "form"
```praat
form Select folder with TextGrid files
    comment Directory of TextGrid files. Include final '/'
    text textgrid_directory /Users/Stefano/Documents/GitHub/icelandic-preaspiration/TextGrid/
    sentence textgrid_extension .TextGrid
    sentence result_file results.csv
endform
```

Now we can create a list of the TextGrid files and create the result file.
The extension `_no` in variable names means `_number`.
Then we check if the result file already exists and if it does, we prompt the user if she wants to overwrite it.

## "strings"
```praat
Create Strings as file list: "list", "'textgrid_directory$'*'textgrid_extension$'"
files_no = Get number of strings

if fileReadable (result_file$)
	pause The file 'result_file$' already exists! Do you want to overwrite it?
	filedelete 'result_file$'
endif
```

We prepare the header of the result file and append it to it.
The result file is created in the same folder where the script is.
Finally, let's give the indexes of each tier.

## "results header"
```praat
header$ = "speaker,idx,word,beg_word,end_word,dur_word,beg_voic,end_voic,dur_voic,
...beg_mann,end_mann,dur_mann,rels,dur_vowel,dur_cc,dur_clos,vor,voffr,
...mor'newline$'"
fileappend "'result_file$'" 'header$'

sent = 1
word = 2
voic = 3
mann = 4
rels = 5
```



## "main loop"
```praat
for file to files_no
    selectObject: "Strings list"

    file_name$ = Get string: file
    Read from file: "'textgrid_directory$''file_name$'"

    intervals_no = Get number of intervals: word
    under_index = index(file_name$, "_")
    speaker$ = left$(file_name$, under_index - 1)

    index = 0

    <<<words loop>>>
endfor
```

## "words loop"
```praat
for int_word to intervals_no
    lab_word$ = Get label of interval: word, int_word

    if lab_word$ <> ""
        index += 1

        begin_word = Get starting point: word, int_word
        end_word = Get end point: word, int_word
        dur_word = (end_word - begin_word) * 1000

        <<<voicing>>>

        <<<manner>>>

        <<<release>>>

        result_line$ = "'speaker$','index','lab_word$','begin_word','end_word','dur_word',
            ...'begin_voic','end_voic','dur_voic','begin_mann$','end_mann$',
            ...'dur_mann$','time_rels','dur_vowel$','dur_cc$','dur_clos$',
            ...'vor$','voffr$','mor$''newline$'"
        fileappend "'result_file$'" 'result_line$'
    endif
endfor
```

## "voicing"
```praat
int_voic = Get interval at time: voic, begin_word
label$ = Get label of interval: voic, int_voic
if label$ <> ""
    begin_voic = Get starting point: voic, int_voic
    end_voic = Get end point: voic, int_voic
    dur_voic = (end_voic - begin_voic) * 1000
else
    int_voic = int_voic + 1
    begin_voic = Get starting point: voic, int_voic
    end_voic = Get end point: voic, int_voic
    dur_voic = (end_voic - begin_voic) * 1000
endif
```

## "manner"
```praat
int_mann = Get interval at time: mann, end_voic - 0.00001
label$ = Get label of interval: mann, int_mann
if  label$ <> ""
    begin_mann = Get starting point: mann, int_mann
    end_mann = Get end point: mann, int_mann
    dur_mann = (end_mann - begin_mann) * 1000

    begin_mann$ = string$(begin_mann)
    end_mann$ = string$(end_mann)
    dur_mann$ = string$(dur_mann)
else
    begin_mann$ = ""
    end_mann$ = ""
    dur_mann$ = ""
endif
```

## "release"
```praat
ind_rels = Get nearest index from time: rels, end_word
time_rels = Get time of point: rels, ind_rels
if time_rels > begin_word and time_rels < end_word
    if label$ <> ""
        dur_clos = (time_rels - end_mann) * 1000
        son_spread = (end_mann - end_voic) * 1000
        son_spread$ = string$(son_spread)
        dur_cc = (time_rels - begin_mann) * 1000
    else
        dur_clos = (time_rels - end_voic) * 1000
        son_spread$ = ""
        dur_cc = dur_clos
    endif

    vor = (time_rels - begin_voic) * 1000
    voffr = (time_rels - end_voic) * 1000
    mor = (time_rels - begin_mann) * 1000

    dur_clos$ = string$(dur_clos)
    vor$ = string$(vor)
    voffr$ = string$(voffr)
    mor$ = string$(mor)
    dur_cc$ = string$(dur_cc)

else
    dur_clos$ = ""
    vor$ = ""
    voffr$ = ""
    mor$ = ""
endif

if label$ <> ""
    dur_vowel = (begin_mann - begin_voic) * 1000
    dur_vowel$ = string$(dur_vowel)
else
    dur_vowel = dur_voic
    dur_vowel$ = string$(dur_vowel)
endif
```

## "header"
```praat
######################################
# get_measurements.praat v0.1.0
######################################
# This script reads the TextGrid files in the specified folder and it extracts several measures from them.
######################################
# MIT License
#
# Copyright (c) 2016-2017 Stefano Coretta
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
```
