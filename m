From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Sep 2014 11:41:34 -0300
Subject: [Buildroot] [PATCH] gnuplot: bump to version 4.6.6
Message-ID: <1411483294-9742-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnuplot/gnuplot.hash | 3 +++
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/gnuplot/gnuplot.hash

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
new file mode 100644
index 0000000..6898e90
--- /dev/null
+++ b/package/gnuplot/gnuplot.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/gnuplot/files/gnuplot/4.6.6/
+md5	9c541f553c2491c56fc8b6126ff4ff73	gnuplot-4.6.6.tar.gz
+sha1	53802f565a87a6d5044d0b9c2422b5eb905d1d45	gnuplot-4.6.6.tar.gz
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index d5fe01c..b12c763 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 4.6.2
+GNUPLOT_VERSION = 4.6.6
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-- 
1.8.5.5
