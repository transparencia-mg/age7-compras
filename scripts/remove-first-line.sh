for i in data-raw/*.csv; do
    sed 1d $i > data/$(basename $i)
done