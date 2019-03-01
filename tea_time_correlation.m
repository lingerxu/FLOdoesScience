% This is a demo script for computing correlation score between two
% variables.

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

% compute correlation score and pvalue with the built-in function
[rvalue, pvalue] = corr(child_inhand_mean_duration, MCDI_score);

% display pvalue on the matlab console
disp(pvalue)
