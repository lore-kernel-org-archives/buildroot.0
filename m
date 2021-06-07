From: Michael Fischer <mf@go-sys.de>
Date: Mon, 7 Jun 2021 10:24:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: bump version to 5.4.2
Message-ID: <20210607082451.17896-1-mf@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/gnuplot/gnuplot.hash | 8 ++++----
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 9770185c21..84e71d79a7 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.1/
-md5  80f75b684f1175d36cd6908ff1ceb588  gnuplot-5.4.1.tar.gz
-sha1  bb1cd34f8ec0357eccef70122f0fd531ced5dd29  gnuplot-5.4.1.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.2/
+md5  2050ca477199a591543bc968aba7d899  gnuplot-5.4.2.tar.gz
+sha1  2e076b29f38bfcb841cb5eb3377fd1a469ced1ac  gnuplot-5.4.2.tar.gz
 # Locally computed
-sha256  6b690485567eaeb938c26936e5e0681cf70c856d273cc2c45fabf64d8bc6590e  gnuplot-5.4.1.tar.gz
+sha256  e57c75e1318133951d32a83bcdc4aff17fed28722c4e71f2305cfc2ae1cae7ba  gnuplot-5.4.2.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 9a72a47144..436d3e5f92 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.4.1
+GNUPLOT_VERSION = 5.4.2
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-- 
2.20.1
