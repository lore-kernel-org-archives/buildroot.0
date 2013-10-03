From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 03 Oct 2013 13:49:05 +0800
Subject: [Buildroot] [PATCH] rsync: bump to version 3.1.0
Message-ID: <1380779345.884.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/rsync/rsync.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 94c2e75..30748b5 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.0.9
+RSYNC_VERSION = 3.1.0
 RSYNC_SOURCE = rsync-$(RSYNC_VERSION).tar.gz
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPLv3+
-- 
1.8.1.2
