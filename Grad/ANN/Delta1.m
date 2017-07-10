%{
    EXAM 2
    Machine Learning (20CS6037)
    Q-2: Implementation of Decaying and Adaptive Learning Rate in Delta Training Rule.
    Name: AMAN SHRIVASTAVA
%}

function Delta1
    clc
    training_input = {{[],[]}}; %Variable to store randomly generated input
    eta = 0.01; %Taking 5 values of Eta in incremental order
    decay_const = 0.8; %Var to decay Eta after every iteration
    for i=1:30
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
    sq_errorBatch = 1; sq_errorBatch_Adap = 1; %Var to store Distinct Error Function
    E_Batch = []; E_Batch_Adap = []; %Var to store error for each iteration
    weights = -1 + 2.*rand(1,3); %Randomly assigning w0,w1,w2
    weightsBatch = weights;
    tic;
    Delta_Learning_Batch_Decay(); %Function call to Batch Delta Learning Function
    toc;
    tic;
    Delta_Learning_Batch_Adaptive(); %Function call to Batch Delta Learning Function
    toc;

    figure(); %Plotting Error Function against number of Iterations for each value of Eta
    subplot(2,1,1);
    plot(E_Batch,'-o','LineWidth',1.5,'Color','r');
    title('Delta Rule Batch (Decaying Eta)');
    xlabel('Iterations');
    ylabel('Error');
    
    subplot(2,1,2);
    plot(E_Batch_Adap,'-o','LineWidth',1.5,'Color','b');
    title('Delta Rule Batch (Adaptive Eta)');
    xlabel('Iterations');
    ylabel('Error');
    
    function Delta_Learning_Batch_Decay
        iter = 1; errBatch = []; eta = 0.01;
        while(sq_errorBatch > 0.01 && iter <= 100)
            eta = eta*(decay_const^(iter-1)); %Decaying Eta by multiplying it with decay Constant
            disp('Iter: ');
            deltaW = [0 0 0]; %Initializing DeltaW value to zero for each weight value for each Iteration
            disp(weightsBatch);
            for j=1:len
                %Calculating Output for each Input training example
                outPutBatch = weightsBatch(1)*training_input{j}{1}(1) + weightsBatch(2)*training_input{j}{1}(2) + weightsBatch(3)*training_input{j}{1}(3);
                class_diff_Batch = (training_input{j}{2}-outPutBatch);
                %Updating DeltaW value
                for k=1:length(weightsBatch)
                    deltaW(k) = deltaW(k)+(eta*class_diff_Batch*training_input{j}{1}(k));
                end
                %Squared error for each input example
                errBatch(j) = class_diff_Batch*class_diff_Batch;
            end
            for k=1:length(weightsBatch) %Updating each weight after iterating over whole input training examples
                weightsBatch(k) = weightsBatch(k)+ deltaW(k);
            end
            sq_errorBatch = sum(errBatch)/len; %Error function for each iteration
            E_Batch(iter) = typecast(sq_errorBatch,'double');
            iter = iter+1;
        end %End Iterations/epochs
    end %End Function Delta_Learning_Batch
    
    function Delta_Learning_Batch_Adaptive
        iter = 1; errBatch = []; threshold=1.03; ErrorOld = 1000; eta = 0.01;
        while(iter <= 100)
            deltaW = [0 0 0]; %Initializing DeltaW value to zero for each weight value for each Iteration
            for j=1:len
                %Calculating Output for each Input training example
                outPutBatch = weightsBatch(1)*training_input{j}{1}(1) + weightsBatch(2)*training_input{j}{1}(2) + weightsBatch(3)*training_input{j}{1}(3);
                class_diff = (training_input{j}{2}-outPutBatch);
                %Updating DeltaW value
                for k=1:length(weightsBatch)
                    %disp(eta*class_diff*training_input{j}{1}(k));
                    deltaW(k) = deltaW(k)+(eta*class_diff*training_input{j}{1}(k));
                end
                %Squared error for each input example
                errBatch(j) = class_diff*class_diff;
            end
            sq_errorBatch_Adap = sum(errBatch)/20; %Error function for each iteration
            %{
                Checking if previous error is geater than current error,
                if yes then updatin the weights otherwise, keeping previous
                weights.
            %}
            if(sq_errorBatch_Adap < (ErrorOld+threshold))
                for k=1:length(weightsBatch) %Updating each weight after iterating over whole input training examples
                    weightsBatch(k) = weightsBatch(k)+ deltaW(k);
                end
                eta = eta*1.02; %Incresing Eta if error is less than previous error
                E_Batch_Adap(iter) = typecast(sq_errorBatch_Adap,'double');
            else
                eta = eta*0.9; %Decresing Eta if error is more than previous error
                E_Batch_Adap(iter) = typecast(ErrorOld,'double');
            end
            ErrorOld = sq_errorBatch_Adap;
            iter = iter+1;      
        end %End Iterations/epochs
    end %End Function Delta_Learning_Adaptive
end