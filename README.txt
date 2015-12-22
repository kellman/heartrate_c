C++ code implementation

18-551 Group 2
Spring 2015
Michael Kellman

This directory contains the c++ code for extracting heart rate from video. The bulk of the code is located in:
	extractHR.cpp

The main of extractHR.cpp reads in spatially averaged color signals (RGB) and then extracts the heartrate using similar techniques as the matlab code, see comments in code for more specific details on implementation.

To compile and run the code just use commands:

make
./extractHR

Several libraries are included in this directory:
	KissFFT [1]
	JadeR [2]
	filter

KissFFT provides us with functionality to view the spectrum of the signals [1]. JadeR is an open source implementation of Independent Component Analysis (ICA)[2]. filter is a library that we wrote for applying filters to signals. This current version does not use the filter library, but it is included for future development.

Three test sets of data have been provided. These were recorded on android at 15 fps. All files contain data from 141 frames of video (~10 seconds).
	num1.txt (~65 bpm)
	num2.txt (~70 bpm)
	num3.txt (~65 bpm)


References;
[1] http://sourceforge.net/projects/kissfft/
[2] http://perso.telecom-paristech.fr/~cardoso/guidesepsou.html
