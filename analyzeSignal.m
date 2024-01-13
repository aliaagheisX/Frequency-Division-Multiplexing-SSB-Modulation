function X =  analyzeSignal(time_vector, x, Fs, title)
    figure;
    subplot(3,1,1);
    
    plot(time_vector, x);
    xlabel('Time (sec)');
    ylabel('Amplitude');
    
    % plot frequency domain
    % n = 512 % to avoid computation that harm my device, and to make plotting more obviouse
    X = fft(x);
    X = fftshift(X); % shift value to middle at zero
    X_mag = abs(X);
    X_phase = unwrap(angle(X));
    % can make it till 20k hz because we only hear that
    freq_vector = linspace(-Fs/2, Fs/2, length(X));

    subplot(3,1,2);
    plot(freq_vector,X_mag);
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');

    subplot(3,1,3);
    plot(freq_vector,X_phase);
    xlabel('Frequency (Hz)');
    ylabel('Phase (rad)');
    
    sgtitle(title);
end