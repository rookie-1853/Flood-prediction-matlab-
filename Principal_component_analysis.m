% Principal component analysis
function Principal_component_analysis()
% Parameter setting
numSamples = 796576; % Sample size
numFeatures = 20; % Feature quantity

% Data reading
X = xlsread ("data.xlsx",'Sheet1','B2:U796577');
Y = xlsread("data.xlsx",'Sheet1','W2:W796577');

% Standardized data (centralized processing)
X_standardized = (X - mean(X)) ./ std(X);

% Perform principal component analysis
[coeff, score, latent, tsquared, explained] = pca(X_standardized);

% coeff: Coefficient matrix of principal components
% score: Principal component score
% latent: The eigenvalue of each principal component
% explained: Proportion of explanatory variance for each principal component

% Displays the weight of the principal component (i.e. the contribution of the original feature to the principal component)
disp('The weight of the principal component (load) :');
disp(coeff);

% Displays the proportion of explanatory variance for each principal component
disp('Proportion of explanatory variance for each principal component（%）：');
disp(explained);

% Calculate the contribution of the principal component to the target variable
% Selective principal component
numComponents = 20; 
X_reduced = score(:, 1:numComponents);

% Linear regression was performed using the first few principal components
lm = fitlm(X_reduced, Y);

% Displays detailed information about the regression model
disp('Details of the regression model (based on the first few principal components) :');
disp(lm);

% Shows the coefficient of each principal component (i.e. the contribution of the weight of the principal component to the target variable)
disp('Regression coefficient for each principal component (i.e. principal component weight)：');
disp(lm.Coefficients.Estimate(2:end));

% Plot the proportion of explanatory variance for the principal component
figure;
x=1:1:20;
x=x.';
hBar=bar(x,explained);;
hBar.BarWidth = 0.5;

% Add axis labels and headings
xlabel('Principal component');
ylabel('Proportion of variance explained (%)');
title('Proportion of explanatory variance of principal components');
ylim([4,5.5]);

% Add a data label above each column
for i = 1:20
text(i, explained(i), num2str(explained(i)), ...
'HorizontalAlignment', 'center', ...
'VerticalAlignment', 'bottom','FontSize',8);
end

% Set the X-axis scale position and label
xticks(1:20); % Set the scale position and make sure there are 20 scales
xticklabels({'Topographic drainage ',' policy factors ', 'ineffective disaster prevention ',' watershed ', 'coastal vulnerability ',' urbanization ',...
'Landslides ',' inadequate planning ', 'population scores ',' agricultural practices ', 'infrastructure deterioration ',' siltation ',...
'Climate change ',' monsoon intensity ', 'erosion ',' river management ', 'dam quality ',' wetland loss ',...
'Drainage ',' deforestation '}); % 20 labels

% Rotate scale label Angle
xtickangle(45);

% Add gridlines
grid on;

figure();
% Plot the cumulative interpretation variance ratio
plot(cumulativeExplained, '-o', 'LineWidth', 2, 'MarkerSize', 6, 'Color', 'r');
xlabel('Principal component');
ylabel('Proportion of cumulative explanatory variance (%)');
title('Cumulative explanatory variance ratio');

% Set the X-axis scale
xticks(1:20); % 确保有20个刻度
xticklabels({'Topographic drainage ',' policy factors ', 'ineffective disaster prevention ',' watershed ', 'coastal vulnerability ',' urbanization ',...
'Landslides ',' inadequate planning ', 'population scores ',' agricultural practices ', 'infrastructure deterioration ',' siltation ',...
'Climate change ',' monsoon intensity ', 'erosion ',' river management ', 'dam quality ',' wetland loss ',...
'Drainage ',' deforestation '});
xtickangle(45); % Rotate scale label Angle

% Add gridlines
grid on;

% Set the Y-axis limit
ylim([0, 100]);