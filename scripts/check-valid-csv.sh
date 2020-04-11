SOURCE="data-raw"

for file in $SOURCE/*.csv; do
    echo "checking $SOURCE/$(basename $file)..."
    csvclean -d ';' -n $SOURCE/$(basename $file) | tee logs/$(basename $file .csv).log
    echo "---"
done