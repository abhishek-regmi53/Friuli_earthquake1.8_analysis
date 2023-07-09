clear all;
close all;

vid1 = VideoReader('animation.avi');
vid2 = VideoReader('20210706_192827 (1).mp4');


videoPlayer = vision.VideoPlayer;
% new video
outputVideo = VideoWriter('newvideo.avi');
outputVideo.FrameRate = vid2.FrameRate;
open(outputVideo);
while hasFrame(vid1) && hasFrame(vid2)
    img1 = readFrame(vid1);
    [rows1, columns1, numColors1] = size(img1);
    img2 = readFrame(vid2);
    [rows2, columns2, numColors2] = size(img1);
    img2 = imresize(img2, [rows1, rows2]);
    imgt = horzcat(img1, img2);
    % play video
    step(videoPlayer, imgt);
    % record new video
    writeVideo(outputVideo, imgt);
end
release(videoPlayer);
close(outputVideo);