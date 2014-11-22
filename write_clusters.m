function write_clusters(fileName,clusters)
fileID = fopen(fileName,'w');
fprintf(fileID,'*Vertices %d\n',length(clusters));
for i=1:size(clusters)
    fprintf(fileID,'%d\n',clusters(i));
end
fclose(fileID);
end