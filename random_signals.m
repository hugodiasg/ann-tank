    % num_steps é o número de degraus
    % duration é a duração total do sinal

    % Gerar amplitudes aleatórias
    num_steps = 1000;
    duration = 15000;
    %amplitudes = randi([0, 4], 1, num_steps); % Amplitudes entre 1 e 10
    amplitudes = rand(1, num_steps) * 3; % Amplitudes aleatórias entre 0 e 4

    % Gerar períodos aleatórios
    %periods = randi([1, duration], 1, num_steps); % Períodos entre 1 e a duração total
    periods = rand(1, num_steps) * duration; % Períodos aleatórias entre 0 e 'duration'

    % Ordenar os períodos em ordem crescente para garantir que os degraus apareçam na sequência correta
    periods = sort(periods);

    % Criar o vetor de tempo
    t = linspace(0, 15000, 75000);

    % Inicializar o sinal
    signal = zeros(size(t));

    % Gerar o sinal de degrau
    for i = 1:num_steps
        step_start_index = round(find(t >= periods(i), 1));
        signal(step_start_index:end) = amplitudes(i);
    end
    
    % Estruturar o signal para exportar para o Simulink
    [NumRows,NumCols]=size(signal); % tamanho do 'signal'
    signal_index = 0:(NumCols-1); % criar vetor que vai enumerar cada elemento do 'signal'
    signal_struct = [signal_index.', signal.'];
    
    % Plotar o sinal de degrau
    plot(t, signal);
    title('Sinais de Degraus Aleatórios');
    xlabel('Tempo');
    ylabel('Amplitude');
    ylim([0, max(amplitudes) + 1]); % Define o limite superior do eixo y para mostrar todos os degraus
    grid on;