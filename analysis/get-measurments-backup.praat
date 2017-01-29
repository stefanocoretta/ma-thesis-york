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
    text textgrid_directory /Users/Stefano/Google Drive/Icelandic/audio/
    sentence textgrid_extension .TextGrid
    sentence result_file results.csv
endform

Create Strings as file list: "list", "'textgrid_directory$'*'textgrid_extension$'"
files_no = Get number of strings

if fileReadable (result_file$)
        pause The file 'result_file$' already exists! Do you want to overwrite it?
        filedelete 'result_file$'
endif

header$ = "file_name,idx,word,beg_word,end_word,dur_word,beg_voic,end_voic,dur_voic,
...beg_mann,end_mann,dur_mann,rels,dur_v_to_m,dur_clos,abs_voic,abs_clos,norm_voic,
...norm_mann,norm_v_to_m,norm_clos,norm_abs_voic,norm_abs_clos,vor,voffr,
...spread,norm_spread,mor'newline$'"
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

    index = 0
    for int_word to intervals_no
        lab_word$ = Get label of interval: word, int_word
        if lab_word$ <> ""
        index += 1
            begin_word = Get starting point: word, int_word
            end_word = Get end point: word, int_word
            duration_word = (end_word - begin_word) * 1000

            int_voic = Get interval at time: voic, begin_word
            label$ = Get label of interval: voic, int_voic
            if label$ <> ""
                begin_voic = Get starting point: voic, int_voic
                end_voic = Get end point: voic, int_voic
                duration_voic = (end_voic - begin_voic) * 1000
            else
                int_voic = int_voic + 1
                begin_voic = Get starting point: voic, int_voic
                end_voic = Get end point: voic, int_voic
                duration_voic = (end_voic - begin_voic) * 1000
            endif

            int_mann = Get interval at time: mann, end_voic - 0.00001
            label$ = Get label of interval: mann, int_mann
            if  label$ <> ""
                begin_mann = Get starting point: mann, int_mann
                end_mann = Get end point: mann, int_mann
                duration_mann = (end_mann - begin_mann) * 1000
#            else
#                begin_mann$ = ""
#                end_mann$ = ""
#                duration_mann$ = ""
            endif

            ind_rels = Get nearest index from time: rels, end_word
            time_rels = Get time of point: rels, ind_rels
            v_to_rel = (time_rels - begin_voic) * 1000
            voff_to_rel = (time_rels - end_voic) * 1000
            mor = (time_rels - begin_mann) * 1000
            norm_mor = mor / v_to_rel
            if label$ <> ""
                duration_v_to_m = (begin_mann - begin_voic) * 1000
                duration_closure = (time_rels - end_mann) * 1000
                duration_abs_closure = (time_rels - begin_mann) * 1000
                if label$ <> "spr"
                    duration_spread = (end_mann - end_voic) * 1000
                    norm_duration_spread = duration_spread / v_to_rel
                else
                    duration_spread = duration_mann
                    norm_duration_spread = norm_duration_mann
                endif
                if duration_spread == 0
                    duration_spread$ = ""
                    norm_duration_spread$ = ""
                else
                    duration_spread$ = string$(duration_spread)
                    norm_duration_spread$ = string$(norm_duration_spread)
                endif

            else
                duration_closure = (time_rels - end_voic) * 1000
                duration_spread$ = ""
                norm_duration_spread$ = ""
            endif
            if label$ <> ""
                norm_duration_voice = duration_voic / v_to_rel
                norm_duration_mann = duration_mann / v_to_rel
                norm_duration_v_to_m = duration_v_to_m / v_to_rel
                norm_abs_clos = duration_abs_closure / v_to_rel
                if time_rels > begin_word and time_rels < end_word
                    norm_duration_closure = duration_closure / v_to_rel
                    result_line$ = "'file_name$','index','lab_word$','begin_word','end_word','duration_word','begin_voic','end_voic','duration_voic','begin_mann','end_mann','duration_mann','time_rels','duration_v_to_m','duration_closure','duration_v_to_m','duration_abs_closure','norm_duration_voice','norm_duration_mann','norm_duration_v_to_m','norm_duration_closure','norm_duration_v_to_m','norm_abs_clos','v_to_rel','voff_to_rel','duration_spread$','norm_duration_spread$','mor''newline$'"
                    fileappend "'result_file$'" 'result_line$'
                else
                    result_line$ = "'file_name$','index','lab_word$','begin_word','end_word','duration_word','begin_voic','end_voic','duration_voic',,,,,,,,,'norm_duration_voice',,,,,,,,'duration_spread$','norm_duration_spread$','mor''newline$'"
                    fileappend "'result_file$'" 'result_line$'
                endif
            else
                norm_duration_voice = duration_voic / v_to_rel
                if time_rels > begin_word and time_rels < end_word
                    norm_duration_closure = duration_closure / duration_word
                    result_line$ = "'file_name$','index','lab_word$','begin_word','end_word','duration_word','begin_voic','end_voic','duration_voic',,,,'time_rels',,'duration_closure','duration_voic','duration_closure','norm_duration_voice',,,'norm_duration_closure','norm_duration_voice','norm_duration_closure','v_to_rel','voff_to_rel','duration_spread$','norm_duration_spread$','mor''newline$'"
                    fileappend "'result_file$'" 'result_line$'
                else
                    result_line$ = "'file_name$','index','lab_word$','begin_word','end_word','duration_word','begin_voic','end_voic','duration_voic',,,,,,,'duration_voic',,'norm_duration_voice',,,,'norm_duration_voice',,,,'duration_spread$','norm_duration_spread$','mor''newline$'"
                    fileappend "'result_file$'" 'result_line$'
                endif
            endif

        endif
    endfor
    selectObject: "Strings list"
endfor
