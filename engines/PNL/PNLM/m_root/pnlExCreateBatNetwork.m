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
%% [result] = pnlExCreateBatNetwork(varargin)
%%
%% C++ prototype: pnl::CBNet *pnl::pnlExCreateBatNetwork(int seed)
%%

function [result] = pnlExCreateBatNetwork(varargin)

[result] = feval('pnl_full', 'pnlExCreateBatNetwork_wrap', varargin{:});
result = CBNet('%%@#DefaultCtor', result);

return