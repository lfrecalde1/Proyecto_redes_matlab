clc,clear all,close all;

Va

[uv,~,nv] = unique(VA(:,1));
 [ua,~,na] = unique(VA(:,2));
 F = accumarray([nv,na],1,[length(nv),length(na)]);
 T = bsxfun(@rdivide,F,sum(F,2));