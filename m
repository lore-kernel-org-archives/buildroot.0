From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 10:52:37 +0200
Subject: [Buildroot] [git commit] imagemagick: bump version to 7.0.3-4
Message-ID: <20161013085321.6ECAB82266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=521aaf55546eac9f44b22eb01bec8cd145eb6650
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

7.0.3-3 is no longer available upstream and has instead been replaced by -4,
so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index fa43d58..8ad340d 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 6ed0b059c9a108a631e0febcf9a9338342e25df4bbc9a9531ffe36d66031b0d8 ImageMagick-7.0.3-3.tar.xz
+sha256 86a1f04077de2b1486a93088030b010780067b25ab0284560435e2f458e247ca ImageMagick-7.0.3-4.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 39d79d8..2cae064 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.3-3
+IMAGEMAGICK_VERSION = 7.0.3-4
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
