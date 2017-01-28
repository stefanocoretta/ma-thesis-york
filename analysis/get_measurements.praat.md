# Get measurements (Praat script)

## get_measurements.praat
```praat
<<<header>>>

<<<form>>>

<<<strings>>>

<<<results header>>>

<<<main loop>>>
```

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

    <<<>>>

endfor
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
