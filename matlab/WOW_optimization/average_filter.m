function cover_filter  =  average_filter(ori_cover)

H2 = fspecial('average',[3 3]); % Low
sizeCover=size(ori_cover);
padsize=max(size(H2));
coverPadded = padarray(ori_cover, [padsize padsize], 'symmetric');% add padding
W1 = conv2(coverPadded,H2,'same');
cover_filter = W1(((size(W1, 1)-sizeCover(1))/2)+1:end-((size(W1, 1)-sizeCover(1))/2), ((size(W1, 2)-sizeCover(2))/2)+1:end-((size(W1, 2)-sizeCover(2))/2));
end
