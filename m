From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Jan 2013 19:56:07 +0100
Subject: [Buildroot] [git commit] ntfs-3g: bump to version 2013.1.13
Message-ID: <20130125185919.1C0789A750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13b0a3fa84140a1b45a487914dd3a6397204c171
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ntfs-3g/ntfs-3g.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index cefb73a..e9a91a4 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -4,12 +4,14 @@
 #
 #############################################################
 
-NTFS_3G_VERSION = 2012.1.15
+NTFS_3G_VERSION = 2013.1.13
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPT = --disable-ldconfig
 NTFS_3G_INSTALL_STAGING = YES
 NTFS_3G_DEPENDENCIES = host-pkgconf
+NTFS_3G_LICENSE = GPLv2+ LGPLv2+
+NTSF_3G_LICENSE_FILES = COPYING COPYING.LIB
 
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 	NTFS_3G_CONF_OPT += --with-fuse=external
