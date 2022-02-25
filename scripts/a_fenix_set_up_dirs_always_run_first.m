
% Set up paths
% --------------------------------------------------------

% Base directory for whole study/analysis

basedir = '/Volumes/GoogleDrive/My Drive/B_FENIX/Analysis';

% Scripts are in this github-connected dir: 
scriptsdir = '/Applications/CODE/FENIX/scripts';

datadir = '/Users/marta/Documents/DATA/FENIX/Imaging/';

resultsdir = fullfile(basedir, 'results');
figsavedir = fullfile(resultsdir, 'figures');
roidir = fullfile(basedir, 'rois');
maskdir = fullfile(basedir, 'masks');

behdatadir =  '/Users/marta/Documents/DATA/FENIX/Behavior/'

% matlab timing files for the ptt task
timingspttdir = fullfile(behdatadir, 'timings_ptt');

% psychopy timing files for the other tasks 
timingspsychodir = fullfile(behdatadir,'timings_psychopy');

cleanedraw = fullfile(behdatadir,'cleaned_psychopy');

if ~exist(resultsdir, 'dir'), mkdir(resultsdir); end
if ~exist(figsavedir, 'dir'), mkdir(figsavedir); end
if ~exist(roidir, 'dir'), mkdir(roidir); end

addpath(scriptsdir);
cd(scriptsdir); 


% Display helper functions: Called by later scripts

dashes = '----------------------------------------------';
printstr = @(dashes) disp(dashes);
printhdr = @(str) fprintf('%s\n**%s**\n%s\n', dashes, str, dashes);
