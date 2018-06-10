From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jun 2018 12:14:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtv-scan-tables: bump version
Message-ID: <20180610101415.20349-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dtv-scan-tables/dtv-scan-tables.hash | 2 +-
 package/dtv-scan-tables/dtv-scan-tables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index 1aa6bd59fa..29d0c4cc54 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 7ded9b437fc3345bbd13a6c1c446c54d0e24d2d337e5abda223adb6362916d8c  dtv-scan-tables-07b18ecef17493ac0908a2e112eae3fe269da7fa.tar.gz
+sha256 7860092725f07ac6f974415e9f06a2763710d308b0817f7c3641aaf4b902ccc5  dtv-scan-tables-c2b6af67f7d8620acbf052fc754ec831ed2188ba.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256 4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index b7f82562f2..fe0a310817 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTV_SCAN_TABLES_VERSION = 07b18ecef17493ac0908a2e112eae3fe269da7fa
+DTV_SCAN_TABLES_VERSION = c2b6af67f7d8620acbf052fc754ec831ed2188ba
 DTV_SCAN_TABLES_SITE = http://git.linuxtv.org/cgit.cgi/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
-- 
2.17.1
