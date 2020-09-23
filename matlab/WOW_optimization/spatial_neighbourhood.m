function new_cover = spatial_neighbourhood(ori_cover)
    pad_size = 1;
    im2 = padarray(ori_cover,[pad_size pad_size],'symmetric'); % energies of eight-neighbor blocks
    size2 = 2*pad_size;
    im_l8 = im2(1+pad_size:end-pad_size,1:end-size2);
    im_r8 = im2(1+pad_size:end-pad_size,1+size2:end);
    im_u8 = im2(1:end-size2,1+pad_size:end-pad_size);
    im_d8 = im2(1+size2:end,1+pad_size:end-pad_size);
    im_l88 = im2(1:end-size2,1:end-size2);
    im_r88 = im2(1+size2:end,1+size2:end);
    im_u88 = im2(1:end-size2,1+size2:end);
    im_d88 = im2(1+size2:end,1:end-size2);
    new_cover  = (ori_cover+(im_l8+im_r8+im_u8+im_d8)+(im_l88+im_r88+im_u88+im_d88));
end


