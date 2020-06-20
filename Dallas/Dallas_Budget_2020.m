% Partial FY2019-20 Budget for Dalllas, TX (General Fund) as a Bar Chart

clc;
clear all;

%% Departments / Divisions

T = readtable('Dallas.xlsx')
div = categorical(T.Dept_Division);
funds = T.GeneralFund2020.*10^-6;  % US$ millions


%% Plotting

% Plot horizontal bar chart 
close all;
barchart = barh(div, funds);
title({'FY2019-20 General Fund', 'Dallas, TX', '\fontsize{18} Partial Budget'});
xlabel({'US$ Millions', '\fontsize{9} *Offices of Community Care, Police Oversight, Environmental Quality & Sustainability, Fair Housing & Human Rights', '\fontsize{9}**Dallas Water Utilities', '\fontsize{8} Source: General Fund of FY2019-20 Budget - City of Dallas' });
ax=gca;
ax.XGrid='on';
set(ax, 'TickLength', [0,0]);

% Get all (x,y) datatip coordinatess
all_xtips = barchart.YEndPoints;
all_ytips = barchart.XEndPoints;

% initialize data tip (x,y) coordinates and labels
xtips = [];
ytips = [];
labels = [];

% assemble vectors
for i = 1:length(div)
    xtips = [xtips barchart.YEndPoints(i)+1]; % add padding
    ytips = [ytips barchart.XEndPoints(i)];
    labels = [labels round(barchart.YData(i), 2)];
end
labels = string(labels);

text(xtips, ytips , labels, 'VerticalAlignment','middle', 'FontSize', 8); % add datatip labels
