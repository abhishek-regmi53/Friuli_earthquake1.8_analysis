v1 = VideoReader('20210706_192827 (1).mp4')
v2 = VideoReader('animation.avi')
i1 = 0;
i2 = 0;
while i1 < v1.NumberOfFrames && i2 < v2.NumberOfFrames
      if i1 < v1.NumberOfFrames
          i1 = i1+1;
          subplot(2,2,1)
          image(v1.read(i1))
      end
      if i2 < v2.NumberOfFrames
          i2 = i2+1;
          subplot(2,2,2)
          image(v2.read(i2))
      end
  drawnow
  end