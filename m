From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 23:47:23 +0200
Subject: [Buildroot] [PATCH] kernel-module-imx-gpu-viv: bump revision to
 a05d9b23
In-Reply-To: <20170718125800.28223-1-gary.bisson@boundarydevices.com>
References: <20170718125800.28223-1-gary.bisson@boundarydevices.com>
Message-ID: <20170718234723.33a32f75@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 14:58:00 +0200, Gary Bisson wrote:
> Changelog since previous revision:
> 6a01dfb fix for memory leak in gc_hal_kernel_os.c
> f73c35b Add support for PREEMPT_RT kernels
> 
> Also updating the help text to make sure users know this module won't
> build with Mainline kernel but only with NXP forks.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Hi all,

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
