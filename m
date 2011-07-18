From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jul 2011 23:17:39 +0200
Subject: [Buildroot] [git commit] gvfs: update to latest upstream version
	(1.8.2)
Message-ID: <20110718211805.321428ACEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d2b438cd1409dc2a61cd3428ec6da6a2f66633af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
