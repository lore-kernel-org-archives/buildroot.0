From: Daniel Mack <daniel@caiaq.de>
Date: Tue, 24 Nov 2009 16:02:40 +0100
Subject: [Buildroot] [PATCH] libfuse: bump version number to 2.8.1
Message-ID: <1259074960-9032-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 package/fuse/libfuse.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/fuse/libfuse.mk b/package/fuse/libfuse.mk
index 05bc389..b45f9ee 100644
--- a/package/fuse/libfuse.mk
+++ b/package/fuse/libfuse.mk
@@ -3,7 +3,7 @@
 # libfuse
 #
 #############################################################
-LIBFUSE_VERSION:=2.7.3
+LIBFUSE_VERSION:=2.8.1
 LIBFUSE_SOURCE:=fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/
 LIBFUSE_DIR:=$(BUILD_DIR)/fuse-$(LIBFUSE_VERSION)
-- 
1.6.5.2
