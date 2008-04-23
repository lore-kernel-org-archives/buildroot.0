From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 23 Apr 2008 18:09:48 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
References: <20080423130355.7668C3C747@busybox.net>
Message-ID: <010801c8a560$21c744d0$020514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Author: jacmet
> Date: 2008-04-23 06:03:53 -0700 (Wed, 23 Apr 2008)
> New Revision: 21809
> 
> Log:
> u-boot: tools in target (mkimage, fw_printenv and fw_setenv)
> 
> 

Why install mkimage in the target???
It is used to create the linux kernel image so that U-Boot can load it.
If you download a new image, I would expect it is already created
using mkimage on the host.

> Modified:
>   trunk/buildroot/target/u-boot/Config.in
>   trunk/buildroot/target/u-boot/Makefile.in
> 
> 


Best Regards
Ulf Samuelsson
