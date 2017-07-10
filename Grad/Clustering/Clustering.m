%{
    Assignment - 3
    Intelligent Data Analysis
    Name: AMAN SHRIVASTAVA
%}
function Assignment3()
    clc(); clear all;
    data = xlsread('StudentData2.xlsx');
    clust1 = zeros(1,57); clust2 = zeros(1,57);
    Q1(); Q2(); Q3();
    function Q1()
        %Variable to store total SSE for each K value
        sseCluster = zeros(1,6);
        K = [5,6,7,8,9,10];
        for i = K
            %{
                Performing K-means algorithm over given Marks data
                clust(57x1 array): cluster #number for each 57 data point
                cen(Kx4 array): centroid values of each 'K' cluster
                sse(Kx1 array): sum of squared error for each 'K' cluster
            %}
            tempSSE = 1000000;
            Clust = zeros(57,1); Cen = zeros(i,4); Sse = zeros(i,1);
            for j=1:3
                [clust,cen,sse] = kmeans(data(:,2:5),i);
                if(sum(sse) < tempSSE)
                    tempSSE = sum(sse);
                    Clust = clust;
                    Cen = cen;
                    Sse = sse;
                end
            end
            fprintf('\nCluster centers for K = %d:\n',i);
            fprintf('\t\t  Phy        Maths          Eng        Music\n');
            disp(Cen);
            fprintf('\nSSE value of each cluster for K = %d:\n',i);
            disp(Sse);
            fprintf('\nTotal SSE value of Clustering for K = %d:\n',i);
            sseCluster(i-4) = sum(Sse);
            disp(sseCluster(i-4));
            %Plotting Silhouette for each point in each 'K' cluster for K=6
            %and K=10
            if(i==6)
                figure();
                silhouette(data(:,2:5),Clust);
            end
            if(i==10)
                figure();
                silhouette(data(:,2:5),Clust);
                clust1 = Clust;
            end
        end
        %Plotting Total SSE value for each 'K' clustering
        figure();
        plot(K,sseCluster,'-s');
        
        %Generating random 100x4 data between [0,100]
        randomData = zeros(100,4);
        for i=1:4
            for j=1:100
                randomData(j,i) = randi([0,100]);
            end
        end
        %Perorming K-means on random data
        [clust,cen,sse] = kmeans(randomData(:,1:4),10);
        %Centroid
        fprintf('\nCluster centers for K = %d:\n',10);
        disp(cen);
        %Population of each cluster
        for i=1:10
            population(i);
            fprintf('\nCentroid: ');
            disp(cen(i,:));
        end
        %SSE value for each cluster
        fprintf('\nSSE value of each cluster for K = %d:\n',10);
        disp(sse);
        %Total SSE value for clustering of random data
        fprintf('\nTotal SSE value of Clustering for K = %d:\n',10);
        disp(sum(sse));
        %Function to print data points in each cluster
        function population(N)
            fprintf('\nPoints in Cluster - %d:\n',N);
            count = 0;
            for i1=1:100
                if(clust(i1)==N)
                    %disp(randomData(i1,:));
                    count = count + 1;
                end
            end
            fprintf('Total Points: %d\n',count);
        end
    end
    function Q2()
    single = linkage(data(:,2:5));
    complete = linkage(data(:,2:5),'complete');
    figure();
    %Dendrogram for Single Link
    dendrogram(single,57);
    figure();
    %Dendrogram for Complete Link
    dendrogram(complete,57);
    %Cluster Composition for Single Link
    clusters1 = cluster(single,'maxclust',4);
    %Cluster Composition for Complete Link
    clusters2 = cluster(complete,'maxclust',4);
    %Storing in global variable for RandIndex
    clust2 = clusters1;
    ques2(clusters1);
    ques2(clusters2);
    %Calculatin Rand Index for Clustering-2 and Clustering-3
    randIndex23 = clusterCompare(clusters1,clusters2);
    fprintf('\n\nRand Index for Clustering-2 and Clustering-3: ');
    disp(randIndex23);
    %Function to Group data points in 4 clusters, calculating and printing
    %Centroids respectively
        function ques2(clusters)
            c1 = zeros(length(clusters(clusters==1)),5);
            c2 = zeros(length(clusters(clusters==2)),5);
            c3 = zeros(length(clusters(clusters==3)),5);
            c4 = zeros(length(clusters(clusters==4)),5);
            i1=1; i2=1;
            i3=1; i4=1;
            for i=1:length(clusters)
                if((clusters(i) == 1))
                    c1(i1,:) = data(i,:); 
                    i1 = i1+1;
                elseif((clusters(i) == 2))
                    c2(i2,:) = data(i,:); 
                    i2 = i2+1;
                elseif((clusters(i) == 3))
                    c3(i3,:) = data(i,:); 
                    i3 = i3+1;
                elseif((clusters(i) == 4))
                    c4(i4,:) = data(i,:); 
                    i4 = i4+1;
                end
            end
            centroid1 = Centroid(c1); centroid2 = Centroid(c2); centroid3 = Centroid(c3); centroid4 = Centroid(c4);
            display(1,c1,centroid1); display(2,c2,centroid2); display(3,c3,centroid3); display(4,c4,centroid4);
            %Function to calculate Centroids
            function temp = Centroid(C)
                temp(1) = sum(C(:,2))/length(C(:,1));
                temp(2) = sum(C(:,3))/length(C(:,1));
                temp(3) = sum(C(:,4))/length(C(:,1));
                temp(4) = sum(C(:,5))/length(C(:,1));
            end
            %Function to display Results
            function display(num,clust,cent)
                fprintf('\nPoints in Cluster-%d: \n',num);
                fprintf('    S.No  Phy  Maths  Eng  Music\n');
                disp(clust);
                fprintf('\nCentroid of Cluster-%d: \n',num);
                fprintf('   Phy      Maths      Eng       Music\n');
                disp(cent); 
            end
        end
    end
    function Q3()
        randIndex12 = clusterCompare(clust1,clust2);
        fprintf('\n\nRand Index for Clustering-1 and Clustering-2: ');
        disp(randIndex12);
    end
    function randI = clusterCompare(clusterA,clusterB)
        a=0; b=0; c=0; d=0;
        for i=1:56
            x1 = clusterA(i);
            y1 = clusterB(i);
            for j=(i+1):57
                x2 = clusterA(j);
                y2 = clusterB(j);
                if(x1==x2 && y1==y2)
                    a=a+1;
                elseif(x1==x2 && y1~=y2)
                    c=c+1;
                elseif(x1~=x2 && y1==y2)
                    d=d+1;
                elseif(x1~=x2 && y1~=y2)
                    b=b+1;
                end
            end
        end
        fprintf('\na: %d, b: %d, c: %d, d: %d\n',a,b,c,d);
        randI = (a+b)/(a+b+c+d);
    end
end