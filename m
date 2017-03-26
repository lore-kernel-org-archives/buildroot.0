From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 26 Mar 2017 14:34:33 +0200
Subject: [Buildroot] [git commit] xenomai: bump version to 3.0.3
In-Reply-To: <20170325181551.035B88226E@busybox.osuosl.org>
References: <20170325181551.035B88226E@busybox.osuosl.org>
Message-ID: <20170326123433.GL22954@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

is this well tested?
Simple uClibc-ng for ARM breaks with:
obstack.c:103:24: fatal error: exitfail.h: No such file or directory

I am not an Xenomai expert, just started experimenting with it, but
I see no option to switch between "cobalt" and "mercury" mode.

best regards
 Waldemar

Thomas Petazzoni wrote,

> commit: https://git.buildroot.net/buildroot/commit/?id=472b07ea8ff1cd341c5f97508e5c29266146fa51
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> - Bump Xenomai version to 3.0.3
> 
