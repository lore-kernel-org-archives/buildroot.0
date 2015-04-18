From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:59:34 +0200
Subject: [Buildroot] [git commit] package: update some home page URLs in
	Config.in.host files
Message-ID: <20150418135953.E0DE27FDC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a241b30278ba9f41042768f01736e8a243c572e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some URLs for package/*/Config.in.host files could use some updating.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dfu-util/Config.in.host  |    2 +-
 package/dos2unix/Config.in.host  |    2 +-
 package/e2fsprogs/Config.in.host |    2 +-
 package/mke2img/Config.in.host   |    2 ++
 package/openocd/Config.in.host   |    2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/dfu-util/Config.in.host b/package/dfu-util/Config.in.host
index b2a8f82..ea47a36 100644
--- a/package/dfu-util/Config.in.host
+++ b/package/dfu-util/Config.in.host
@@ -5,4 +5,4 @@ config BR2_PACKAGE_HOST_DFU_UTIL
 	  specification of the USB forum. DFU is intended to download
 	  and upload firmware to devices connected over USB.
 
-	  http://dfu-util.gnumonks.org/
+	  http://dfu-util.sourceforge.net/
diff --git a/package/dos2unix/Config.in.host b/package/dos2unix/Config.in.host
index a02e005..012d614 100644
--- a/package/dos2unix/Config.in.host
+++ b/package/dos2unix/Config.in.host
@@ -3,4 +3,4 @@ config BR2_PACKAGE_HOST_DOS2UNIX
 	help
 	  dos2unix converts text file line endings between CRLF and LF
 
-	  http://freshmeat.net/projects/dos2unix
+	  http://freecode.com/projects/dos2unix
diff --git a/package/e2fsprogs/Config.in.host b/package/e2fsprogs/Config.in.host
index bc0c71c..de9148e 100644
--- a/package/e2fsprogs/Config.in.host
+++ b/package/e2fsprogs/Config.in.host
@@ -3,4 +3,4 @@ config BR2_PACKAGE_HOST_E2FSPROGS
 	help
 	  The EXT2/3/4 file system utilities.
 
-	  http://e2fsprogs.sf.net
+	  http://e2fsprogs.sourceforge.net
diff --git a/package/mke2img/Config.in.host b/package/mke2img/Config.in.host
index 9781c6a..b5bcb84 100644
--- a/package/mke2img/Config.in.host
+++ b/package/mke2img/Config.in.host
@@ -7,3 +7,5 @@ config BR2_PACKAGE_HOST_MKE2IMG
 
 	  This tool is bundled by, and specific to Buildroot. However, it can
 	  be used from post-images scripts is needed.
+
+	  https://code.google.com/p/mke2img/
diff --git a/package/openocd/Config.in.host b/package/openocd/Config.in.host
index 2380942..e1d0e63 100644
--- a/package/openocd/Config.in.host
+++ b/package/openocd/Config.in.host
@@ -3,4 +3,4 @@ config BR2_PACKAGE_HOST_OPENOCD
 	help
 	  OpenOCD - Open On-Chip Debugger
 
-	  http://openocd.berlios.de/web/
+	  http://openocd.org/
