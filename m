From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Sep 2007 19:23:50 +0200
Subject: [Buildroot] problem with kernel-headers*makefile
Message-ID: <20070928172350.GP20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf,

Re: kernel-headers-new.makefile
1)
I ask you to fix this so that there is no empty "empty" directory
required (patching patch-kernel.sh to gracefully exit if the dir exists
is not an option).

2)
LINUX_RT_VERSION
Please move this out of the makefile and to the config-system instead.

Both are not immediately urgent for now, but please keep them in mind.
