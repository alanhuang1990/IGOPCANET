function fhy = GetIGO(img_in)

% [gx,gy] = gradient(img_in);
% 
% fhy = atan(gy./(gx+eps));

%correction
% cor = find(gy<0 & gx<0);
% fhy(cor) = fhy(cor)+pi;
% cor = find(gy > 0 & gx<0);
% fhy(cor) = fhy(cor)+pi;
% %cor = find(fhy<0);
% %fhy(cor) = fhy(cor)+pi*2;
% fhy = exp(1i*fhy);


[bx,by] = gradient(img_in);
ang = angle(bx + 1i*by);
<<<<<<< HEAD
ang(ang == pi/2) = 0;
=======
%ang(ang == pi/2) = 0;

%ang(ang == 3*pi/2) = 0;
>>>>>>> 94090aef17edfb1875db46904d3f1c67f0dbd7c4
fhy = cos(ang) + 1i*sin(ang);

end
