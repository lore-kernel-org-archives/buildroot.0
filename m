From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 16:24:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/coremark-pro: disable parallel
 build
In-Reply-To: <20210408165406.2586801-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 8 Apr 2021 18:54:06 +0200")
References: <20210408165406.2586801-1-fontaine.fabrice@gmail.com>
Message-ID: <87lf8pxpzx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable parallel build as it seems to be totally broken:
 > /bin/bash: line 0: cd: /home/buildroot/autobuild/instance-2/output-1/build/coremark-pro-1.1.2743/builds/linux64/gcc64/obj/bench/core: No such file or directory

 > /bin/sh: 1: cd: can't cd to /home/buildroot/autobuild/instance-1/output-1/build/coremark-pro-1.1.2743/builds/linux/gcc/obj/bench/fp/loops/SP

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7ba5e209772af7037fc735ea174d3fc3eaf46f4b
 >  - http://autobuild.buildroot.org/results/32b51bb9eda7899b6cc331f10a860644bd6004fa

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
