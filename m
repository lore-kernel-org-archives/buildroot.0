From: Daniel Mack <daniel@caiaq.de>
Date: Tue, 24 Nov 2009 17:15:35 +0100
Subject: [Buildroot] [PATCH] gvfs: drop legacy uclibc dependency
Message-ID: <1259079335-15258-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 package/gvfs/gvfs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 7d71f34..41ecfa6 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -14,7 +14,7 @@ GVFS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 GVFS_AUTORECONF = NO
 GVFS_LIBTOOL_PATCH = NO
 
-GVFS_DEPENDENCIES = uclibc host-pkgconfig host-libglib2 libglib2 dbus-glib shared-mime-info
+GVFS_DEPENDENCIES = host-pkgconfig host-libglib2 libglib2 dbus-glib shared-mime-info
 
 GVFS_CONF_OPT = \
 	--disable-gconf			\
-- 
1.6.5.2
