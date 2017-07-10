%{
    EXAM 2
    Machine Learning (20CS6037)
    Q-3: Derivation of gradient descent training rule using Sigmoid data
    Name: AMAN SHRIVASTAVA
%}

function Sigmoid
    clc
    [input, class] = gen_sigmoid_classes(30); %Variable to store randomly generated input
    
    %Dividing input into training and test data
    training_input = input(1:20,:);
    training_class = class(1:20,:);
    
    test_input = input(21:30,:);
    test_class = class(21:30,:);
    
    eta = 0.01;
    
    %Function to generate Sigmoid Data
    function [data, class] = gen_sigmoid_classes(N)
        u=rand(2,N);
        x=(2*u-1)';
        y=sin(pi*x(:,1));
        z=ones(30,1);
        data=[z, x(:,1), x(:,2)];
        class=sign(x(:,2)-y);
    end
    len = length(training_input);
    
    sq_errorBatch = 1; %Squared Error    
    
    weights = -1 + 2.*rand(1,3); %Randomly assigning w0,w1,w2
    
    for i=[5,10,50,80,100] %testing after different values of epochs
        tic;
        Delta_Learning_Batch(i); %Function call to Batch Delta Learning Function
        toc;
        Delta_Testing_Batch(i); %Function call to Batch Delta Testing Function
    end
    
    function Delta_Learning_Batch(epoch)
        iter = 1; errBatch = [];
        while(sq_errorBatch > 0.01 && iter <= epoch)
            deltaW = [0 0 0]; %Initializing DeltaW value to zero for each weight value for each Iteration
            for j=1:len
                %Calculating Output for each Input training example
                outPutBatch = weights(1)*(training_input(j,1)+training_input(j,1)^2) + weights(2)*(training_input(j,2)+training_input(j,2)^2) + weights(3)*(training_input(j,3)+training_input(j,3)^2);
                class_diff_Batch = (training_class(j)-outPutBatch);
                %Updating DeltaW value
                for k=1:length(weights)
                    deltaW(k) = deltaW(k)+(eta*class_diff_Batch*training_input(j,k));
                end
                %Squared error for each input example
                errBatch(j) = class_diff_Batch*class_diff_Batch;
            end
            for k=1:length(weights) %Updating each weight after iterating over whole input training examples
                weights(k) = weights(k)+ deltaW(k);
            end
            sq_errorBatch = sum(errBatch)/len; %Error function for each iteration
            iter = iter+1;
        end %End Iterations/epochs
    end %End Function Delta_Leaning_Batch

    function Delta_Testing_Batch(iter)
        correct = 0;
        for j=1:length(test_input)
            outPut = weights(1)*test_input(j,1) + weights(2)*test_input(j,2) + weights(3)*test_input(j,3);
            
            if (outPut > 0 && test_class(j) == 1) || (outPut < 0 && test_class(j) == -1)
                correct = correct+1;
            end
        end
        fprintf('Accuracy for iteration %d: %d percent\n',iter,(correct*100)/10);
    end
end