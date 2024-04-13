    % num_steps � o n�mero de degraus
    % duration � a dura��o total do sinal

    % Gerar amplitudes aleat�rias
    num_steps = 1000;
    duration = 15000;
    %amplitudes = randi([0, 4], 1, num_steps); % Amplitudes entre 1 e 10
    amplitudes = rand(1, num_steps) * 3; % Amplitudes aleat�rias entre 0 e 4

    % Gerar per�odos aleat�rios
    %periods = randi([1, duration], 1, num_steps); % Per�odos entre 1 e a dura��o total
    periods = rand(1, num_steps) * duration; % Per�odos aleat�rias entre 0 e 'duration'

    % Ordenar os per�odos em ordem crescente para garantir que os degraus apare�am na sequ�ncia correta
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
    title('Sinais de Degraus Aleat�rios');
    xlabel('Tempo');
    ylabel('Amplitude');
    ylim([0, max(amplitudes) + 1]); % Define o limite superior do eixo y para mostrar todos os degraus
    grid on;