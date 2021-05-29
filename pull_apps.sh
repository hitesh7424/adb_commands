#!/bin/bash


echo pass 0 ==========================================

((flag = 1))
for k in $(ls); do
	if [ "$k" == "apps007" ]; then
		flag = 0
	fi
done

echo pass 1 ==========================================

if [ $flag == 1 ]; then
	mkdir apps007 
fi

echo pass 2 ==========================================

cd apps007
mkdir temp
mkdir renamed

echo pass 3 ==========================================

for i in $(adb shell pm list packages | cut -d= -f 1 | cut -d ":" -f 2); do

	adb pull $(adb shell pm path $i| cut -d= -f 1 | cut -d ":" -f 2) temp/
	
	cd temp/
	
	for j in $(ls); do
		echo pass 4 ==================================
		
				
		if [ "$j" == "base.apk" ]; then
			mv base.apk ../renamed/$i.apk
		else
			mv $j ../
		fi
		
	done
	
	cd ..
	
done
