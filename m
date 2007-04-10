From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 10 Apr 2007 12:18:39 +0200
Subject: [Buildroot] Building GCC/C++ compilers using Buildroot
In-Reply-To: <011e01c77b4f$50a67eb0$dcc4af0a@atmel.com>
References: <01d901c779b6$221ca5a0$dcc4af0a@atmel.com>
	<20070410080525.GB13906@aon.at>
	<011e01c77b4f$50a67eb0$dcc4af0a@atmel.com>
Message-ID: <20070410101838.GA15274@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 10, 2007 at 11:02:00AM +0200, Ulf Samuelsson wrote:
>> On Sun, Apr 08, 2007 at 10:01:56AM +0200, Ulf Samuelsson wrote:
>>>Tried to upgrade my ARM gcc-3.4.6 compiler in buildroot
>>>My host compiler is gcc-4.1.2 running on OpenSuse 10.2.
>>>
>>>First tried gcc-4.2 and latest supported binutils    - Failed
>> 
>> The snapshot-date is from sjhill and is outdated. I use the
>> gcc-4_2-branch, c, c++, fortran frontends work fine. If one of those
>> fails, i'm interrested in hearing about it (at least about c and
>> fortran; c++ lacks uClibc++ integration/support so isn't interresting
>> for me and i don't have spare-time to look into it).
>> 
>
>The failure was when building the C++ compiler.
>
>Are you saying that you cannot build a g++ compiler using buildroot and uClibc?

I'm saying that the snapshot-date from gcc-4.2 is one sjhill used at one
point -- or still uses, i don't know= and that gcc-4.2 from the 4_2-branch
-- which i'm using -- can build a c, c++ and fortran frontend just fine.

Furthermore i'm observing that we do not (yet, patches welcome) use
uClibc++ (http://cxx.uclibc.org/ for your convenience) for gcc in
buildroot.
