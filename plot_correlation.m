function [rvalue, pvalue] = plot_correlation(variable1, variable2, plot_args)
% This function computes and plots the correlation results between two
% lists of variables.

if isfield(plot_args, 'set_position')
    fig_position = plot_args.fig_position;
else
    fig_position = [10 10 1000 800];
end

if isfield(plot_args, 'is_save')
    is_save = plot_args.is_save;
else
    is_save = false;
end

if isfield(plot_args, 'is_visible')
    is_visible = plot_args.is_visible;
else
    is_visible = true;
end

if isfield(plot_args, 'xlabel')
    xlabel_str = plot_args.xlabel;
else
    xlabel_str = 'variable-1';
end

if isfield(plot_args, 'ylabel')
    ylabel_str = plot_args.ylabel;
else
    ylabel_str = 'variable-2';
end

if isfield(plot_args, 'title_str')
    title_str = plot_args.title_str;
else
    title_str = 'Correlation result: ';
end

if isfield(plot_args, 'plot_color')
    plot_color = plot_args.plot_color;
else
    plot_color = [0 0 1]; % color blue
end

mask_valid_var1 = ~isnan(variable1);
mask_valid_var2 = ~isnan(variable2);
mask_valid = mask_valid_var1 & mask_valid_var2;
num_valid_data = sum(mask_valid);

var1_valid = variable1(mask_valid);
var2_valid = variable2(mask_valid);

if is_visible
    h = figure('Position', fig_position, 'Visible', 'on');
else
    h = figure('Position', fig_position, 'Visible', 'off');
end
hold on;

[rvalue, pvalue] = corr(var1_valid, var2_valid);

for i = 1:num_valid_data
    plot(var1_valid(i), var2_valid(i), '*', 'Color', plot_color);
end
        
coeffs = polyfit(var1_valid, var2_valid, 1);
fittedX = linspace(min(var1_valid), max(var1_valid), 200);
fittedY = polyval(coeffs, fittedX);

plot(fittedX, fittedY, 'Color', plot_color, 'LineWidth', 1);

coeffs_str = sprintf('%s R=%.4f, p=%.4f', title_str, rvalue, pvalue);
title(coeffs_str);

xlabel(xlabel_str);
ylabel(ylabel_str);
hold off;

if is_save
    save_name = sprintf('Correlation %s', corr_legend);
    plot_savefile = fullfile(plot_args.save_path, [save_name '.png']);
    saveas(h, plot_savefile);
    close(h);
end