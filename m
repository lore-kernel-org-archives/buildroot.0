From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Oct 2014 08:41:08 +0200
Subject: [Buildroot] [git commit] libgeotiff: add license information
Message-ID: <20141010100415.95D94B1D2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9721b54f3a2074d3333543cf9a130d90a27eb4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use X11-style instead of X-style]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgeotiff/libgeotiff.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 61f5c21..96f04c2 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -6,6 +6,8 @@
 
 LIBGEOTIFF_VERSION = 1.4.0
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
+LIBGEOTIFF_LICENSE = X11-style, public domain
+LIBGEOTIFF_LICENSE_FILES = LICENSE
 LIBGEOTIFF_DEPENDENCIES = tiff host-pkgconf
 LIBGEOTIFF_INSTALL_STAGING = YES
 LIBGEOTIFF_AUTORECONF = YES
