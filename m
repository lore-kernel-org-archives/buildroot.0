From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2016 22:31:31 +0100
Subject: [Buildroot] [git commit] package/imagemagick: bump version to
	6.9.3-2
Message-ID: <20160201224701.16C3A7F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bea9d6c52140a4e65285abef2e7691ef72c4836
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 75ad035..1d5794f 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 da2f6fba43d69f20ddb11783f13f77782b0b57783dde9cda39c9e5e733c2013c ImageMagick-6.9.2-10.tar.xz
+sha256	78a9bfc581c81fb8376c00d06431b49f218d3900690905dc985459cbf5e41c4d	ImageMagick-6.9.3-2.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index b3d6a83..76061fa 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.2-10
+IMAGEMAGICK_VERSION = 6.9.3-2
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
