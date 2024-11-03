% spearman calculation
function spearman_calculation()
% Set parameters
numSamples = 796576;
numFeatures = 20;

% Read data
features = xlsread ("Filtered data.xlsx",'Sheet1','B2:U796577');

% Generate probability data (random values between 0 and 1)
probabilities = xlsread("Filtered data .xlsx",'Sheet1','V2:V796577');

% Spearman correlation coefficient was calculated
% The corr function is used to calculate the correlation coefficient. 'Type', 'Spearman' specifies that the Spearman correlation coefficient is calculated
spearmanCorr = corr(features, probabilities, 'Type', 'Spearman');

% Display correlation coefficient
fprintf('Spearman相关系数:\n');
disp(spearmanCorr);

% Visual correlation
% Draw a bar chart of correlation coefficients
figure;
spearmanCorr=sort(spearmanCorr, 'descend');
hBar=bar(spearmanCorr);
hBar.BarWidth = 0.4;
title('Spearman相关系数');
xlabel('指标');
ylabel('Spearman相关系数');

% Set the horizontal scale position and label
xticks(1:numFeatures); % Set the scale position to ensure that there are 20 scales
xticklabels({'地形排水','基础设施恶化','淤积','季风强度','人口得分'...
'滑坡','气候变化','无效防灾','农业实践','流域','政策因素','规划不足'...
'河流管理','城市化','大坝质量','森林砍伐','海岸脆弱性','湿地损失','侵蚀','排水系统'});
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

