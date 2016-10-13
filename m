From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 08:05:13 +0200
Subject: [Buildroot] [git commit] imagemagick: security bump to version
	7.0.3-3
Message-ID: <20161013060802.4B69B82269@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=618fa6da21e65291c131b05ed9e44acc3ab598ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
memory allocate failure in AcquireQuantumPixels (quantum.c)
heap-based buffer overflow in IsPixelMonochrome (pixel-accessor.h)

No CVEs assigned yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index dcbef18..fa43d58 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 22df4f197985f36f77b7b0d44de92ff44415885045f0191b3319540bdc82ff53 ImageMagick-7.0.2-9.tar.xz
+sha256 6ed0b059c9a108a631e0febcf9a9338342e25df4bbc9a9531ffe36d66031b0d8 ImageMagick-7.0.3-3.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 373765c..39d79d8 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.2-9
+IMAGEMAGICK_VERSION = 7.0.3-3
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
