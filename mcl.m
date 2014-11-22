function [M,clusters]=mcl(A,numberOfNodes,r, map)

threshold=0;
I=eye(size(A,1));
M=((A+I));
dm=sum(M);
for i=1:size(M,2)
M(:,i)=M(:,i)/dm(i);
end


k=0;
while(1)
    t=M;
    M=M*M;
    
    
    if (isequal(t,M))
        isConverged=1;
        for g=1:size(M,2)
            [~, ~, s]=find(M(:,g));
            if range(s) == 0
            isConverged=isConverged&1;
            else
               isConverged=isConverged&0;  
               break;
            end
        end
        if(isConverged==1)
            break;
        end
    end
    
    M=M.^r;
    
    denom=sum(M);
    
    
    for i=1:size(M,2) 
        M(:,i)=(M(:,i)/denom(i));
    end
    
    M(M < threshold) = 0;
    k=k+1;
end

clusters=zeros(numberOfNodes,1);
clusterId = 1;

for i=1:size(M,1)
    %if(M(i,i)~=0)
     write =1;
       cluster = find((M(i,:)))';
      for j = 1:size(cluster)
            if(M(i,i)>0 && M(i,cluster(j))>0)
            clusters(cluster(j)) = clusterId;
            write=0;
%             else
%              clusters(cluster(j))=rootCluster;   
           end
       end
       if(write==0)
        clusterId = clusterId + 1;
       end
    %ends
end

% newClusters = zeros(numberOfNodes,1);
% for i = 1 : numberOfNodes
%     newClusters(map(i,2)) = clusters(i);
% end

k

end