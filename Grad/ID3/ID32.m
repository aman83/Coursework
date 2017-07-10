clc();
d1 = xlsread('data_banknote_authentication.xlsx');
cm = cov(d1);
disp(cm);
D10 = d1(d1(:,5)==0,:);
D11 = d1(d1(:,5)==1,:);
scatter(D10(:,1),D10(:,2),'r')
hold
scatter(D11(:,1),D11(:,2),'b');
tree = fitctree(d1(:,1:2), d1(:,5), 'MinLeaf', 40);
view(tree,'mode','graph');
training_Index = zeros(800,1);
training_Data = zeros(800,5);
validation_Index = zeros(200,1);
validation_Data = zeros(200,5);
test_Index = zeros(372,1);
test_Data = zeros(372,5);
j = 1;
while(1)
   out = randperm(1372,1);
   if(j <= 800)
       if(~any(training_Index == out))
           training_Data(j,:) = d1(out,:);
           training_Index(j) = out;
           j = j+1;
       end
   else
       break;
   end
end
j=1;
while(1)
   out = randperm(1372,1);
   if(j <= 200)
       if(~any(training_Index == out) && ~any(validation_Index == out))
           validation_Data(j,:) = d1(out,:);
           validation_Index(j) = out;
           j = j+1;
       end
   else
       break;
   end
end
j=1;
while(1)
   out = randperm(1372,1);
   if(j <= 372)
       if(~any(training_Index == out) && ~any(validation_Index == out) && ~any(test_Index == out))
           test_Data(j,:) = d1(out,:);
           test_Index(j) = out;
           j = j+1;
       end
   else
       break;
   end
end
test_Index = sort(test_Index);
for i=1:length(test_Index)
    fprintf('%d, ', test_Index(i));
end
fprintf('\n');
%Variable to store training data for selected decision tree
tree_Data = training_Data(:, 1:4);
class = training_Data(:,5);
valAccuracy = zeros(1,12); trainAccuracy = zeros(1,12); k = 1;
minLeaf = [1,2,5,10,15,20,25,30,35,40,45,50]; max_Accuracy = 0; toUse = 0;
for i = minLeaf
    tree = fitctree(tree_Data, class, 'MinLeaf', i);
    valLabel = predict(tree,validation_Data(:,1:4));
    trainLabel = predict(tree,training_Data(:,1:4));
    for j = 1:200
        if(validation_Data(j,5) == valLabel(j))
            valAccuracy(k) = valAccuracy(k) + 1;
        end
    end
    for j = 1:800
        if(training_Data(j,5) == trainLabel(j))
            trainAccuracy(k) = trainAccuracy(k) + 1;
        end
    end
    valAccuracy(k) = (valAccuracy(k)/200)*100;
    trainAccuracy(k) = (trainAccuracy(k)/800)*100;
    if(max_Accuracy < valAccuracy(k))
        max_Accuracy = valAccuracy(k);
        toUse = k;
    end
    k = k + 1;
end
figure();
subplot(2,1,1)
plot(minLeaf,valAccuracy,'-p')
% xlabel('Parameter for')
% ylabel('Accuracy in %')

subplot(2,1,2)
plot(minLeaf,trainAccuracy,'-p')
% xlabel('Parameter')
% ylabel('Accuracy in %')


%6
tree = fitctree(tree_Data, class, 'MinLeaf', toUse);
view(tree,'mode','graph');
testLabel = predict(tree,test_Data(:,1:4));
cp = confusionmat(test_Data(:,5),testLabel);
accuracy_Test = (cp(1,1) + cp(2,2))/(cp(1,1) + cp(1,2) + cp(2,1) + cp(2,2));
precision_Test = cp(1,1)/(cp(1,1) + cp(2,1));
recall_Test = cp(1,1)/(cp(1,1) + cp(1,2));

labelC0 = []; C0 = [];
labelC1 = []; C1 = [];
for i=1:372
    if(test_Data(i,5) == 0)
        labelC0(end+1) = testLabel(i);
        C0(end+1) = 0;
    end
end
cp = confusionmat(C0,labelC0);
%conMat = cp.DiagnosticTable;
disp(cp);
precision0 = cp(1,1)/(cp(1,1) + cp(2,1));
recall0 = cp(1,1)/(cp(1,1) + cp(1,2));


for i=1:372
    if(test_Data(i,5) == 1)
        labelC1(end+1) = testLabel(i);
        C1(end+1) = 0;
    end
end
cp = confusionmat(C1,labelC1);
disp(cp);
%conMat = cp.DiagnosticTable;
precision1 = cp(1,1)/(cp(1,1) + cp(2,1));
recall1 = cp(1,1)/(cp(1,1) + cp(1,2));


perceptron_Data = d1(:,1:2).';
perceptron_Class = d1(:,5).';
net = perceptron;
net.trainParam.epochs = 20;
net = train(net,perceptron_Data,perceptron_Class);
view(net);
w = net.iw{1,1}; b = net.b{1};
D10 = d1(d1(:,5)==0,:);
D11 = d1(d1(:,5)==1,:);
figure();
scatter(D10(:,1),D10(:,2),'y')
hold
scatter(D11(:,1),D11(:,2),'r')
hold on
plotpc(w,b)