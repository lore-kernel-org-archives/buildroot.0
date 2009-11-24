From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Nov 2009 19:53:38 +0100
Subject: [Buildroot] [git commit master] gvfs: drop legacy uclibc dependency
Message-ID: <20091124190731.CC08877756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6b6bdaed7626b3d4312ae594f8879faa4b9a1977
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Mack <daniel@caiaq.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    4 ++++
 package/gvfs/gvfs.mk |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4a40b46..a3d6533 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,7 @@
+2009.11, Not released yet:
+
+	Updated/fixed packages: gvfs
+
 2009.11-rc1, Released November 23rd, 2009:
 
 	Fixes all over the tree and new features.
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index fc4716c..f8f81cd 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -14,7 +14,7 @@ GVFS_INSTALL_TARGET = YES
 GVFS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 GVFS_AUTORECONF = NO
-GVFS_DEPENDENCIES = uclibc host-pkgconfig host-libglib2 libglib2 dbus-glib shared-mime-info
+GVFS_DEPENDENCIES = host-pkgconfig host-libglib2 libglib2 dbus-glib shared-mime-info
 
 GVFS_CONF_OPT = \
 	--disable-gconf			\
-- 
1.6.3.3
