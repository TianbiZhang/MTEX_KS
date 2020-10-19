%% KS_trial.m
% This code calculates the 24 BCC variants of the Kurdjumov-Sachs 
% orientation relationship (K-S OR) using a known FCC orientation
% Author: Tianbi Zhang
% August 21, 2019

% With reference from https://github.com/mtex-toolbox/mtex/issues/251
% mtex toolbox must be installed!

%--- Define the crystal symmetry of the various phases (Note: Phase ID should match the CTF file)
cs_fcc = crystalSymmetry('m-3m', [3.6599 3.6599 3.6599], 'mineral', 'fcc');
cs_bcc = crystalSymmetry('m-3m', [2.866 2.866 2.866], 'mineral', 'bcc');

%--- Define sample symmetry
ss = specimenSymmetry('triclinic'); 
% 'Triclinic' is used to produce a full pole figure.
% Actual sample symmetry should be close to orthorhombic.

%--- Define the Kurdjumov-Sachs OR
% This converts a bcc orientation to fcc. To get from fcc to bcc, use (orientation of fcc) * inv(fcc2bcc)
fcc2bcc = orientation('map',...
  Miller(1,1,1,cs_fcc),Miller(0,1,1,cs_bcc),...
  Miller(1,0,-1,cs_fcc),Miller(1,1,-1,cs_bcc));

% Define a single fcc orientation, e.g. from a piece of retained austenite
% use Miller indices, Euler Angle (Bunge), etc. as you want.
% fcc_ori = orientation.byMiller([1 2 3],[1 1 1],cs_fcc, ss) %{hkl}[uvw]
% convention
fcc_ori = orientation.byEuler(0*degree, 0*degree, 90*degree, cs_fcc)
bcc_ori_2 = orientation.byEuler(0*degree, 0*degree, 90*degree, cs_bcc)
% fcc_ori = orientation.byMiller([0 1 1],[1 0 0], cs_fcc)

%misorientations from v1 to other variants
fcc2_BCCvariants = fcc2bcc * cs_fcc.properGroup * inv(fcc2bcc); 

% calculate the first KS variant (BCC) from the given fcc orientation
va = fcc_ori * inv(fcc2bcc);

% calculate all the variants
v = va * fcc2_BCCvariants;
% 'plot' function in the output of 'v' will plot the orientations in the Euler space
% by default. 

% plot on a pole figure
% Plot the first
% variant only
% plotPDF(va, Miller({0,0,1},v.CS), 'MarkerSize',4, 'color','r') 

%plot all variants
figure
% plotPDF(fcc_ori, Miller({0,0,1},cs_fcc), 'MarkerSize',4, 'silent')
plotPDF(bcc_ori_2, Miller({0,0,1},cs_bcc), 'MarkerSize',6, 'silent')
hold on
plotPDF(v, Miller({0,0,1},v.CS), 'MarkerSize',6, 'silent')

%% backup code for misorientation analysis

% anglz_fcc2_BCCvariants = angle(fcc2_BCCvariants)./degree
% axz_fcc2_BCCvariants = axis(fcc2_BCCvariants);
% [axz_fcc2_BCCvariants.h axz_fcc2_BCCvariants.k axz_fcc2_BCCvariants.l]