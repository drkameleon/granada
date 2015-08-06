
rm -rf build/*

for f in ./libs/*.js; do
	cat $f >> ./build/granada.js;
done

for f in ./core/*.coffee; do 
	coffee -b -c $f;
done

mv ./core/granada.js ./core/granada.tmp

for f in ./core/*.js; do
	cat $f >> ./build/granada.js;
done

cat ./core/granada.tmp >> ./build/granada.js

rm ./core/*.js
rm ./core/*.tmp
