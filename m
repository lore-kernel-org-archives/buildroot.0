From: Rinder, Thomas <thomas.rinder@fh-kiel.de>
Date: Sat, 25 Jan 2020 17:53:53 +0000
Subject: [Buildroot] stm32f469_disco_defconfig bug
Message-ID: <4d3d3f45cd394daa9fdf320dcfbbd9c2@fh-kiel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I tried the

make stm32f469_disco_defconfig<https://git.buildroot.net/buildroot/tree/configs/stm32f469_disco_defconfig>

make

and generated all outputs successfully (without any change in configurations).

BUG: The xipImage is a little to big to fit into the device flash.

The target points to the stm32f469 discovery board which has a 8Mbyte external FLASH on it.

So it would much better to relocate the xipImage into the external flash.
Is there a simple way to do this?

Thanks
Thomas

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200125/aff2416e/attachment.html>
