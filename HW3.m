clc;
clear;
[map1, numberOfNodes1]=read_clusters('attweb_net.net');
[adjacencyMatrix1]=process_matrix('attweb_net.txt',numberOfNodes1,map1);
[M1,clusters1]=mcl(adjacencyMatrix1,numberOfNodes1,1.35, map1);
write_clusters('attweb_net.clu',clusters1);

[map2, numberOfNodes2]=read_clusters('yeast_undirected_metabolic.net');
[adjacencyMatrix2]=process_matrix('yeast_undirected_metabolic.txt',numberOfNodes2,map2);
[M2,clusters2]=mcl(adjacencyMatrix2,numberOfNodes2,1.205,map2);
write_clusters('yeast_undirected_metabolic.clu',clusters2);

[map3, numberOfNodes3]=read_clusters('physics_collaboration_net.net');
[adjacencyMatrix3]=process_matrix('physics_collaboration_net.txt',numberOfNodes3,map3);
[M3,clusters3]=mcl(adjacencyMatrix3,numberOfNodes3,1.25, map3);
write_clusters('physics_collaboration_net.clu',clusters3);

