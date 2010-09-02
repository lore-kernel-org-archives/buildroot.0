From: konrad at gaisler.com <konrad@gaisler.com>
Date: Thu, 02 Sep 2010 14:44:44 -0400
Subject: [Buildroot] Gaisler sparc-leon
Message-ID: <20100902144444.cynij0yn3mw0ooc0@webmail.bluegenesis.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?
Hello everybody,
Currently at Aeroflex Gaisler we are running a old
Snapgear 2.0 dist. Now we are searching for a replacement
and got from "Sam Ravnborg" <sam@ravnborg.org> the
hint to use buildroot that we intend to switch to now. 
Aeroflex Gaisler is marketing the OpenSource Leon3 processor
(that is distributed as a vhdl model and can be synthesized
by the user). The Leon3 processor is a fully SparcV8 conformant
processor that support also a SRMMU. Linux is ported on
it and the Leon Port is included in the recent kernels. 
Currently I also try to submit patches for the Leon3 settings to
GCC? and sent a copyleft assignment to FSF so I hope
the Leon3 cpu will be in the 4.5.x toolchains soon. 
From Sam Ravnborg I heard that there is the thought to
take away the sparc port from buildroot, I would like to vote
not doing so. In the future we plan to activly develop the Sparc
branch of uclibc and buildroot, test and submit patches. 
On Monday I'll submit 4.4.3 patch and sparc config settings patch
to add a leon cpu build... 
-- Greetings Konrad
?
?
