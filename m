From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 11 Mar 2008 18:56:47 +0000
Subject: [Buildroot] svn commit: trunk/buildroot:	package/editors/uemacs
	package/module-in etc...
In-Reply-To: <20080311185419.65024120135@busybox.net>
References: <20080311185419.65024120135@busybox.net>
Message-ID: <1205261807.10692.241.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 2008-03-11 at 11:54 -0700, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-03-11 11:54:17 -0700 (Tue, 11 Mar 2008)
> New Revision: 21305
> 
> Log:
> buildroot: use BR2_KERNEL_MIRROR everywhere
> 
> Based on patch by Nigel Kukard.
> 
> 
> Modified:
>    trunk/buildroot/package/editors/uemacs/uemacs.mk
>    trunk/buildroot/package/module-init-tools/module-init-tools.mk
>    trunk/buildroot/package/modutils/modutils.mk
>    trunk/buildroot/package/udev/udev.mk
>    trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk
>    trunk/buildroot/toolchain/binutils/binutils.mk
>    trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile

Didn't add it eveyrwhere as I wasn't sure if all the sources were
available on all the mirrors  ;)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080311/1ad57928/attachment.pgp 
