From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:11:43 +0200
Subject: [Buildroot] [git commit] package/gnuplot: bump version to 5.0.6
Message-ID: <20170605091231.B69B082823@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eba61ba3b256f8c9c601e2d9078a1c9c7c74715b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuplot/gnuplot.hash | 8 +++++---
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index a71d006..1ea8c28 100644
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
index 3e00eef..d59605c 100644
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
