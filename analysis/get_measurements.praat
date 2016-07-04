######################################
# get_measurements.praat v0.1.0
######################################
# Copyright 2016 Stefano Coretta
#
# stefanocoretta.altervista.org
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <http://www.gnu.org/licenses/>.
######################################
# This script reads the TextGrid files in the specified folder and it extracts several measures from them.
######################################

form Select folder with TextGrid files
    comment Directory of TextGrid files. Include final '/'
    text textgrid_directory /Users/Stefano/Google Drive/Icelandic/data/
    sentence textgrid_extension .TextGrid
    sentence result_file results.csv
endform

Create Strings as file list: "list", "'textgrid_directory$'*'textgrid_extension$'"
files_no = Get number of strings

if fileReadable (result_file$)
        pause The file 'result_file$' already exists! Do you want to overwrite it?
        filedelete 'result_file$'
endif

header$ = "file_name,word,beg_word,end_word,dur_word,beg_voic,end_voic,dur_voic,beg_mann,
...end_mann, dur_mann,rels'newline$'"
fileappend "'result_file$'" 'header$'

sent = 1
word = 2
voic = 3
mann = 4
rels = 5

for file to files_no
    file_name$ = Get string: file
    Read from file: "'textgrid_directory$''file_name$'"

    intervals_no = Get number of intervals: word

    for int_word to intervals_no
        lab_word$ = Get label of interval: word, int_word
        if lab_word$ <> ""
            begin_word = Get starting point: word, int_word
            end_word = Get end point: word, int_word
            duration_word = end_word - begin_word

            int_voic = Get interval at time: voic, begin_word
            label$ = Get label of interval: voic, int_voic
            if label$ <> ""
                begin_voic = Get starting point: voic, int_voic
                end_voic = Get end point: voic, int_voic
                duration_voic = end_voic - begin_voic
            else
                int_voic = int_voic +1
                lab_voic = Get label of interval: voic, int_voic
                begin_voic = Get starting point: voic, int_voic
                end_voic = Get end point: voic, int_voic
                duration_voic = end_voic - begin_voic
            endif

            int_mann = Get interval at time: mann, end_voic - 0.00001
            label$ = Get label of interval: mann, int_mann
            if  label$ <> ""
                begin_mann = Get starting point: mann, int_mann
                end_mann = Get end point: mann, int_mann
                duration_mann = end_mann - begin_mann
            else
                begin_mann$ = ""
                end_mann$ = ""
                duration_mann$ = ""
            endif

            int_rels = Get nearest index from time: rels, end_word
            time_rels = Get time of point: rels, int_rels

            if label$ <> ""
                if time_rels > begin_word and time_rels < end_word
                    result_line$ = "'file_name$','lab_word$','begin_word',
                    ...'end_word','duration_word','begin_voic','end_voic',
                    ...'duration_voic','begin_mann','end_mann','duration_mann',
                    ...'time_rels''newline$'"
                    fileappend "'result_file$'" 'result_line$'
                else
                    result_line$ = "'file_name$','lab_word$','begin_word',
                    ...'end_word','duration_word','begin_voic','end_voic',
                    ...'duration_voic','begin_mann','end_mann','duration_mann',
                    ...'newline$'"
                    fileappend "'result_file$'" 'result_line$'
                endif
            else
                if time_rels > begin_word and time_rels < end_word
                    result_line$ = "'file_name$','lab_word$','begin_word',
                    ...'end_word','duration_word','begin_voic','end_voic',
                    ...'duration_voic','begin_mann$','end_mann$',
                    ...'duration_mann$','time_rels''newline$'"
                    fileappend "'result_file$'" 'result_line$'
                else
                    result_line$ = "'file_name$','lab_word$','begin_word',
                    ...'end_word','duration_word','begin_voic','end_voic',
                    ...'duration_voic','begin_mann$','end_mann$',
                    ...'duration_mann$','newline$'"
                    fileappend "'result_file$'" 'result_line$'
                endif
            endif

        endif
    endfor
    selectObject: "Strings list"
endfor

