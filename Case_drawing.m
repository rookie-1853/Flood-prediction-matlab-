% Case drawing
function Case_drawing()
% Data reading
data=xlsread("train.csv",'train','B2:U1048576');
% Box plotting
boxplot(data);
title('洪水指标箱线图');
xlabel('洪水指标');
ylabel('数值');
% Set the horizontal scale position and label
xticks(1:20);
xticklabels({'季风强度','地形排水','河流管理','森林砍伐','城市化','气候变化',...
'大坝质量','淤积','农业实践','侵蚀','无效防灾','排水系统','海岸脆弱性','滑坡',...
'流域','基础设施恶化','人口得分','湿地损失','规划不足','政策因素'});
% Rotate the scale label Angle
xtickangle(45);