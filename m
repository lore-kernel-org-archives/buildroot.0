From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 13:05:28 +0100
Subject: [Buildroot] [git commit] imagemagick: bump version to 7.0.3-7
	(security)
Message-ID: <20161116120538.90E2481D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12c2c80aa379411f178023ba9194e48e249a7571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

oss-security reference:
  http://www.openwall.com/lists/oss-security/2016/11/13/1

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 8ad340d..4bdfe8f 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 86a1f04077de2b1486a93088030b010780067b25ab0284560435e2f458e247ca ImageMagick-7.0.3-4.tar.xz
+sha256 140b99f33a3326aed92132a7cd054ee962a6e2562064c68495640411aa4571d7  ImageMagick-7.0.3-7.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 2cae064..4f5c3be 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.3-4
+IMAGEMAGICK_VERSION = 7.0.3-7
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
