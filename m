From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2021 20:38:00 +0100
Subject: [Buildroot] [PATCH 1/1] configs/qemu_*: bump kernel version to
 5.4.88
In-Reply-To: <20210110203910.24698-1-geoffrey.legourrierec@gmail.com>
 ("Geoffrey Le =?utf-8?Q?Gourri=C3=A9rec=22's?= message of "Sun, 10 Jan 2021
 21:39:10 +0100")
References: <20210110203910.24698-1-geoffrey.legourrierec@gmail.com>
Message-ID: <87bldvnu1z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Geoffrey" == Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com> writes:

 > Bump QEMU defconfigs to latest longterm kernel 5.4.88.
 > Please note that QEMU boards not based on 5.4.y were ignored:
 > - qemu_csky810_virt_defconfig
 > - qemu_csky807_virt_defconfig
 > - qemu_csky610_virt_defconfig
 > - qemu_csky860_virt_defconfig

 > Tests were carried out on all QEMU boards using Gitlab [1] (commit
 > message was slightly different, but the patch is identical)

 > Additional actions needed were:
 > - board/qemu/sh4-r2d: Remove one of the two kernel patches [2] provided
 >   by Alan Modra fixing rodata alignment, carried here by Romain Naour [3]
 >   to fix an issue preventing kernel from booting with binutils 2.23.
 >   Patch is present in upstream Linux now.

 > [1] https://gitlab.com/clumsyape/buildroot/-/pipelines/239483891
 > [2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
 > [3] https://git.busybox.net/buildroot/commit/?id=a2331c8a61bdd71c47492efc818fb0458a349219

 > Signed-off-by: Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
