From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 18:09:22 +0200
Subject: [Buildroot] [git commit] package/dtv-scan-tables: bump version
Message-ID: <20181008160918.803398E456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4df84e721bab930404668023e80d8615a73606fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dtv-scan-tables/dtv-scan-tables.hash | 2 +-
 package/dtv-scan-tables/dtv-scan-tables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index 29d0c4cc54..a4606bbe00 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 7860092725f07ac6f974415e9f06a2763710d308b0817f7c3641aaf4b902ccc5  dtv-scan-tables-c2b6af67f7d8620acbf052fc754ec831ed2188ba.tar.gz
+sha256 a9c9375a3d3087cf9ee47086c19fffe8e3bf52397928288d88cd7fa4d7f8944e  dtv-scan-tables-59f4a9b1dfbd573bafe33d238a08da95e4f0263a.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256 4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index fe0a310817..6477985881 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTV_SCAN_TABLES_VERSION = c2b6af67f7d8620acbf052fc754ec831ed2188ba
+DTV_SCAN_TABLES_VERSION = 59f4a9b1dfbd573bafe33d238a08da95e4f0263a
 DTV_SCAN_TABLES_SITE = http://git.linuxtv.org/cgit.cgi/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
