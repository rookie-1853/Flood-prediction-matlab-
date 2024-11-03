% Case drawing
function Case_drawing()
% Data reading
data=xlsread("train.csv",'train','B2:U1048576');
% Box plotting
boxplot(data);
title('Box map of flood indicators');
xlabel('Flood index');
ylabel('Numerical value');
% Set the horizontal scale position and label
xticks(1:20);
xticklabels({'Monsoon intensity ',' topographic drainage ',' river management ',' deforestation ',' urbanization ',' climate change ',...
'dam quality', 'fill', 'farming practices',' erosion ', 'invalid disaster prevention', 'drainage system', 'coastal vulnerability', 'landslide',...
'Watersheds ',' infrastructure deterioration ',' population score ',' wetland loss ',' inadequate planning ',' policy factors'});
% Rotate the scale label Angle
xtickangle(45);