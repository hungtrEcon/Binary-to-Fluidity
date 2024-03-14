clear all;

data = readmatrix('data_mut00001.csv');
%data = readmatrix('data_mut0001.csv');

data(:,1) = []; % remove first order column
nagents = sum(data(1,1:3));

gender_distribution = readmatrix('dist_data_mut0000.csv');
%gender_distribution = readmatrix('dist_data_mut0001.csv');
gender_distribution(:,1) = [];
gender_distribution(1,:) = [];



zeros_frac = zeros(height(data),1);
ones_frac = zeros(height(data),1);
binaries_frac = zeros(height(data),1);
match = zeros(height(data),1);
matching_prob = zeros(height(data),1);


for i=1:height(data)
    zeros_frac(i,1) = data(i,1)/nagents;
    ones_frac(i,1)  = data(i,2)/nagents;
    binaries_frac(i,1)  = data(i,3)/nagents;
    
    if data(i,1) <= data(i,2)
        match_binary = data(i,1);
    else
        match_binary = data(i,2);
    end
    
    if mod(data(i,3), 2) == 0
        match_nonbinary = data(i,3)/2;
    else
        match_nonbinary = (data(i,3) - 1)/2;
    end
    
    match = match_binary + match_nonbinary;
    match(i,1) = match;
    matching_prob(i,1) = match(i,1)/(nagents/2);
    
    
    unmatch_count(i,1) = 300-match_binary*2 - match_nonbinary*2;
end

data = [data zeros_frac ones_frac binaries_frac matching_prob unmatch_count];

fig = figure;
%grid on
left_color = [0 0 0];
right_color = [0 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
hold on
%yyaxis left
ylim([-0.05 1])
plot(1:height(data),movmean(zeros_frac(:,1),1),'-s', 'Color', 'black','MarkerIndices',1:25:height(data))
plot(1:height(data),movmean(ones_frac(:,1),1),'-^', 'Color', 'black','MarkerIndices',1:25:height(data))
plot(1:height(data),movmean(binaries_frac(:,1),1),'-o', 'Color', 'black','MarkerIndices',1:25:height(data))
plot(1:height(data),movmean(matching_prob(:,1), 10), '', 'Color', 'red')
ylabel('fraction', 'Interpreter', 'latex')
yyaxis right
ylim([-0.05 75])

plot(1:height(data),movmean(unmatch_count(:,1), 10), 'Color', 'blue')
ylabel('count', 'Interpreter', 'latex')

hold off
%legend({'0', '1', 'nonbinary', 'matching probability', 'Interpreter', 'latex', 'Location', 'southeast','AutoUpdate','off'})
legend({'0 (left)', '1 (left)', 'nonbinary (left)', 'matching probability, MA10 (left)', 'unmatch individual, MA10 (right)'}, 'Interpreter', 'latex','Location', 'best', 'AutoUpdate','off')
xlabel('time', 'Interpreter', 'latex')



[ f_time1, x ] = ksdensity(gender_distribution(1,:));
[ f_time250, y ] = ksdensity(gender_distribution(250,:));
[ f_time500, z ] = ksdensity(gender_distribution(500,:));
[ f_time1000, m ] = ksdensity(gender_distribution(1000,:));


figure
hold on
histogram(gender_distribution(1000,:), 'BinWidth',0.01)
%ksdensity(gender_distribution(1000,:))
hold off

figure
hold on
for i = 5:25:1000
    histogram(gender_distribution(i,:))
end
hold off

figure
hold on;

for i = 5:25:1000
    ksdensity(gender_distribution(i,:))
end
hold off;

    
