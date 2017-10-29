From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:27:40 +0100
Subject: [Buildroot] [git commit] package/libnfs: allow parallel build
Message-ID: <20171029172109.2D8B580159@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fe501818aaf12c4078cce0422495140b0be3d6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with BR2_JLEVEL=100.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnfs/libnfs.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 3636a2a..d961fd1 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -8,7 +8,6 @@ LIBNFS_VERSION = libnfs-2.0.0
 LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
-LIBNFS_MAKE = $(MAKE1)
 LIBNFS_LICENSE = LGPL-2.1+
 LIBNFS_LICENSE_FILES = LICENCE-LGPL-2.1.txt
 LIBNFS_DEPENDENCIES = host-pkgconf
