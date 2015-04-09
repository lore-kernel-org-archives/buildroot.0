From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  9 Apr 2015 20:16:10 +0200
Subject: [Buildroot] [PATCH v4 3/3] package/dtv-scan-tables: bump version
In-Reply-To: <1428603370-15627-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428603370-15627-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1428603370-15627-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: no changes
v3: no changes
v2: bump to current git master

 package/dtv-scan-tables/dtv-scan-tables.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 9d85325..4114d23 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTV_SCAN_TABLES_VERSION = 1246b27f8b45f84c1824925060ad931530542f2e
+DTV_SCAN_TABLES_VERSION = f2053b34a5ac6f263edc22888b0db4b1fa563fe4
 DTV_SCAN_TABLES_SITE = http://git.linuxtv.org/cgit.cgi/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
-- 
1.7.10.4
