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
%% [result] = CreateByModelDomain(varargin)
%%
%% C++ prototype: pnl::CMNet *pnl::CMNet::Create(pnl::intVecVector const &clqsIn,pnl::CModelDomain *pMD)
%%

function [result] = CreateByModelDomain(varargin)

[result] = feval('pnl_full', 'CMNet_CreateByModelDomain_wrap', varargin{:});
result = CMNet('%%@#DefaultCtor', result);

return