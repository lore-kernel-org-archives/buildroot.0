From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 3 Feb 2017 14:24:55 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] imagemagick: bump version
	to 7.0.4-5
Message-ID: <20170203132519.18F23803CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21dc9299a2b0b9c2545869c5b5d3fc69ae7abbd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ad736e199cf9127688645cafc34c94a15251c623)
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index d0ed022..3f5bfb1 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 c46975d23ff0c587219daaa3e1dbd43a54a5d7d5ec20d0bdc2c34188facdb0f9  ImageMagick-7.0.4-4.tar.xz
+sha256 69178335a906202928571e25b1670a4bb066500b9693c7ba554583e8d700fcf5  ImageMagick-7.0.4-5.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 9d2c964..64c6a35 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.4-4
+IMAGEMAGICK_VERSION = 7.0.4-5
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
