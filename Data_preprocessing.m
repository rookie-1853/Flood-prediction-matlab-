% Data preprocessing
function Data_preprocessing()
% Data reading
data=xlsread("train.csv",'train','B2:U1048576');

% deduplication
[uniqueData, ~, ~] = unique(data, 'rows');
data=xlsread("train.csv",'train','B2:V1048576');

data=data.';
% Abnormal data processing
f=zeros(1048575,1);
n=1048575;
for i=1:20
data1(1,:)=data(i,:);
% The data is sorted from smallest to largest
data1=sort(data1);
% Calculate the interquartile distance
q1(1,1) = prctile(data1, 25); % The first quartile
q3(1,1) = prctile(data1, 75); % The third quartile
% Calculate the interquartile distance
iqr(1,1) = q3(1,1) - q1(1,1);
q3(1,1)=q3(1,1)+1.5*iqr(1,1);
q1(1,1)=q1(1,1)-1.5*iqr(1,1);
% Marked exception data
for j=1:n
if data(i,j)<q1(1,1) || data(i,j)>q3(1,1)
f(j,1)=1;
end
end
end
% Delete abnormal data
data=data.';
s=1;
for i=1:n
if f(i,1)~=1
data2(s,:)=data(i,:);
s=s+1;
end
end