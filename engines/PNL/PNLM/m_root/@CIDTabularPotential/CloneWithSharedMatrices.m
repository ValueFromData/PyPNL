%% This file were automatically generated by SWIG's MatLab module
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                         %%
%%                INTEL CORPORATION PROPRIETARY INFORMATION                %%
%%   This software is supplied under the terms of a license agreement or   %%
%%  nondisclosure agreement with Intel Corporation and may not be copied   %%
%%   or disclosed except in accordance with the terms of that agreement.   %%
%%       Copyright (c) 2003 Intel Corporation. All Rights Reserved.        %%
%%                                                                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [result] = CloneWithSharedMatrices(varargin)
%%
%% C++ prototype: pnl::CFactor *CloneWithSharedMatrices(pnl::CIDTabularPotential *self)
%%

function [result] = CloneWithSharedMatrices(varargin)

[result] = feval('pnl_full', 'CIDTabularPotential_CloneWithSharedMatrices_wrap', varargin{:});
result = CFactor('%%@#DefaultCtor', result);

return
