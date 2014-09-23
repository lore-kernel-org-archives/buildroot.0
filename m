From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 21:55:12 +0200
Subject: [Buildroot] [git commit] gnuplot: bump to version 4.6.6
Message-ID: <20140923195657.CFBF19D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b337a08c92546edd2befc6a9421c7b9025bdc78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuplot/gnuplot.hash |    3 +++
 package/gnuplot/gnuplot.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

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
