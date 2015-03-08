From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Mar 2015 22:23:53 +0100
Subject: [Buildroot] [git commit] imagemagick: bump to version 6.9.0-10
Message-ID: <20150308212414.9FF13807F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b93fae4ade8a6ec247d432e4979a5afeb4ba5f59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update hash file.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash |    2 +-
 package/imagemagick/imagemagick.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 7df1ade..16d5927 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256 4f680e1ccfa31e18a8ca829e7749ebd62f2f81dfdba943f9504a824176f51c76 ImageMagick-6.9.0-9.tar.xz
+sha256 d1f5dcd32a93130feb9e980a8a97517d3a2c814a8b608d139d4756516548748c ImageMagick-6.9.0-10.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 9a10e93..f11ebf5 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.0-9
+IMAGEMAGICK_VERSION = 6.9.0-10
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
