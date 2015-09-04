From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 11:57:18 +0200
Subject: [Buildroot] [git commit] tiff: bump to version 4.0.5
Message-ID: <20150904100014.1A9C77FB60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b76de6b60491073720439490121d4f94e511d6e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.hash |    2 +-
 package/tiff/tiff.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index c594568..9cb31dc 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	8cb1d90c96f61cdfc0bcf036acc251c9dbe6320334da941c7a83cfe1576ef890	tiff-4.0.4.tar.gz
+sha256	e25eaa83ed7fab43ddd278b9b14d91a406a4b674cedc776adb95535f897f309c	tiff-4.0.5.tar.gz
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 548e47a..9a2bf70 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.0.4
+TIFF_VERSION = 4.0.5
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
