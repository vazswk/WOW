%           EXAMPLE - USING "WOW" embedding distortion
%
% -------------------------------------------------------------------------
% Copyright (c) 2012 DDE Lab, Binghamton University, NY.
% All Rights Reserved.
% -------------------------------------------------------------------------
% Permission to use, copy, modify, and distribute this software for
% educational, research and non-profit purposes, without fee, and without a
% written agreement is hereby granted, provided that this copyright notice
% appears in all copies. The program is supplied "as is," without any
% accompanying services from DDE Lab. DDE Lab does not warrant the
% operation of the program will be uninterrupted or error-free. The
% end-user understands that the program was developed for research purposes
% and is advised not to rely exclusively on the program for any reason. In
% no event shall Binghamton University or DDE Lab be liable to any party
% for direct, indirect, special, incidental, or consequential damages,
% including lost profits, arising out of the use of this software. DDE Lab
% disclaims any warranties, and has no obligations to provide maintenance,
% support, updates, enhancements or modifications.
% -------------------------------------------------------------------------
% Author: Vojtech Holub
% -------------------------------------------------------------------------
% Contact: vojtech_holub@yahoo.com
%          fridrich@binghamton.edu
%          http://dde.binghamton.edu
% -------------------------------------------------------------------------
%%
clc;clear all;

indir = 'G:\suwenkang\data\SI\pgm';
Output_path = 'G:\suwenkang\stego\spatial';
feature_path1 = 'G:\suwenkang\feature\spatial\cover_2000.mat';
% my_SRMQ1_pgm(indir,feature_path1);

params.p = -1;  
payload = 0.2;   
x = 0;
err = zeros(2,6);
   % indir=[input '\'];
    feature_path2 = ['G:\suwenkang\feature\spatial\stego_2000' '_WOW_v0_2' num2str(payload*100) '.mat'];
    
    if exist(Output_path,'dir'); rmdir(Output_path,'s'); end    
    if ~exist(Output_path,'dir'); mkdir(Output_path); end

    flist = dir([indir '\*.pgm']);
    flen = length(flist);
    fprintf('%s%d\n', 'the num of the files: ',flen);
    tic
    for weight = 0:0.1:0.5
        x = x +1;
        params.w = weight;
        parfor i = 1:flen
           fprintf('%d%s\n',i, ['      processing image: ' flist(i).name]);
           in_file_name = [indir '\' flist(i).name];
           out_file_dir = [ Output_path '\' flist(i).name];
           cover = imread(in_file_name);   
           [stego, dist] = WOW_v0_2(cover, payload, params);
           stego=uint8(stego);
           imwrite(stego,out_file_dir,'pgm');  
           %show_s_dif(cover,stego);
        end
        toc

%%
        my_SRMQ1_pgm(Output_path,feature_path2);
        test_error = my_ensemble(feature_path1,feature_path2);
        err(1,x) = payload;
        err(2,x) = test_error;
   end

 err
 save ('err_0','err');