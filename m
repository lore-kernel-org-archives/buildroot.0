From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:56:28 +0200
Subject: [Buildroot] [git commit] libsysfs: add license information
Message-ID: <20140625211214.074209D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88c65328dd1fbfb0ceaab8adea804d4774e49511
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsysfs/libsysfs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index 6bd3c5c..fb0310f 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -8,5 +8,7 @@ LIBSYSFS_VERSION = 2.1.0
 LIBSYSFS_SITE = http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
 LIBSYSFS_SOURCE = sysfsutils-$(LIBSYSFS_VERSION).tar.gz
 LIBSYSFS_INSTALL_STAGING = YES
+LIBSYSFS_LICENSE = GPLv2 (utilities), LGPLv2.1+ (library)
+LIBSYSFS_LICENSE_FILES = cmd/GPL lib/LGPL
 
 $(eval $(autotools-package))
