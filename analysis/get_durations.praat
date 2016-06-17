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
files_no = Get number of strings # _no = _number

# Check if the result file exists:
if fileReadable (result_file$)
	pause The file 'result_file$' already exists! Do you want to overwrite it?
	filedelete 'result_file$'
endif

# Create a header row for the result file: (remember to edit this if you add or change the analyses!)
header$ = "file_name,word,begin_int,end_int'newline$'"
fileappend "'result_file$'" 'header$'

#
for file to files_no
    file_name$ = Get string: file
    Read from file: "'textgrid_directory$''file_name$'"
    tiers_no = Get number of tiers
    for tier to tiers_no
        intervals_no = Get number of intervals: tier
        for interval to intervals_no
            label$ = Get label of interval: tier, interval
            if label$ <> ""
                begin = Get starting point: tier, interval
                end = Get end point: tier, interval
                duration = end - begin

                result_line$ = "'file_name$',"
                fileappend "'result_file$'" 'result_line$'
