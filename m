From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Sep 2010 23:50:37 +0200
Subject: [Buildroot] Gaisler sparc-leon
In-Reply-To: <20100902144444.cynij0yn3mw0ooc0@webmail.bluegenesis.com>
	(konrad@gaisler.com's message of "Thu, 02 Sep 2010 14:44:44 -0400")
References: <20100902144444.cynij0yn3mw0ooc0@webmail.bluegenesis.com>
Message-ID: <87hbi7vmqa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "konrad" == konrad  <konrad@gaisler.com> writes:

Hi Konrad,

 konrad> Hello everybody,
 konrad> Currently at Aeroflex Gaisler we are running a old
 konrad> Snapgear 2.0 dist. Now we are searching for a replacement
 konrad> and got from "Sam Ravnborg" <sam@ravnborg.org> the
 konrad> hint to use buildroot that we intend to switch to now. 
 konrad> Aeroflex Gaisler is marketing the OpenSource Leon3 processor
 konrad> (that is distributed as a vhdl model and can be synthesized
 konrad> by the user). The Leon3 processor is a fully SparcV8 conformant
 konrad> processor that support also a SRMMU. Linux is ported on
 konrad> it and the Leon Port is included in the recent kernels. 
 konrad> Currently I also try to submit patches for the Leon3 settings to
 konrad> GCC? and sent a copyleft assignment to FSF so I hope
 konrad> the Leon3 cpu will be in the 4.5.x toolchains soon. 

Ahh yes, I remember looking at Leon3 a number of years ago..

 konrad> From Sam Ravnborg I heard that there is the thought to
 konrad> take away the sparc port from buildroot, I would like to vote
 konrad> not doing so. In the future we plan to activly develop the Sparc
 konrad> branch of uclibc and buildroot, test and submit patches. 
 konrad> On Monday I'll submit 4.4.3 patch and sparc config settings patch
 konrad> to add a leon cpu build... 

The problem with Sparc was that noone was interested in maintaining it /
had access to hw to test stuff, and various issues with uClibc / gcc.

I have no issues keeping Sparc support if the situation changes, but
there isn't much sense in pretending to support Sparc if it doesn't
really work.

So I'll keep it for now and see what happens..

-- 
Bye, Peter Korsgaard
