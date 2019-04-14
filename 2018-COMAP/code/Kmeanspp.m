% Clustering method by improved Kmeans

function [centroid, result] = Kmeanspp(data, k, iteration)
% choose an initial cluster centroid randomly from data
centroid = data(randperm(size(data,1),1),:);
% choose other centroids (a total number of k-1) through roulette method
for i = 2:k
    distance_matrix = zeros(size(data,1),i-1);
    for j = 1:size(distance_matrix,1)
        for k = 1:size(distance_matrix,2)
            distance_matrix(j,k) = sum((data(j,:)-centroid(k,:)) .^ 2);
        end
    end
    % choose next centroid according to distances between samples and
    % previous cluster centroids.
    index = Roulettemethod(distance_matrix);
    %Calculate the kth centroid by using the first k-1 centroids
    centroid(i,:) = data(index,:);
    clear distance_matrix;
end

% following steps are same to original k-means
result = zeros(size(data,1),1);
distance_matrix = zeros(size(data,1), k);
SSE = [];
flag = 0;

for i = 1:iteration
    previous_result = result;
    % calculate distance between each sample and each centroid
    for j = 1:size(distance_matrix,1)
        for k = 1:size(centroid,1)
            distance_matrix(j,k) = sqrt(sum((data(j,:)-centroid(k,:)) .^ 2));
        end
    end
    
    % assign each sample to the nearest controid
    [~,result] = min(distance_matrix,[],2);
    SSE(i) = 0;
    % recalculate centroid locations after assignment
    for j = 1:k
        centroid(j,:) = mean(data(result(:,1) == j,:));
        [m, ~] = size(data(result(:,1)==j,:));
        % SSE represents the sum of square errors
        SSE(i) = SSE(i) + sum(sqrt(sum( (repmat(centroid(j,:),m,1) - data(result(:,1)==j,:)).^2, 2 )));
    end
    % if classified results on all samples do not change over 5 iteration, 
    % clustering process will stop
    if(result == previous_result)
        flag =flag +1;
        if flag == 5
            fprintf('Clustering over after %i iterations...\n',i);
            break;
        end
    end
end
colors = ['g','b','r','m','c','k'];
for i=1:k
    hold on
    plot3(centroid(i,1),centroid(i,2),centroid(i,3),'Marker','o','MarkerFaceColor',colors(i),'MarkerSize',8)
    hold on
    subdata = data(result(:,1)==i,:); % n numbers of point in ith class
    [n,~] = size(subdata);
    for j=1:n
        %'Color',[rand(),rand(),rand()]
        plot3(subdata(j,1),subdata(j,2),subdata(j,3),colors(i),'Marker','*','MarkerSize',5)
    end
end
figure;
plot(SSE,'-o')
title('SSE');

end
% grid on
% hold on
% xlabel('Z1-4');
% ylabel('Z2-4');
% zlabel('Z3-4');