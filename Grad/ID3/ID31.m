%{
    Machine Learning
    Assignment - 2
    Implementation of ID3 Algorithm for Iris Dataset
    Group Members:
        AJINKYA DHAVALE
        AADIL KHAN
        AMAN SHRIVASTAVA
%}


function DhavaleKhanShrivastavaAss2()
    iris = load('iris.dat'); % Loading Data Set
    newDat = iris; % Variable To store Discretized data
    Accuracy = {[],[],[],[]}; % Accuracy for K = 5,10,15,20
    n=1; % Index holder for above accuracy
    for k=[5,10,15,20] % Iterating over the values of K
        for m=1:10 % Iterating 10 times for each of the value of K
            attributes = [1 2 3 4]; % Attributes involved in each Iteration
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
            for i = 101:length(newDat(:,5)) % Making Iris-virginica and Iris-versicolor in same class
                newDat(i,5)=2;
            end
            randData = newDat(randperm(size(newDat,1)),:); % Random Data
            trainData = randData(1:100,:); 
            testData = randData(101:end,:); 
            %{
                Instead of generating whole Decision Tree, Rules are generated. 
                Those will be same as when generated while traversing Decision Tree
            %}
            rules={};
            attributeVal={[],[],[],[]}; % Storing values in each attribute
            for j=1:length(trainData)
                if ismember(trainData(j,1),attributeVal{1})==0
                    attributeVal{1}(end+1) = trainData(j,1);
                end
                if ismember(trainData(j,2),attributeVal{2})==0
                    attributeVal{2}(end+1) = trainData(j,2);
                end
                if ismember(trainData(j,3),attributeVal{3})==0
                    attributeVal{3}(end+1) = trainData(j,3);
                end
                if ismember(trainData(j,4),attributeVal{4})==0
                    attributeVal{4}(end+1) = trainData(j,4);
                end
            end
            nodes=[]; % Nodes at each level of tree
            I = []; % Information Gain at each node
            nodesInOrder=[]; % Nodes in the order of tree traversing
            ID3(0);
            Accuracy{n}(end+1) = Testing();
        end
        n = n+1;
    end
    
    % ID3 Algorithm
    function ID3(i)
        if i==0 % i=0 for Root Node
            node=0;
            [initEntropy,c] = InitEntropy(0,0,0,0); % Initial Entropy
            if c==0
                for var=1:length(attributes) % Information Gain for all the attributes
                    I = [I Gain(initEntropy,attributes(var),0,0)];
                end
                for var=1:length(I) % Identifying MAX Information Gain and Root Node
                    if I(var)==max(I)
                        node = attributes(var); % Node Element
                        attributes = attributes(attributes~=node);
                        I(var)=[];
                        nodes = [nodes node];
                        nodesInOrder = [nodesInOrder node];
                        break;
                    end
                end
                for var=1:length(attributeVal{node}) % Generating rules based on root node and its values
                    rules(end+1) = cellstr(strcat(num2str(node),'==',num2str(attributeVal{node}(var)),'@'));
                end
            end
        else % i>0 for rest of the tree except root node
            tempNodes=[]; node=0;
            for N=1:length(nodes)
                classCount=0; % Calculating if all data rows can be identified from node or not
                temp=attributeVal{nodes(N)};
                for q=1:length(attributeVal{nodes(N)}) % Iterating over values of last selected node
                    [initEntropy,c] = InitEntropy(nodes(N),attributeVal{nodes(N)}(q),0,0);
                    if c~=0
                        classCount=classCount+1;
                        % Identifying if rule present and assigning the identified class
                        for var1=1:length(rules) 
                            if ~isempty(strfind(rules{var1},strcat(num2str(nodes(N)),'==',num2str(attributeVal{nodes(N)}(q)),'@')))
                                rules{var1}=strcat(rules{var1},'#',num2str(c));
                                break;
                            end
                        end
                        temp = temp(temp~=attributeVal{nodes(N)}(q));
                        % Removing all those data rows which can be directly Classified from last node
                        cond=trainData(:,nodes(N))==attributeVal{nodes(N)}(q);
                        trainData(cond,:)=[];
                    end
                end
                if classCount==q
                   attributes=[];
                else % if more nodes are needed to Classify
                    for q=1:length(temp) % Iterating over remaining attributes
                        [initEntropy,c] = InitEntropy(nodes(N),temp(q),0,0);
                        ruleNo=0; tempRule='';
                        for var1=1:length(rules) % Identifying if rule present
                            if ~isempty(strfind(rules{var1},strcat(num2str(nodes(N)),'==',num2str(temp(q)),'@')))
                                ruleNo=var1;
                                tempRule = rules{var1};
                            end
                        end
                        % Iterating over remaining attributes for next possible node of the tree
                        for var1=1:length(attributes) 
                            I(var1) = Gain(initEntropy,attributes(var1),nodes(N),temp(q));
                        end
                        for var1=1:length(I) % Identifying MAX Information Gain and next Node
                            if I(var1)==max(I)
                                break;
                            end
                        end
                        node = attributes(var1); % Node Element except Root
                        attributes = attributes(attributes~=node);
                        I(var1)=[];
                        tempNodes=[tempNodes node];
                        nodesInOrder = [nodesInOrder node];
                        % Generating and Appending Tree Rules 
                        for var1=1:length(attributeVal{node})
                            if var1==1
                                rules{ruleNo} = strcat(' ',rules{ruleNo},' && ',num2str(node),'==',num2str(attributeVal{node}(var1)),'@');
                            else
                                rules(end+1)=cellstr(tempRule);
                                rules{length(rules)} = strcat(' ',rules{length(rules)},' && ',num2str(node),'==',num2str(attributeVal{node}(var1)),'@');
                            end
                        end
                    end
                end
            end % End of Iterating over nodes at each level
            nodes = tempNodes;
        end % End of subtree of root node
        if ~isempty(attributes)
            i = i+1;
            ID3(i); % Recursive Call to ID3 Algorithm for subsequent Nodes 
        end
    end

    % Function to Calculate Information Gain for each Attribute and its value
    function IG = Gain(entropy,att,prevAtt,prevVal)
        entropyAttr=trainData;
        [prob,val]=hist(entropyAttr(:,att),unique(entropyAttr(:,att)));
        prob = prob/(length(entropyAttr(:,att))); % Probability of different values of an attribute
        for var=1:length(val)
            [e,x] = InitEntropy(att,val(var),prevAtt,prevVal);
            prob(var) = prob(var)*e; % Multiplying Entropy of each value of an attribute with its Probability
        end
        % Subtracting Initial entropy with entropy of the given attribute to get Information Gain
        IG=entropy-sum(prob); 
    end

    %{
        Function to calculate initial entropy, initial entropy for a node and a value, 
        (-/+)entropy for an attribute and its value, given previos attribute(node))
    %}
    function [e,class] = InitEntropy(attr,val,prevAtt,prevVal)
        countP = 0;
        countN = 0;
        entropyAttr=trainData;
        temp=[];
        % Reducing data set when calculating entropy, given an attribute and value
        if val~=0 && prevAtt==0 && prevVal==0
            for var=1:length(entropyAttr(:,attr))
                if entropyAttr(var,attr)~=val
                    temp=[temp var];
                end
            end
            entropyAttr(temp,:)=[];
        elseif val~=0 && prevAtt~=0 && prevVal~=0
            for var=1:length(entropyAttr(:,attr))
                if entropyAttr(var,attr)~=val || entropyAttr(var,prevAtt)~=prevVal
                    temp=[temp var];
                end
            end
            entropyAttr(temp,:)=[];
        end
        for var=1:length(entropyAttr(:,5)) % Counting classes from the reduced data set, given an attribute
            if entropyAttr(var,5)==1
                countP = countP+1;
            end
            if entropyAttr(var,5)==2
                countN = countN+1;
            end
        end
        % Calculating probabilities for both of the classes
        p1 = countP/(countP+countN);
        p2 = countN/(countP+countN);
        term1 = (-p1*log2(p1));
        term2 = (-p2*log2(p2));
        if isnan(term1)
            e = term2;
            class = 2;
        elseif isnan(term2)
            e = term1;
            class = 1;
        else
            if isnan(term1) && isnan(term2)
                e=0;
            else
                e = term1+term2;
            end
            class = 0;
        end % Returning Entropy value and class value, if found
    end
    
    % Testing
    function acc = Testing()
        accuracy=0;
        for var1=1:length(testData(:,5))
            for var2=1:length(nodesInOrder)
                temp = strcat(num2str(nodesInOrder(var2)),'==',num2str(testData(var1,nodesInOrder(var2))));
                flag=0;
                for var3=1:length(rules)
                    rule = regexprep(rules{var3},'[@]',' ');
                    rule = strtrim(strsplit(rule,'#'));
                    if strcmp(rule(1),temp) % Matching Test data attributes and classes with Rules generated
                        if strcmp(rule(2),num2str(testData(var1,5)))
                            accuracy = accuracy+1; % Incrementing when matched
                        end
                        flag=1;
                        break;
                    end
                end
                if flag==0
                    temp = strcat(temp,' && ');
                end
            end
        end
        %disp(accuracy);
        acc = accuracy; % Returning accuracy for each iteration of each value of K
    end
    
    MAX_ACCURACY_5=max(Accuracy{1});
    MIN_ACCURACY_5=min(Accuracy{1});
    AVG_ACCURACY_5=mean(Accuracy{1});

    MAX_ACCURACY_10=max(Accuracy{2});
    MIN_ACCURACY_10=min(Accuracy{2});
    AVG_ACCURACY_10=mean(Accuracy{2});

    MAX_ACCURACY_15=max(Accuracy{3});
    MIN_ACCURACY_15=min(Accuracy{3});
    AVG_ACCURACY_15=mean(Accuracy{3});

    MAX_ACCURACY_20=max(Accuracy{4});
    MIN_ACCURACY_20=min(Accuracy{4});
    AVG_ACCURACY_20=mean(Accuracy{4});
    
    y0=[MAX_ACCURACY_5,MIN_ACCURACY_5,AVG_ACCURACY_5];
    y1=[MAX_ACCURACY_10,MIN_ACCURACY_10,AVG_ACCURACY_10];
    y2=[MAX_ACCURACY_15,MIN_ACCURACY_15,AVG_ACCURACY_15];
    y3=[MAX_ACCURACY_20,MIN_ACCURACY_20,AVG_ACCURACY_20];
    x=['MAX','MIN','AVG'];

    subplot(4,2,1)
    bar(Accuracy{1})
    xlabel('Iteration')
    ylabel('Accuracy for K=5')

    subplot(4,2,2)
    bar(y0);
    ylabel('Accuracy for K=5');

    subplot(4,2,3)
    bar(Accuracy{2})
    xlabel('Iteration');
    ylabel('Accuracy for K=10');

    subplot(4,2,4)
    bar(y1)
    ylabel('Accuracy for K=10');

    subplot(4,2,5)
    bar(Accuracy{3})
    xlabel('Iteration')
    ylabel('Accuracy for K=15')

    subplot(4,2,6)
    bar(y2)
    ylabel('Accuracy for K=15')

    subplot(4,2,7)
    bar(Accuracy{4})
    xlabel('Iteration')
    ylabel('Accuracy for K=20')

    subplot(4,2,8)
    bar(y3)
    ylabel('Accuracy for K=20')
    xlabel('1=MAX, 2=MIN, 3=AVG');
end