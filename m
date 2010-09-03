From: konrad at gaisler.com <konrad@gaisler.com>
Date: Fri, 03 Sep 2010 09:13:27 -0400
Subject: [Buildroot] Gaisler sparc-leon
Message-ID: <20100903091327.v01tegjghcqso4oo@webmail.bluegenesis.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Thu, 02 Sep 2010 23:50:37  0200, Peter Korsgaard  wrote:
>>>>> "konrad" == konrad  <konrad@gaisler.com> writes:
  >
  > Hi Konrad,
  >
  >  konrad> Hello everybody,
  >  konrad> Currently at Aeroflex Gaisler we are running a old
  >  konrad> Snapgear 2.0 dist. Now we are searching for a replacement
  >  konrad> and got from "Sam Ravnborg" <sam@ravnborg.org> the
  >  konrad> hint to use buildroot that we intend to switch to now. 
  >  konrad> Aeroflex Gaisler is marketing the OpenSource Leon3 processor
  >  konrad> (that is distributed as a vhdl model and can be synthesized
  >  konrad> by the user). The Leon3 processor is a fully SparcV8 conformant
  >  konrad> processor that support also a SRMMU. Linux is ported on
  >  konrad> it and the Leon Port is included in the recent kernels. 
  >  konrad> Currently I also try to submit patches for the Leon3 settings to
  >  konrad> GCC? and sent a copyleft assignment to FSF so I hope
  >  konrad> the Leon3 cpu will be in the 4.5.x toolchains soon. 
  >
  > Ahh yes, I remember looking at Leon3 a number of years ago.. 
  >
  >  konrad> From Sam Ravnborg I heard that there is the thought to
  >  konrad> take away the sparc port from buildroot, I would like to vote
  >  konrad> not doing so. In the future we plan to activly develop the Sparc
  >  konrad> branch of uclibc and buildroot, test and submit patches. 
  >  konrad> On Monday I'll submit 4.4.3 patch and sparc config settings patch
  >  konrad> to add a leon cpu build... 
  >
  > The problem with Sparc was that noone was interested in maintaining it /
  > had access to hw to test stuff, and various issues with uClibc / gcc. 
  >
  > I have no issues keeping Sparc support if the situation changes, but
  > there isn't much sense in pretending to support Sparc if it doesn't
  > really work. 
?
My shortterm goal is to get buildroot to build a linux image with romfs
that includes libc shared and some more advanced app like a ssh. That
should cover/test already a lot functionality. So far in snapgear 2.0 we
only used uClibc static, we had made quite a few patches to uclibc, 
didnt submit them to the
uclibc though. It was also a fairly old uclibc that we used, it seems that
uclibc has gotten better in the meantime (while we sticked still to the
old version...). I think that if Gaisler would switch to buildroot and
Leon users would start using it the sparc the sparc part would be
maintained and running.I'll press this now and will post my results here... 
-- Greetings Konrad
?
Ps: Note at the side: If no hardware is available the evaluation version of
the sparcleon simulator called TSIM can be used, so that non sparc users
can run/test/verify too. 
?
?
?
?
>
  > So I'll keep it for now and see what happens.. 
  >
  > --
  > Bye, Peter Korsgaard
  >
  >

?
