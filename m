From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 May 2016 14:48:02 +0200
Subject: [Buildroot] [PATCH] erlang-p1-stringprep: backport upstream
 commit	to fix musl build
References: <1463418358-30464-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <2dm81dxaba.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 16 May 2016 19:05:58 +0200 schrieb Thomas Petazzoni:

> Amusingly, a fix made upstream to fix the build on Windows also fixes
> the build with the musl C library.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/
d7b0cacc5d99d8dc91fdeaf770bb5d2b1b1975b6/

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested using defconfig from
 http://autobuild.buildroot.net/
results/79b/79b7ea651c21dc608b25cfb4f2685b98bd68480d/)
