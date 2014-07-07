function [bx, by] = myEdge(I, par)

if par == 1
    gx1 = [-1 0 1];
    gx2 = [-1 0 1]';
elseif par == 2
    gx1 = [1/12 -2/3 0 2/3 -1/12];
    gx2 = [1/12 -2/3 0 2/3 -1/12]';
elseif par == 3
    gx1 = [-1/60 3/20 -3/4 0 3/4 -3/20 1/60];
    gx2 = [-1/60 3/20 -3/4 0 3/4 -3/20 1/60]';
elseif par == 4
    sigma = 1;
    gx1 = Gradx_oG(max(1, floor(7*1)), sigma);
    gx2 = Gradx_oG(max(1, floor(7*1)), sigma)';
elseif par == 5
    gx1 = [-1/4  -1/4   0 ; 
           -1/4   1   0; 
           -1/4   0  0 ];
       
    gx2 = [  0   0    -1/4;
             0   1     -1/4;
             0  -1/4   -1/4];
 elseif par == 6
    gx1 = [-1/4  -1/4   -1/4 ; 
           -1/4   1   0; 
            0   0  0 ];
       
    gx2 = [  0    0    0;
             0   1   -1/4;
             -1/4   -1/4   -1/4];
  elseif par == 7
    gx1 = [-1/4  -1/4   -1/4 ; 
            0   1   -1/4; 
            0   0  0 ];
       
    gx2 = [  0    0    0;
             -1/4   1   0;
             -1/4   -1/4   -1/4];
         elseif par == 8
    gx1 = [ 0  -1/4   0 ; 
          -1/4   1   -1/4; 
            0  -1/4  0 ];
       
    gx2 = [  -1/4   0  -1/4  ;
                0   1   0;
             -1/4   0  -1/4];
         elseif par == 9
    gx1 = [ 0    0   -1/4 ; 
          -1/4   1   -1/4; 
          -1/4   0  0 ];
       
    gx2 = [  -1/4   -1/4  0  ;
                0   1   0;
               0   -1/4  -1/4];
           elseif par == 10
    gx1 = [ -1/4    0   -1/4 ; 
          -1/4   1   -1/4; 
             0   0  0 ];
       
    gx2 = [    0     -1/4  0  ;
                0       1   0;
               -1/4   -1/4  -1/4];
              elseif par == 11
    gx1 = [  -1/4   0   -1/4 ; 
             -1/4   1      0; 
                0   0    -1/4 ];
       
    gx2 = [     0     -1/4  0  ;
                0       1   -1/4;
               -1/4   -1/4  0  ];
end
    
bx = crop2(conv2(extend2(I, length(gx1), length(gx1)), gx1, 'same'), length(gx1), length(gx1));     
by = crop2(conv2(extend2(I, length(gx2), length(gx2)), gx2, 'same'), length(gx2), length(gx2));  