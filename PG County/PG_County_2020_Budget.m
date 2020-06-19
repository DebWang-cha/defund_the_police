    % Partial Prince George's County, MD FY2020 Budget (General Funds) as a Bar Chart

clc;
clear all;

%% Departments / Divisions

T = readtable('PG_County.xlsx')
div = categorical(T.Dept_Division);
funds = T.GeneralFund2020.*10^-6;  % US$ millions


%% Plotting

% Plot horizontal bar chart 
close all;
barchart = barh(div, funds);
title({'2020 General Fund', "Prince George's County, MD", '\fontsize{18} Partial Budget'});
xlabel({'US$ Millions', "\fontsize{8} Source: FY 2020 Approved Budget in Brief - Prince George's County"});
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
