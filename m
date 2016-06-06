From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 21:58:33 +0200
Subject: [Buildroot] [PATCH] Binutils: ARC: Fix build failures if
 makeinfo is missing
In-Reply-To: <87twh6hzxl.fsf@dell.be.48ers.dk>
References: <1465211659-23861-1-git-send-email-vzakhar@synopsys.com>
 <87twh6hzxl.fsf@dell.be.48ers.dk>
Message-ID: <20160606215833.57396ae8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 06 Jun 2016 21:36:54 +0200, Peter Korsgaard wrote:

>  > Signed-off-by: Zakharov Vlad <vzakhar@synopsys.com>  
> 
> Committed, thanks.

Why?

This problem also exists for other versions of binutils, and also for
gdb. And we have a patch series from Romain Naour sitting in patchwork
for several weeks.

I don't know if Zlad's version is better or not than Romain's version.
But at least Romain's version was handling all binutils and gdb
versions, without patching directly Makefile.in files. So at first
sight, it looked a lot better than Zlad's version.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
