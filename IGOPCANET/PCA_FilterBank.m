function V = PCA_FilterBank(InImg, PatchSize, NumFilters,Lamda) 
% =======INPUT=============
% InImg            Input images (cell structure)  
% InImgIdx         Image index for InImg (column vector)
% PatchSize        the patch size, asumed to an odd number.
% NumFilters       the number of PCA filters in the bank.
% givenV           the PCA filters are given. 
% =======OUTPUT============
% V                PCA filter banks, arranged in column-by-column manner
% OutImg           filter output (cell structure)
% OutImgIdx        Image index for OutImg (column vector)
% ========= CITATION ============
% T.-H. Chan, K. Jia, S. Gao, J. Lu, Z. Zeng, and Y. Ma, 
% "PCANet: A simple deep learning baseline for image classification?" submitted to IEEE TPAMI. 
% ArXiv eprint: http://arxiv.org/abs/1404.3606 

% Tsung-Han Chan [thchan@ieee.org]
% Please email me if you find bugs, or have suggestions or questions!

addpath('./Utils')

% to efficiently cope with the large training samples, we randomly subsample 100000 training subset to learn PCA filter banks
ImgZ = length(InImg);
MaxSamples = 100000;
NumRSamples = min(ImgZ, MaxSamples); 
RandIdx = randperm(ImgZ);
RandIdx = RandIdx(1:NumRSamples);


%% Learning PCA filters (V)
NumChls = size(InImg{1},3);
Rx = zeros(NumChls*PatchSize^2,NumChls*PatchSize^2);
for t = RandIdx 
    
    if(isreal(InImg{t}) == 0)
        im = InImg{t};
    else
        im = GetIGO(InImg{t});
    end
  
    im_real = real(im);
    im_imag = imag(im);
    im = im2col_general(im_real,[PatchSize PatchSize]);
    im_t=im2col_general(im_imag,[PatchSize PatchSize]);
    im_t = 1i*im_t;
    im = im + im_t;
    
    %im = im2col_general(InImg{t},[PatchSize PatchSize]); % collect all the patches of the ith image in a matrix
    im = bsxfun(@minus, im, mean(im)); % patch-mean removal 
    Rx = Rx + im*im';
end
Rx = Rx/(NumRSamples*size(im,2));
[E D] = eig(Rx);
[trash ind] = sort(abs(diag(D)),'descend');
% I add some codes for whitening

V = E(:,ind(1:NumFilters));  % principal eigenvectors 
%Diag_D = diag(D); 
%V = V*sqrt(inv(diag(Diag_D(ind(1:NumFilters)))));


 



