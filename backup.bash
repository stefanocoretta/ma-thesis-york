## Push to external hard drive

rsync -anv --no-whole-file --exclude '*.DS_Store' --delete \
    ~/GitHub/ma-thesis-york/data \
    /Volumes/Seagate/language-data/ma-thesis-york/data

rsync -avz --no-whole-file --exclude '*.DS_Store' --delete \
    ~/GitHub/ma-thesis-york/data \
    /Volumes/Seagate/language-data/ma-thesis-york/data

## Pull data from external hard drive

rsync -anv --no-whole-file --exclude '*.DS_Store' \
    /Volumes/Seagate/language-data/ma-thesis-york/data \
    ~/GitHub/ma-thesis-york/data

rsync -avz --no-whole-file --exclude '*.DS_Store' \
    /Volumes/Seagate/language-data/ma-thesis-york/data \
    ~/GitHub/ma-thesis-york/data
