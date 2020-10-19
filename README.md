# MTEX_KS
# Author: Tianbi Zhang
A short MATLAB code that calculates the 24 variants of bcc orientations from on one fcc orientation based on the Kurdjumov-Sachs (KS) Orientation Relationship. The MTEX toolbox is required. The code was developed with MTEX version 5.2.4 and hence can be run on any later version of MTEX.

This is a relatively simple code to run. First, you will need an input of fcc orientation in terms of Euler angles (Bunge). This can be obtained from processing EBSD scan files (e.g. in TSL OIM Analysis). You can also input arbitrary angles to play with the code. Then the program will calculate the 24 variants based on the KS orientation relationship and plot the bcc variants on a (001) pole figure (equal area figures). 

This code can be useful for analyses for,Bain group analyses and checking of the orientation relationship in a prior austenite grain, etc. The user can also modify the orientation relationship to calculate the variants for e.g. Bain, Pitch, Nishiyama-Wasserman, Greninger-Troiano orientation relationships, etc.
