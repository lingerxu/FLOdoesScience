% This is a demo script for conducting two-sampled t-tests in matlab

% Clear the previous variables in the workspace
clearvars;

% state the full name of the input data file
filename = 'tea_time_data.xlsx';

% read file content and save them into a variable
input_file = importdata(filename);

% save the data portion of the file content into a variable.
experiment_data = input_file.data;

% retrieve the list of subjects
subject_list = experiment_data(:, 1);

% fetch variable 1
child_inhand_mean_duration = experiment_data(:, 2);

% fetch variable 2
MCDI_score = experiment_data(:, end);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This section of codes sorts subjects by the dependent variable
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. sort the selected dependent variable and get the sorted indexing list
[variable_sorted, index_sorted] = sort(child_inhand_mean_duration);

% 2. count the number of subjects
num_subjects = length(subject_list);

% 3. get the indexing list for the low group and high group
index_low = index_sorted(1:num_subjects/2);
index_high = index_sorted(num_subjects/2+1:end);

% 4. get the MDCI scores fro the low and high group
MCDI_low = MCDI_score(index_low);
MCDI_high = MCDI_score(index_high);

% 5. conduct ttest
[H,P,CI,STATS] = ttest2(MCDI_low, MCDI_high);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% display results
disp(P)
disp(STATS)
