From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jun 2015 22:14:09 +0200
Subject: [Buildroot] [git commit] tiff: security bump to version 4.0.4
Message-ID: <20150622201513.66180806B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75ead4186d04f969838d392452d547afbd13b18d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-8128 - Check memory allocations for failure. Also check
multiplication overflow.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.hash |    2 +-
 package/tiff/tiff.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 361b5e1..c594568 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ea1aebe282319537fb2d4d7805f478dd4e0e05c33d0928baba76a7c963684872	tiff-4.0.3.tar.gz
+sha256	8cb1d90c96f61cdfc0bcf036acc251c9dbe6320334da941c7a83cfe1576ef890	tiff-4.0.4.tar.gz
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 6db2abd..548e47a 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.0.3
+TIFF_VERSION = 4.0.4
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
