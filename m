From: =?ISO-8859-1?Q?Eldor_R=F8dseth_=28SystemSoft_AS=29?= <er@systemsoft.no>
Date: Thu, 29 Mar 2012 09:45:06 +0200
Subject: [Buildroot] Buildroot for Freescale PowerPC (PowerQUICC) MPC875
Message-ID: <CAM5MTK-jyqiAb3nQQKRRRXtL8HsKw1+rTOj45EeR_ct25o6FVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

We are currently running kernel version 2.6.25.16 on a Freescale
PowerPC (PowerQUICC) MPC875.
and using Redboot as the bootloader. The Toolchain is ELDK version
4.1. We are considering
upgrading to a newer kernel version, mainly due to new HW layout with
some components being
replaced/upgraded.

I have no prior experience using buildroot, but would like to give it
a try for the Kernel and rootfs image
(I think I'll keep the bootloader.....).

I would be interested in a how-to for the correct configuration of the
MPC875. I have had a go at
"make menuconfig" but I am not comfortable with which choices to make for
target arch. variant, toolchain, kernel configuration, etc.

Appreciate any help - thanks.

Regards, Eldor
