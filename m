From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 15:53:53 +0200
Subject: [Buildroot] [git commit] util-linux: improve license description
Message-ID: <20161016135433.80041817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd1e5ba54b253c43d66f1401dc0975d86ef82196
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the recommended format for describing the license of different
components.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index ca00f30..4dadc3f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -11,7 +11,7 @@ UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERS
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
-UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, libblkid, libfdisk and libmount LGPLv2.1+, libuuid BSD-3c
+UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, LGPLv2.1+ (libblkid, libfdisk, libmount), BSD-3c (libuuid)
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
