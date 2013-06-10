From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jun 2013 23:08:28 +0200
Subject: [Buildroot] [git commit] ntfs-3g: fix typo in license info files
Message-ID: <20130610211340.0F19A9A5B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a041c1339d6e3de7a3f3aec8a89f3ed1a3c5fef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ntfs-3g/ntfs-3g.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
