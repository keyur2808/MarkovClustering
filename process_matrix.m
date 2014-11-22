function [adjacencyMatrix]=process_matrix(fileName,numberOfNodes,map)

clc;
fileID = fopen(fileName,'r');
C = textscan(fileID, '%s','delimiter', '\n');
C = C{1,1};
rawData= cell(size(C,1),2);
for i=1:size(C,1);
    vals = strsplit(C{i,1},' ');
    rawData{i,1} = (vals{1,1});
    rawData{i,2} = strrep(vals{1,2}, '"', '');
end
adjacencyMatrix=zeros(numberOfNodes);
numberOfEdges=size(rawData,1);

for i=1:numberOfEdges
[~, index1]=ismember(rawData(i,1),map);   
[~, index2]=ismember(rawData(i,2),map);
adjacencyMatrix(index1,index2)=1;
adjacencyMatrix(index2,index1)=1;
end
 
end
