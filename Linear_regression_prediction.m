%Linear regression prediction model
function Linear_regression_prediction()
% parameter setting
numSamples = 796576;  % Sample size
numFeatures = 20;  % number of features

% Data read
X = xlsread ("data.xlsx",'Sheet1','B2:U796577');
Y = xlsread("data.xlsx",'Sheet1','V2:V796577');

% Divide the data set into training and test sets
cv = cvpartition(numSamples, 'HoldOut', 0.3); % 30% test set, 70% training set
XTrain = X(training(cv), :);
YTrain = Y(training(cv));
XTest = X(test(cv), :);
YTest = Y(test(cv));

%Create a linear regression model
lm = fitlm(XTrain, YTrain, 'linear');

% Displays details of the regression model
disp(' Details of linear regression models :');
disp(lm);

% Displays details of the regression model
disp(' Details of linear regression models :');
disp(lm);

% Displays the linear regression expression
fprintf(' linear regression model expression :\n');
coefficients = lm.Coefficients.Estimate;
fprintf('Y = %.2f', coefficients(1));
for i = 2:length(coefficients)
fprintf(' + %.8f * X%d', coefficients(i), i-1);
end
fprintf('\n');

% Use models to make predictions
YPred = predict(lm, XTest);

% Calculates evaluation metrics
errors = YTest - YPred;
MAE = mean(abs(errors));
MSE = mean(errors.^2);
RMSE = sqrt(MSE);
R2 = lm.Rsquared.Ordinary;

% Output result
fprintf(' Mean absolute error (MAE): %.4f\n', MAE);
fprintf(' mean square error (MSE): %.4f\n', MSE);
fprintf(' root mean square error (RMSE): %.4f\n', RMSE);
fprintf(' Coefficient of determination (R²): %.4f\n', R2);

x=557605:1:796576;
x=x.';
%Plot multiple line plots
figure;
plot(x, YTest, '-b');  % The first broken line
hold on;
plot(x, YPred, '-r');  % Second fold line
xlabel('ID');
ylabel(' Flood probability ');
title(' Actual and predicted flood probability ');
legend(' Actual flood probability ',' predicted flood probability ');
grid on;
hold off;