%get the musics
[music,Fs1] = audioread('music.wav');
[msg,Fs2] = audioread('msg.wav');

%fourier transform for the musics
music_fft =fft(music);
msg_fft=fft(msg);

%split the music into two parts
music_part1=music_fft(1:440486);
music_part2=music_fft(490517:end);

%split the msg into two parts
msg_part1=msg_fft(1:25016);
msg_part2=msg_fft(25017:end);

%combaim the 4th parts 
result= [music_part1;msg_part2;msg_part1;music_part2];

%inverse fourier transform for the result
R_music=ifft(result);

%fourier transform for the R_music to get the hidden data
R_music_fft=fft(R_music);

% this two parts of msg from R_music_fft
R_msg_part1=R_music_fft(440487:465501);
R_msg_part2=R_music_fft(465502:490517);

%combain two parts of msg
R_msg_full=[R_msg_part2;R_msg_part1];

%msg 
R_msg=ifft(R_msg_full);




