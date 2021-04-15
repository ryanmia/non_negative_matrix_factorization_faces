%%
%Function computer objective is used inside nmf function 
%using KL divergence to try and minimize error
function [obj] = compute_objective(V, B, W) 
    sumV=sum(sum(V));
    BW=B*W;
    sumBW=sum(sum(BW));
    messy=V.*log(V./BW+.000001);
    
    sumMessy=sum(sum(messy));
    
    obj=sumMessy+sumV-sumBW;
    
end