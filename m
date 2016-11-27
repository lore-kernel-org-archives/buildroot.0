From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:23:51 +0100
Subject: [Buildroot] [git commit] imagemagick: security bump to 7.0.3-8
Message-ID: <20161127212354.E5E8B81831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbe1f288d41e268c053d4355d65102eda721da2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2016-9556 (Heap buffer overflow in IsPixelGray).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 4bdfe8f..9eb3a9e 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 140b99f33a3326aed92132a7cd054ee962a6e2562064c68495640411aa4571d7  ImageMagick-7.0.3-7.tar.xz
+sha256 dc128b281c255d71d754934408d278b3ca314253103ca2501cd0b8d5ec98db74  ImageMagick-7.0.3-8.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 4f5c3be..f384fc3 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.3-7
+IMAGEMAGICK_VERSION = 7.0.3-8
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
