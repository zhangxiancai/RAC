function dis=changeIndex(index)
%将数据下标转为距离
start_m=0.2;length_m=0.8;power_bins=5;
dis=start_m+(length_m/power_bins)*index-0.5*(length_m/power_bins);


end