From: Marcus Tangermann <marcus.tangermann@gmail.com>
Date: Wed, 10 Apr 2013 20:09:34 +0200
Subject: [Buildroot] Buildroot on Toradex Colibri PXA300
Message-ID: <4E1AF0DD-1622-4CD1-9C61-6A8C7BE71151@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I try to build a system for a Colibri Board with the Iris carrier board from Toradex. Its a Marvell PXA300 with 64MB RAM and NAND flash.
I've configured a generic ARM for the toolchain and selected the colibri_pxa300_defconfig for the kernel which is already part of the Vanilla kernel.
When booting the kernel stops after uboot unpacked the kernel.

Has someone used this board before or has any hint?

Marcus
