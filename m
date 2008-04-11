From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Fri, 11 Apr 2008 22:55:33 +0200
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/u-boot
In-Reply-To: <20080410210327.E728B3C5B8@busybox.net>
References: <20080410210327.E728B3C5B8@busybox.net>
Message-ID: <47FFD045.8080102@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ulf at uclibc.org a ?crit :
> Author: ulf
> Date: 2008-04-10 14:03:27 -0700 (Thu, 10 Apr 2008)
> New Revision: 21695
> 
> Log:
> Avoid hardwiring tftpboot
> 
> Modified:
>    trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk

Thanks Ulf for this fix. I have found two others files with the exact 
same issue:
target/device/Atmel/at91bootstrap/at91bootstrap.mk
target/linux/Makefile.in.advanced

Please apply the attached patch to fix them.

Regards,
--
Jean-Christian de Rivaz
-------------- next part --------------
A non-text attachment was scrubbed...
Name: patch-tftpboot.diff
Type: text/x-patch
Size: 1732 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080411/72e7f6c8/attachment.bin 
