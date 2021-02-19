cd $1

for f in *.txt;

do filename="$(basename  $f .txt)";
filename="$(basename $filename .bak)";

mkdir $filename;

mv $f $filename/$f

done