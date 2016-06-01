From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 Jun 2016 21:20:56 +0200
Subject: [Buildroot] [git commit] package/imagemagick: bump version to
	6.9.4-6
Message-ID: <20160601192133.DAEFB81861@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61dd71243d4035eb05cb5771e99c03799e3f3f0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 9a2a3ee..8a51047 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 2ea0fef839cd5d6f134502b7cf7ee0e57a3f230b19771515d4aa44354f4c6b3b ImageMagick-6.9.4-1.tar.xz
+sha256 c028642af5f4cbae864b4afd6ea96878191be64103ca9c7cc67612ec3cbb9dec ImageMagick-6.9.4-6.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index c952c2a..74ac5a4 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.4-1
+IMAGEMAGICK_VERSION = 6.9.4-6
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
