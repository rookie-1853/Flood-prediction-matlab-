% spearman calculation
function spearman_calculation()
% Set parameters
numSamples = 796576;
numFeatures = 20;

% Read data
features = xlsread ("Filtered data.csv",'Sheet1','B2:U796577');

% Generate probability data (random values between 0 and 1)
probabilities = xlsread("Filtered data .csv",'Sheet1','V2:V796577');

% Spearman correlation coefficient was calculated
% The corr function is used to calculate the correlation coefficient. 'Type', 'Spearman' specifies that the Spearman correlation coefficient is calculated
spearmanCorr = corr(features, probabilities, 'Type', 'Spearman');

% Display correlation coefficient
fprintf('Spearman correlation coefficient :\n');
disp(spearmanCorr);

% Visual correlation
% Draw a bar chart of correlation coefficients
figure;
spearmanCorr=sort(spearmanCorr, 'descend');
hBar=bar(spearmanCorr);
hBar.BarWidth = 0.4;
title('Spearman correlation coefficient');
xlabel('指标');
ylabel('Spearman correlation coefficient :\n');

% Set the horizontal scale position and label
xticks(1:numFeatures); % Set the scale position to ensure that there are 20 scales
xticklabels({'Topographic drainage ',' infrastructure deterioration ',' siltation ',' monsoon intensity ',' population score '...
'Landslides ',' climate change ',' ineffective disaster prevention ',' agricultural practices ',' watershed ',' policy factors ',' inadequate planning '...
'river management', 'urbanization', 'the dam quality', 'forest', 'coastal vulnerability' and 'lost', 'erosion', 'drainage system'});
% Rotate scale label Angle
xtickangle(45); 

% Marks the value of each data point on the bar chart
for i = 1:numFeatures
% Gets the column's X position and height
x = i; % X position is the index of the column
y = spearmanCorr(i); % height is the phase relation value
% Indicates the value above the column
text(x, y, sprintf('%.2f', y), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'FontSize', 8, 'Color', 'black');
end

