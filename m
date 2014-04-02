From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Apr 2014 21:46:27 +0200
Subject: [Buildroot] [PATCH v2 12/41] libnfs: version bump 1.9.3
In-Reply-To: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396468015-1724-13-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libnfs/libnfs.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index a17d8c3..55ce57a 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = libnfs-1.8.0
+LIBNFS_VERSION = libnfs-1.9.3
 LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
-- 
1.7.10.4
