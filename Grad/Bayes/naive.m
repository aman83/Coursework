% MACHINE LEARNING ASSIGNMENT 2
% PART 2: NAIVE BAYES
% by: DHAVALE,KHAN,SHRIVASTAVA

iris = load('iris.dat'); % Loading Data Set
newDat = iris; % Variable To store Discretized data

attributes = [1 2 3 4];
for i = 1:4 % Discretization Step
    mini = min(newDat(:,i));
    maxi = max(newDat(:,i));
    diff = (maxi-mini)/k;
    for j = 1:length(newDat(:,i))
        t=0;
        for p = 1:k
            if newDat(j,i)<=(p*diff+mini) && newDat(j,i)>=((p-1)*diff+mini) % Condition to check where does each data point fits in Intervals
                t=p;
            end
        end
        newDat(j,i)=t;
    end
end

for i = 101:length(newDat(:,5))
    newDat(i,5)=2;
end

randData = newDat(randperm(size(newDat,1)),:);
trainData = randData(1:75,:);         %defining a random training dataset
testData = randData(76:end,:);        %defining a random test dataset

%naive bayes:
total=size(trainData,1);
total1=size(testData,1);
sen=0;
ver=0;
a=1;
b=1;
for i = 1:total
    if trainData(i,5)==1
        sen=sen+1;                  %calculating no of setosa in training dataset
        s(a,:)=trainData(i,:);      %copying setosa in s matrix for convinient operations
        a=a+1;
    elseif trainData(i,5)==2
        ver=ver+1;                   %calculating no of ver in training dataset
        v(b,:)=trainData(i,:);       %copying ver in v matrix for convinient operations
        b=b+1;
    end
end

prior_sen = sen/total; %prior probability of sentosa[ p(sen) ]
prior_ver = ver/total; %prior probability of ver[ p(ver) ]

ms=mean(s); %mean of sentosa
mv=mean(v); %mean of ver
sds=std(s); %standard deviation of sentosa
sdv=std(v); %standard deviation of ver

gs1=gauss(testData(:,1),ms(:,1),sds(:,1));  % Probability of x's sepal lenght being setosa [ p(sen_petalLen|x_sepLen) ]
gs2=gauss(testData(:,2),ms(:,2),sds(:,2));  % Probability of x's sepal width being setosa [ p(sen_petalLen|x_sepWid) ]
gs3=gauss(testData(:,3),ms(:,3),sds(:,3));  % Probability of x's petal lenght being setosa [ p(sen_petalLen|x_petLen) ]
gs4=gauss(testData(:,4),ms(:,4),sds(:,4));  % Probability of x's petal width being setosa [ p(sen_petalLen|x_petWid) ]
gv1=gauss(testData(:,1),mv(:,1),sdv(:,1));  % Probability of x's sepal lenght being ver [ p(ver_sepLen|x_sepLen) ]
gv2=gauss(testData(:,2),mv(:,2),sdv(:,2));  % Probability of x's sepal width being ver [ p(ver_sepWid|x_sepWid) ]
gv3=gauss(testData(:,3),mv(:,3),sdv(:,3));  % Probability of x's petal lenght being ver [ p(ver_petLen|x_petLen) ]
gv4=gauss(testData(:,4),mv(:,4),sdv(:,4));  % Probability of x's petal width being ver [ p(ver_petWid|x_petWid) ]

for j = 1:total1
    final(j,1)=gs1(j,1)*gs2(j,1)*gs3(j,1)*gs4(j,1)*prior_sen;   %probability of data being setosa [ p(x|sen)=(p(sen|x))*p(sen)  ]
    final(j,2)=gv1(j,1)*gv2(j,1)*gv3(j,1)*gv4(j,1)*prior_ver;   %probability of data being ver     [ p(x|ver)=(p(ver|x))*p(ver)  ]
end

%comparing p(x|sen) and p(x|ver) for each x and storing in final(:,3),
%if p(x|sen)>p(x|ver), then x is setosa
%if p(x|sen)<p(x|ver), then x is ver
%%if p(x|sen)=p(x|ver), error in computation
for x = 1:total1
    if(final(x,1)==final(x,2))
        final(x,3)=0;
    elseif (final(x,1)>final(x,2))
        final(x,3)=1;
    elseif (final(x,1)<final(x,2))
        final(x,3)=2;
    end
end

%comparing the result of hypothesis with actual class of test data
%incrementing correct counter if correct
%incrementing incorrect counter if incorrect
correct=0;
incorrect=0;
for f = 1:total1
    if(final(f,3)==testData(f,5))
        correct=correct+1;
    else incorrect=incorrect+1;
    end
end
