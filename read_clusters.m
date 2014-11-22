function [map, numrecords] = read_clusters(fileName)
fileID = fopen(fileName,'r');
C = textscan(fileID, '%s','delimiter', '\n');
C = C{1,1};
vals = strsplit(C{1,1},' ');
numrecords = str2num(vals{1,2});
map = cell(numrecords,1);
for i = 1 : numrecords
    vals = strsplit(C{i+1,1},' ');
%   map{i,1} = (vals{1,1});
    map{i,1} = strrep(vals{1,2}, '"', '');
end
end