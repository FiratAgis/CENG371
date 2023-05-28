filename = "cameraman.jpg";
k = 10;
A = im2double(imread(filename));
[u, s, v] = svds(A, k);
imshow(u*s*transpose(v));
