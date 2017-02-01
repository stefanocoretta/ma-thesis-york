## Push to external hard drive

rsync -anv --no-whole-file --exclude '*.DS_Store' --delete \
    ~/Documents/GitHub/ma-thesis-york \
    /Volumes/Multimedia/

rsync -avz --no-whole-file --delete --exclude '*.DS_Store' \
    ~/Documents/GitHub/ma-thesis-york \
    /Volumes/Multimedia/

## Pull data from external hard drive

rsync -anv --no-whole-file --exclude '*.DS_Store' \
    /Volumes/Multimedia/ma-thesis-york/data \
    ~/Documents/GitHub/ma-thesis-york/

rsync -avz --no-whole-file --exclude '*.DS_Store' \
    /Volumes/Multimedia/ma-thesis-york/data \
    ~/Documents/GitHub/ma-thesis-york/
