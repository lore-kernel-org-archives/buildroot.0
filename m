From: MikeW <mw_phil@yahoo.co.uk>
Date: Mon, 19 Feb 2007 16:08:12 +0000 (UTC)
Subject: [Buildroot]
	=?utf-8?q?svn_commit=3A_trunk/buildroot=3A_package_ta?=
	=?utf-8?q?rget=09target/device_toolchain_etc_-_buildroot_build_wit?=
	=?utf-8?q?h_ext_toolchain_fails?=
References: <20070206181938.DD35C4866D@busybox.net>
Message-ID: <loom.20070219T165323-695@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 <sjhill@...> writes:

> 
> Author: sjhill
> Date: 2007-02-06 10:19:38 -0800 (Tue, 06 Feb 2007)
> New Revision: 17800
> 
> Log:
> Support building using an external toolchain. Questions to the mailing list
and all other comments to <biteme@...>.

sjhill,

Question:
....
from /home/fred/buildroot/build_arm_nofpu/busybox-1.2.2.1/include/busybox.h:12,
                 from
/home/fred/buildroot/build_arm_nofpu/busybox-1.2.2.1/applets/applets.c:15:
/opt/toolchain/arm/v5t_le/target/usr/include/sys/param.h:24:25: linux/param.h:
No such file or directory
make[2]: ***
[/home/fred/buildroot/build_arm_nofpu/busybox-1.2.2.1/applets/applets.o] Error 1

Is something missing an Include path somewhere ?

Or is it a case of this:
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/1932 ,
if so, could there be a generic 'external toolchain' fix, or would each
pkg need makefiles modding ...

Thx,
MikeW
