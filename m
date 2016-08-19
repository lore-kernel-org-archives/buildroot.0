From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 11:23:20 +0200
Subject: [Buildroot] [PATCH] package/rt-tests: add syscall-number for
 sched_(gs)etattr() for SH4
In-Reply-To: <1471278782-26712-1-git-send-email-romain.naour@gmail.com>
References: <1471278782-26712-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160819112320.387dd8a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Aug 2016 18:33:02 +0200, Romain Naour wrote:
> The dependency on kernel headers >= 3.14 was added by
> b9fa6c00b1213fd038f2aed52057f22c7e18fd4b since
> librttest requires __NR_sched_setattr and
> __NR_sched_getattr syscalls (rt-sched).
> 
> But these syscalls have just been added to kernel 4.8 for SH4.
> 
> Fixes:
> http://autobuild.buildroot.net/results/67fc16366717f34df492683a14ecd23376e23110
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: copy syscall-number from kernel 4.8 (Baruch)
> ---
>  ...scall-number-for-sched_-gs-etattr-for-SH4.patch | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/rt-tests/0003-Add-syscall-number-for-sched_-gs-etattr-for-SH4.patch

Applied to master, thanks. Please submit upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
