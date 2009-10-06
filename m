From: Daniel Mack <daniel@caiaq.de>
Date: Tue,  6 Oct 2009 18:53:33 +0800
Subject: [Buildroot] [PATCH] e2fsprogs: bump version number to 1.41.9
Message-ID: <1254826414-20763-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 package/e2fsprogs/e2fsprogs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index ed9bacb..ca7a37e 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -3,7 +3,7 @@
 # e2fsprogs
 #
 #############################################################
-E2FSPROGS_VERSION:=1.41.3
+E2FSPROGS_VERSION:=1.41.9
 E2FSPROGS_SOURCE=e2fsprogs-$(E2FSPROGS_VERSION).tar.gz
 E2FSPROGS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 E2FSPROGS_DIR=$(BUILD_DIR)/e2fsprogs-$(E2FSPROGS_VERSION)
-- 
1.6.0.4
