% Partial Charlotte, NC Adopted FY2020 Budget (General Fund, Total Expenditures) as a Bar Chart

clc;
clear all;

%% Departments / Divisions

T = readtable('Charlotte.xlsx')
div = categorical(T.Dept_Division);
funds = T.GeneralFund2020.*10^-6;  % US$ millions


%% Plotting

% Plot horizontal bar chart 
close all;
barchart = barh(div, funds);
title({'2020 General Fund', 'Charlotte, NC', '\fontsize{18} Partial Budget'});
xlabel({'US$ Millions', '\fontsize{8} Source: FY 2020 Adopted Budget (Total Expenditures in General Fund) - City of Charlotte'});
ax=gca;
ax.XGrid='on';
set(ax, 'TickLength', [0,0]);

% Get all (x,y) datatip coordinatess
all_xtips = barchart.YEndPoints + 0.3; % add padding
all_ytips = barchart.XEndPoints;

% initialize data tip (x,y) coordinates and labels
xtips = [];
ytips = [];
labels = [];

% assemble vectors
for i = 1:length(div)
    xtips = [xtips barchart.YEndPoints(i)+1];
    ytips = [ytips barchart.XEndPoints(i)];
    labels = [labels round(barchart.YData(i), 2)];
end
labels = string(labels);

text(xtips, ytips , labels, 'VerticalAlignment','middle', 'FontSize', 8); % add datatip labels
