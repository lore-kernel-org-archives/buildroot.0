From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Mar 2015 23:46:28 +0100
Subject: [Buildroot] [git commit] imagemagick: bump to version 6.9.0-9
Message-ID: <20150302224950.845D77FA36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f6edcc7927de81c7600e92a6101226bc1f7a65a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash |    2 +-
 package/imagemagick/imagemagick.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 9d331f5..7df1ade 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256 90c90397ccf74200cd0e3931d3b26e6722665db235a66a5af392ac25d133d8c2 ImageMagick-6.9.0-7.tar.xz
+sha256 4f680e1ccfa31e18a8ca829e7749ebd62f2f81dfdba943f9504a824176f51c76 ImageMagick-6.9.0-9.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 03c1bd4..9a10e93 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.0-7
+IMAGEMAGICK_VERSION = 6.9.0-9
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
