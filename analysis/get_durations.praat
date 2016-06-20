######################################
# get_durations.praat v0.1.0
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
# This script
######################################

form Select folder with TextGrid files
    comment Directory of TextGrid files. Include final '/'
    text textgrid_directory /Users/Stefano/Documents/IcelandicData/
    sentence textgrid_extension .TextGrid
    sentence result_file results.csv
endform

# Create a list of all the TextGrid files in the Directory
Create Strings as file list: "list", "'textgrid_directory$'*'textgrid_extension$'"
# _no = _number
files_no = Get number of strings

# Check if the result file exists:
if fileReadable (result_file$)
	pause The file 'result_file$' already exists! Do you want to overwrite it?
	filedelete 'result_file$'
endif

# Create a header row for the result file: (remember to edit this if you add or change the analyses!)
header$ = "file_name,word,label,begin_int,end_int,dur_int'newline$'"
fileappend "'result_file$'" 'header$'

# Give the indexes of the tiers
word = 2
voice = 3
fric = 4

#
for file to files_no
    file_name$ = Get string: file
    Read from file: "'textgrid_directory$''file_name$'"

    intervals_no = Get number of intervals: voice
    for interval to intervals_no
        label$ = Get label of interval: voice, interval
        if label$ <> ""
            begin = Get starting point: voice, interval
            end = Get end point: voice, interval
            duration = end - begin
            word_int = Get interval at time: word, end - 0.05
            word_label$ = Get label of interval: word, word_int
            result_line$ = "'file_name$','word_label$','label$','begin','end','duration''newline$'"
            fileappend "'result_file$'" 'result_line$'
        endif
    endfor

    intervals_no = Get number of intervals: fric
    for interval to intervals_no
        label$ = Get label of interval: fric, interval
        if label$ <> ""
            begin = Get starting point: fric, interval
            end = Get end point: fric, interval
            duration = end - begin
            word_int = Get interval at time: word, end
            word_label$ = Get label of interval: word, word_int
            result_line$ = "'file_name$','word_label$','label$','begin','end','duration''newline$'"
            fileappend "'result_file$'" 'result_line$'
        endif
    endfor

endfor
