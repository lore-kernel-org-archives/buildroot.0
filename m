From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Jun 2013 14:09:47 -0300
Subject: [Buildroot] [PATCH] ntfs-3g: fix typo in license info files
Message-ID: <1370884187-4370-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntfs-3g/ntfs-3g.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 55a4d7b..5c6f4d9 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -11,7 +11,7 @@ NTFS_3G_CONF_OPT = --disable-ldconfig
 NTFS_3G_INSTALL_STAGING = YES
 NTFS_3G_DEPENDENCIES = host-pkgconf
 NTFS_3G_LICENSE = GPLv2+ LGPLv2+
-NTSF_3G_LICENSE_FILES = COPYING COPYING.LIB
+NTFS_3G_LICENSE_FILES = COPYING COPYING.LIB
 
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 	NTFS_3G_CONF_OPT += --with-fuse=external
-- 
1.8.1.5
