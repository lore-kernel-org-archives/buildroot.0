From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 10 Apr 2007 11:02:00 +0200
Subject: [Buildroot] Building GCC/C++ compilers using Buildroot
References: <01d901c779b6$221ca5a0$dcc4af0a@atmel.com>
	<20070410080525.GB13906@aon.at>
Message-ID: <011e01c77b4f$50a67eb0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Sun, Apr 08, 2007 at 10:01:56AM +0200, Ulf Samuelsson wrote:
>>Tried to upgrade my ARM gcc-3.4.6 compiler in buildroot
>>My host compiler is gcc-4.1.2 running on OpenSuse 10.2.
>>
>>First tried gcc-4.2 and latest supported binutils    - Failed
> 
> The snapshot-date is from sjhill and is outdated. I use the
> gcc-4_2-branch, c, c++, fortran frontends work fine. If one of those
> fails, i'm interrested in hearing about it (at least about c and
> fortran; c++ lacks uClibc++ integration/support so isn't interresting
> for me and i don't have spare-time to look into it).
> 

The failure was when building the C++ compiler.

Are you saying that you cannot build a g++ compiler using buildroot and uClibc?



Best Regards
Ulf Samuelsson
