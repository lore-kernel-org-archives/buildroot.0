From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:36:37 +0100
Subject: [Buildroot] [git commit branch/next] imagemagick: bump to version
	6.9.0-6
Message-ID: <20150219203644.761527FE03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=383fa78e3ceb6e0eb1fa789c9d94f1a234b67d33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabio Porcedda <Fabio.Porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.hash |    2 +-
 package/imagemagick/imagemagick.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 92d2239..09b6dcd 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256 56e3ba52ef0a0c0bc25b34a435312d0ee2aa22f43ba74801ab3888b37b21871e  ImageMagick-6.9.0-5.tar.xz
+sha256 a47f2731d453df502a93036ca1fea44c5852ed1b2c36af4343e6afb18652fefd ImageMagick-6.9.0-6.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 7ddde6e..a72778c 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.0-5
+IMAGEMAGICK_VERSION = 6.9.0-6
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
