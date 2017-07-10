%{
    EXAM 2
    Machine Learning (20CS6037)
    Q-4: Implement Logistic Regression for TWO class classification of the
    iris data set.
    Name: AMAN SHRIVASTAVA
%}

clc
load('fisheriris');
[r, c]=size(meas);

% Extend meas by 1 to account for the bias
col1 = ones(r,1);
emeas=[col1 meas];

% extent of training sets
p=0.2;
%p=0.5;
%p=0.8;

%Assign numerical labels
class(150,1)=zeros();
class(1:50)=1;  %setosa
class(51:100)=2;  %versicolor
class(101:150)=3; %virginica

%Transform numerical lables into 0 / 1 labels
%case1:
% newclass(class==1)=0;   %setosa becomes class 0
% newclass(class==2)=1;   
% newclass(class==3)=1;

%case 2:
newclass(class==2)=0;   %versicolor becomes class 0
newclass(class==1)=1;   
newclass(class==3)=1;

%case3:
% newclass(class==3)=0;   %virginica becomes class 0
% newclass(class==2)=1;   
% newclass(class==1)=1;

randindex=randperm(r);
N = round(p*r);
disp(N);
%Dividing dataset into training and test data
train = emeas(randindex(1:N),:);
trainlabels = newclass(randindex(1:N));
test = emeas(randindex(N+1:r),:);
testlabels = newclass(randindex(N+1:r));

w=zeros(c+1,1);
ybar=mean(trainlabels);
w(1)=log(ybar/(1-ybar));
s=zeros(1,N);
z=zeros(N,1);
tempw=zeros(c+1);

% Iteratively Reweighted Least Squares (IRLS)
for j=1:10
    for i=1:N
        eta(i)=w(1)+train(i,:)* w;
        mu(i)=1/(1+exp(-eta(i)));
        s(i)=mu(i)*(1-mu(i));
        if s(i) < eps
            flag = 1; %Flag to show convergence
        end
        z(i)=eta(i)+((trainlabels(i)-mu(i))/s(i));
    end
    
    S=diag (s);
    old_w = w;
    w = inv(train' * S * train)*train' * S * z;
    
    for k=1:size(w,1)
        abs(w(k)-tempw(k));
        if(abs(w(k)-tempw(k))<=eps)
            flag = 1; %Flag to show convergence
        end
    end
    if flag == 1
       break;
    end
end


%Test
ltest=length(testlabels);


% Compute the output for each test data using w
for i=1:ltest,
    out(i)=test(i,:)*w;
end

% Transform output in 0 1 labels
out1=out;
out1(out<0)=0;
out1(out>0)=1;

% compute accuracy
accuracy = 1 - sum(abs(testlabels - out1))/ltest;
overlap = sum(abs(testlabels - out1));
fprintf('Accuracy: %f\nOverlap: %d\n',accuracy,overlap);
subplot(2,1,1)
    plotconfusion(testlabels, out1);    % plot confusion matrix
subplot(2,1,2)
    plotroc(testlabels, out1);          %plot ROC curves