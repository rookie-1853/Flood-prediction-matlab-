% k-means clustering
function k_means_clustering()
% Data reading
flood_prob =xlsread('Filter data.csv','Sheet1','V2:V796577');
% Flood probability data
% Sets the number of clusters for K-means clustering
k = 3; % Perform K-means clustering
[idx, C] = kmeans(flood_prob, k);
% Output the clustering result
disp('Clustering results for each data point:');
disp(table(flood_prob, idx, 'VariableNames', {'FloodProbability', 'ClusterID'}));
disp('Cluster center:');
disp(C);
% Plot result
figure;
scatter(flood_prob, zeros(size(flood_prob)), 100, idx, 'filled');
hold on;
plot(C, zeros(size(C)), 'kx', 'MarkerSize', 15, 'LineWidth', 2);
xlabel('Flood Probability');
ylabel('Cluster');
title('K-means Clustering of Flood Probabilities');
legend('Data Points', 'Cluster Centers');
grid on;
disp(accumarray(idx, 1)');
