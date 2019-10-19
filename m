From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Oct 2019 10:18:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/dtv-scan-tables: bump version
Message-ID: <20191019081813.8482-1-bernd.kuhls@t-online.de>
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
index 322c9ed1b0..73e0e7d19a 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 544531d11592cbd23083c5e07b2de060fc1eeeb5a3c37f1b2c28fa59241b3a2b  dtv-scan-tables-1c187978d479a2f941c9c4fb10d8b2612d5fde3c.tar.gz
+sha256 76cb6131df1b35ed71b0f6c87cfafc188d614cfbd9973e7832a65ba63e85c504  dtv-scan-tables-6d019038cd04e837d9dd58701202c15924c1c654.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256 4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 9e33ac6616..5933f16776 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTV_SCAN_TABLES_VERSION = 1c187978d479a2f941c9c4fb10d8b2612d5fde3c
+DTV_SCAN_TABLES_VERSION = 6d019038cd04e837d9dd58701202c15924c1c654
 DTV_SCAN_TABLES_SITE = http://git.linuxtv.org/cgit.cgi/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
-- 
2.20.1
