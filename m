From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 16:35:20 +0100
Subject: [Buildroot] [git commit] libgeotiff: bump to version 1.4.3
Message-ID: <20190119153718.5C6A881796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99edc752c0a4f92e2b943e3be7274fb96cf3e76f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgeotiff/libgeotiff.hash | 2 +-
 package/libgeotiff/libgeotiff.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
index a2b16ac0b2..08e8e06788 100644
--- a/package/libgeotiff/libgeotiff.hash
+++ b/package/libgeotiff/libgeotiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ad87048adb91167b07f34974a8e53e4ec356494c29f1748de95252e8f81a5e6e libgeotiff-1.4.2.tar.gz
+sha256 b8510d9b968b5ee899282cdd5bef13fd02d5a4c19f664553f81e31127bc47265 libgeotiff-1.4.3.tar.gz
 sha256 16b83cf7c3bbfd20bffa768b9bfdb16506ca50f5c140a9f3431e740b155359c1 LICENSE
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index a1f234b33b..522802cc94 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.4.2
+LIBGEOTIFF_VERSION = 1.4.3
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_LICENSE = X11-style, public domain
 LIBGEOTIFF_LICENSE_FILES = LICENSE
