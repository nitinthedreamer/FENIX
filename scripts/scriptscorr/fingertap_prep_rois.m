 
%% prep rois 

%  ROI selection based on Neurosynth = independent ROIs

%  - 5 ROIs corresponding to Neurosynth term 'finger tapping'
%  - 2 ROIs as control -

% prep spheres of different radii
% 6, 10, 14, 18 mm

cd(scriptscorrdir)

%% Identify ROIs - peak MNI coords ns association test 

roi1_ns_sma = [-4 -6 56];  % SMA
roi2_ns_sm = [38 -20 52]; % R S1M1
roi3_ns_sm = [-36 -24 54]; % L S1M1
roi4_ns_dlpfc = [-58 2 32]; % L DLPFC 
roi5_ns_dlpfc = [56 26 40]; % R DLPFC 

% Control 
roi6_ns_pmtg = [-52 -40 2]; % L posterior MTG
roi7_ns_mpfc = [2 62 0]; % mpfc


% roi1_to_7
rois= [-4 -6 56
    38 -20 52
    -36 -24 54
    -58 2 32
    56 26 40
    -52 -40 2 
    2 62 0];

%% Create ROI masks

% load any img in MNI space -- doesn't matter which
img = which('gray_matter_mask.img'); 

% 6 mm radius
for i = 1:size(rois,1)
    dat = fmri_data(img);
    
    % make 6mm radius sphere. Our voxels here are 2x2x2
    indx = iimg_xyz2spheres(mm2voxel(rois(i,:),dat.volInfo),dat.volInfo.xyzlist,3);
    
    % save back into img, view to confirm, and write it to file
    dat.dat = indx; %orthviews(dat)
    write(dat, 'fname', sprintf('FT_6mmroi%d.nii',i),'overwrite')
end

% 10 mm radius
for i = 1:size(rois,1)
    dat = fmri_data(img);
    
    % make 10mm radius sphere. Our voxels here are 2x2x2
    indx = iimg_xyz2spheres(mm2voxel(rois(i,:),dat.volInfo),dat.volInfo.xyzlist,5);
    
    % save back into img, view to confirm, and write it to file
    dat.dat = indx; %orthviews(dat)
    write(dat, 'fname', sprintf('FT_10mmroi%d.nii',i),'overwrite')
end

% 14 mm radius
for i = 1:size(rois,1)
    dat = fmri_data(img);
    
    % make 14mm radius sphere. Our voxels here are 2x2x2
    indx = iimg_xyz2spheres(mm2voxel(rois(i,:),dat.volInfo),dat.volInfo.xyzlist,7);
    
    % save back into img, view to confirm, and write it to file
    dat.dat = indx; %orthviews(dat)
    write(dat, 'fname', sprintf('FT_14mmroi%d.nii',i),'overwrite')
end

% 18 mm radius
for i = 1:size(rois,1)
    dat = fmri_data(img);
    
     % make 18mm radius sphere. Our voxels here are 2x2x2
    indx = iimg_xyz2spheres(mm2voxel(rois(i,:),dat.volInfo),dat.volInfo.xyzlist,9);
    
    % save back into img, view to confirm, and write it to file
    dat.dat = indx; orthviews(dat)
    write(dat, 'fname', sprintf('FT_18mmroi%d.nii',i),'overwrite')
end

! mv FT*mm* rois

