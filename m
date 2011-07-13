From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 13 Jul 2011 18:54:47 +0200
Subject: [Buildroot] [PATCH 1/3] gvfs: update to latest upstream version
	(1.8.2)
Message-ID: <1310576089-9207-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/gvfs/gvfs.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index adfa966..bd370b5 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -3,8 +3,8 @@
 # gvfs
 #
 #############################################################
-GVFS_VERSION_MAJOR = 1.6
-GVFS_VERSION_MINOR = 6
+GVFS_VERSION_MAJOR = 1.8
+GVFS_VERSION_MINOR = 2
 GVFS_VERSION = $(GVFS_VERSION_MAJOR).$(GVFS_VERSION_MINOR)
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.gz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
-- 
1.7.1
