From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 6 Jan 2010 22:36:13 +0000 (UTC)
Subject: [Buildroot] How to avoid building u-boot when uimage kernel is
	selected?
Message-ID: <hi338s$mhp$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want to generage a uimage format kernel, so I understand why
mkimage needs to be built (though I'd just as soon it use one
from the host or perhaps the external toolchain's "/usr/bin"
directory).

However, I'd rather not have u-boot itself built (it's a waste
of time, since it's not going to be used). But, I can't figure
out any way to avoid it since BR2_TARGET_UBOOT is forced to "y"
if BR2_LINUX_BIN_UIMAGE is set.

-- 
Grant Edwards                   grante             Yow! I always have fun
                                  at               because I'm out of my
                               visi.com            mind!!!
