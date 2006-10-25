From: Paugam Luc <luc.paugam@thomson.net>
Date: Wed, 25 Oct 2006 17:37:19 +0200
Subject: [Buildroot] ERROR: ccache says "(No such file or directory)" !!!
Message-ID: <E55CA8ECFBA85E4CB8E8173566B9EFEB287B3F@rennsmail04.eu.thmulti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After compiling and installing the buildroot's toolchain for armeb with
ccache enabled, I removed my build directories to keep only the
installed toolchain.
And then, it is impossible to execute gcc, like: armeb-linux-gcc
--version
I have the following error:

ccache: failed to create
/opt/lpm/ARM926ej/buildroot_uClibc/buildroot-20061012_GCC3.4.6/toolchain
_build_armeb_nofpu/ccache-2.4/cache (No such file or directory)

It seems that ccache keep the information of the build directory path! I
am wondering why?
It does not allow to install the toolchain in other environment system.

Could you tell me please, if I did something wrong?

PS: my toolchain config (buildroot-20061012)
	armeb, generic arm (EABI)
	kernel headers 2.4.31
	uclibc snapshot (20061024)
	binutils 2.16.1, gcc 3.4.6, multilib, softfloat
	ccache enabled

Many thanks for your collaboration.

Regards - Luc
