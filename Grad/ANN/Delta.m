%{
    EXAM 2
    Machine Learning (20CS6037)
    Q-1: Implementation of Delta Training Rule for 100 epochs
    Name: AMAN SHRIVASTAVA
%}

function Delta
    clc
    training_input = {{[],[]}}; %Variable to store randomly generated input
    eta = [0.005 0.01 0.02 0.04 0.08]; %Taking 5 values of Eta in incremental order
    for i=1:10
        training_input(end+1) = Input_Generator();
    end
    %{
        Function to generate input {x1,x2} and it's class based on condition
        x1 + 2*x2 - 2 > 0 Or x1 + 2*x2 - 2 < 0
    %}
    function ip = Input_Generator
        r = floor(-5 + 10.*rand(1,2));
        r(2:end+1) = r;
        r(1) = 1;
        condition = r(2)+(2*r(3))-2;
        if(condition > 0)
            c = 1;
        else
            c = -1;
        end
        ip = {{r,c}};
    end
    training_input(1:end-1) = training_input(2:end);
    len = length(training_input);
    
    
    
    weights = -1 + 2.*rand(1,3); %Randomly assigning w0,w1,w2
    
    %Loop to test for each value of Eta for same training example
    for i=1:5
        et = eta(i);
        sq_error = 1; sq_errorBatch = 1; %Var to store Distinct Error Function
        E = []; E_Batch = []; %Var to store error for each iteration
        tic;
        Delta_Learning_Iterative(weights,et); %Function call to Iterative Delta Learning Function
        toc;
        tic;
        Delta_Learning_Batch(weights,et); %Function call to Batch Delta Learning Function
        toc;
        
        figure(); %Plotting Error Function against number of Iterations for each value of Eta
        subplot(2,1,1);
        plot(E,'-o','LineWidth',1.5,'Color','r');
        title('Delta Rule Iterative');
        xlabel('Iterations');
        ylabel('Error');
        
        subplot(2,1,2);
        plot(E_Batch,'-o','LineWidth',1.5,'Color','b');
        title('Delta Rule Batch');
        xlabel('Iterations');
        ylabel('Error');
    end %End iterating over all the values of Eta
    
    function Delta_Learning_Iterative(weight,e)
        iter = 1; err = [];
        while(sq_error > 0.01 && iter <= 100)
            for j=1:len
                %Calculating Output for each Input training example
                outPut = weight(1)*training_input{j}{1}(1) + weight(2)*training_input{j}{1}(2) + weight(3)*training_input{j}{1}(3);
                class_diff = (training_input{j}{2}-outPut);
                %Updating weights and network after each input example
                for k=1:length(weight)
                    weight(k) = weight(k)+(e*class_diff*training_input{j}{1}(k));
                end
                %Squared error for each input example
                err(j) = class_diff*class_diff;
            end
            sq_error = sum(err)/len; %Error function for each iteration
            E(iter) = typecast(sq_error,'double');
            iter = iter+1;
        end %End Iterations/epochs
    end %End Function Delta_Leaning_Iterative
    
    function Delta_Learning_Batch(weight,e)
        iter = 1; errBatch = []; dec_surface = [];
        while(sq_errorBatch > 0.01 && iter <= 100)
            deltaW = [0 0 0]; %Initializing DeltaW value to zero for each weight value for each Iteration
            for j=1:len
                %Calculating Output for each Input training example
                outPutBatch = weight(1)*training_input{j}{1}(1) + weight(2)*training_input{j}{1}(2) + weight(3)*training_input{j}{1}(3);
                class_diff_Batch = (training_input{j}{2}-outPutBatch);
                %Updating DeltaW value
                for k=1:length(weight)
                    deltaW(k) = deltaW(k)+(e*class_diff_Batch*training_input{j}{1}(k));
                end
                %Squared error for each input example
                errBatch(j) = class_diff_Batch*class_diff_Batch;
            end
            for k=1:length(weight) %Updating each weight after iterating over whole input training examples
                weight(k) = weight(k)+ deltaW(k);
            end
            dec_surface(iter)=weight(1)*training_input{1}{1}(1) + weight(2)*training_input{1}{1}(2) + weight(3)*training_input{1}{1}(3);
            sq_errorBatch = sum(errBatch)/len; %Error function for each iteration
            if(iter==5 || iter==10 || iter==50 || iter==100)
                figure();
                plot(dec_surface,'-o','LineWidth',1.5,'Color','c');
            end
            E_Batch(iter) = typecast(sq_errorBatch,'double');
            iter = iter+1;
        end %End Iterations/epochs
    end %End Function Delta_Leaning_Batch
end