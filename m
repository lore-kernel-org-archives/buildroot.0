From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 21:52:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/binutils: add version 2.35.1
In-Reply-To: <20201002155751.1529784-1-romain.naour@gmail.com>
References: <20201002155751.1529784-1-romain.naour@gmail.com>
Message-ID: <20201008215222.00e86835@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  2 Oct 2020 17:57:50 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> See:
> https://sourceware.org/pipermail/binutils/2020-July/112530.html (2.35)
> https://sourceware.org/pipermail/binutils/2020-September/113375.html (2.35.1)
> 
> Tested by https://gitlab.com/kubu93/buildroot/-/pipelines/197379288
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> Ignore the qemu_arm_vexpress_defconfig issue in the gitlab pipeline.

Thanks, series applied. We should perhaps get rid of binutils 2.33, and
keep only binutils 2.32 to have something working for noMMU platforms ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
