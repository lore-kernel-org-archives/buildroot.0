From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jun 2017 12:40:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: bump version to 5.0.6
Message-ID: <20170604104024.2032-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnuplot/gnuplot.hash | 8 +++++---
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index a71d00659..1ea8c2852 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,3 +1,5 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.0.5/
-md5 c5e96fca73afbee4f57cbc1bfce6b3b8  gnuplot-5.0.5.tar.gz
-sha1 c35f55657fdc33217dd70bbf3148578563ecaad1  gnuplot-5.0.5.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.0.6/
+md5 8ec46520a86a61163a701b00404faf1a  gnuplot-5.0.6.tar.gz
+sha1 f7b8948166b22e5bd658d5cf7579716f4821dba0  gnuplot-5.0.6.tar.gz
+# Locally computed
+sha256 5bbe4713e555c2e103b7d4ffd45fca69551fff09cf5c3f9cb17428aaacc9b460  gnuplot-5.0.6.tar.gz
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 3e00eefef..d59605c57 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.0.5
+GNUPLOT_VERSION = 5.0.6
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-- 
2.11.0
