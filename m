From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Oct 2014 23:56:37 +0200
Subject: [Buildroot] [git commit] libgeotiff: bump to version 1.4.0
Message-ID: <20141010100415.3D750B1D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f5e9f200dc3295d2a9e6f4f1dd839485ad350b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgeotiff/libgeotiff.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 5cfcbea..f6568c1 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.3.0
+LIBGEOTIFF_VERSION = 1.4.0
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_DEPENDENCIES = tiff
 LIBGEOTIFF_INSTALL_STAGING = YES
