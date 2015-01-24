function [x,msg] = floorn(x,n)

%FLOORN  Rounds input data up at specified power of 10
%
%  y = FLOORN(x) rounds the input data x to the nearest hundredth.
%
%  y = FLOORN(x,n) rounds the input data x at the specified power
%  of tens position.  For example, n = -2 rounds the input data to
%  the 10E-2 (hundredths) position.
%
%  [y,msg] = FLOORN(...) returns the text of any error condition
%  encountered in the output variable msg.
%
%  See also FLOOR


%  Copyright 1996-2003 The MathWorks, Inc.
%  Written by:  E. Byrns, E. Brown, modified by Kelly Kearney
%   $Revision: 1.9.4.1 $    $Date: 2003/08/01 18:20:03 $

msg = [];   %  Initialize output

if nargin == 0
    error('Incorrect number of arguments')
elseif nargin == 1
    n = -2;
end

%  Test for scalar n

if max(size(n)) ~= 1
   msg = 'Scalar accuracy required';
   if nargout < 2;  error(msg);  end
   return
elseif ~isreal(n)
   warning('Imaginary part of complex N argument ignored')
   n = real(n);
end

%  Compute the exponential factors for rounding at specified
%  power of 10.  Ensure that n is an integer.

factors  = 10 ^ (fix(-n));

%  Set the significant digits for the input data

x = floor(x * factors) / factors;
