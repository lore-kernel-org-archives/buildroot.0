From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Jun 2019 21:22:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtv-scan-tables: bump version
Message-ID: <20190624192245.30208-1-bernd.kuhls@t-online.de>
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
index a4606bbe00..322c9ed1b0 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 a9c9375a3d3087cf9ee47086c19fffe8e3bf52397928288d88cd7fa4d7f8944e  dtv-scan-tables-59f4a9b1dfbd573bafe33d238a08da95e4f0263a.tar.gz
+sha256 544531d11592cbd23083c5e07b2de060fc1eeeb5a3c37f1b2c28fa59241b3a2b  dtv-scan-tables-1c187978d479a2f941c9c4fb10d8b2612d5fde3c.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256 4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 6477985881..9e33ac6616 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTV_SCAN_TABLES_VERSION = 59f4a9b1dfbd573bafe33d238a08da95e4f0263a
+DTV_SCAN_TABLES_VERSION = 1c187978d479a2f941c9c4fb10d8b2612d5fde3c
 DTV_SCAN_TABLES_SITE = http://git.linuxtv.org/cgit.cgi/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
-- 
2.20.1
