 
%% prep rois 

%  ROI selection based on Neurosynth = independent ROIs

%  - 5 ROIs corresponding to Neurosynth term 'stroop'
%  - 2 ROIs as control 

% prep spheres of different radii
% 6, 10, 14, 18 mm

cd(scriptscorrdir)

%% Identify ROIs

roi1_stroop = [4 22 38];  % ACC / SMA
roi2_stroop = [-40 6 32]; % L DLPFC1
roi3_stroop = [44 12 34];  % R DLPFC 
roi4_stroop = [-30 -56 48]; % L SPL
roi5_stroop = [30 -56 48]; % R SPL 

% control
roi6_stroop = [-54 4 -14]; % L temporal pole 
roi7_stroop = [14 -84 30]; % R cuneus


rois = [4 22 38 
    -40 6 32 
    44 12 34 
    -30 -56 48 
    30 -56 48
    -54 4 -14
    14 -84 30];

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
    write(dat, 'fname', sprintf('Stroop_6mmroi%d.nii',i),'overwrite')
end

% 10 mm radius
for i = 1:size(rois,1)
    dat = fmri_data(img);
    
    % make 10mm radius sphere. Our voxels here are 2x2x2
    indx = iimg_xyz2spheres(mm2voxel(rois(i,:),dat.volInfo),dat.volInfo.xyzlist,5);
    
    % save back into img, view to confirm, and write it to file
    dat.dat = indx; %orthviews(dat)
    write(dat, 'fname', sprintf('Stroop_10mmroi%d.nii',i),'overwrite')
end

% 14 mm radius
for i = 1:size(rois,1)
    dat = fmri_data(img);
    
    % make 14mm radius sphere. Our voxels here are 2x2x2
    indx = iimg_xyz2spheres(mm2voxel(rois(i,:),dat.volInfo),dat.volInfo.xyzlist,7);
    
    % save back into img, view to confirm, and write it to file
    dat.dat = indx; %orthviews(dat)
    write(dat, 'fname', sprintf('Stroop_14mmroi%d.nii',i),'overwrite')
end

% 18 mm radius
for i = 1:size(rois,1)
    dat = fmri_data(img);
    
     % make 18mm radius sphere. Our voxels here are 2x2x2
    indx = iimg_xyz2spheres(mm2voxel(rois(i,:),dat.volInfo),dat.volInfo.xyzlist,9);
    
    % save back into img, view to confirm, and write it to file
    dat.dat = indx; orthviews(dat)
    write(dat, 'fname', sprintf('Stroop_18mmroi%d.nii',i),'overwrite')
end


! mv Stroop*mm* rois
