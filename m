From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Dec 2014 11:13:40 +0100
Subject: [Buildroot] [git commit] imagemagick: bump to version 6.9.0-2
Message-ID: <20141230102544.EC606807CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbd8c5dab7b34bfe6009d6142b636d29c64f3d3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use correct sha256sum]
Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash |    2 +-
 package/imagemagick/imagemagick.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 20bc982..ec3e0a1 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256  12331c904c691cb128865fdc97e5f8a2654576f9b032e274b74dd7617aa1b9b6  ImageMagick-6.9.0-0.tar.xz
+sha256	ce7ced11cc1019cd37518ebc4ea03ffaff8e6891aaf41a05615689dafe854ff6  ImageMagick-6.9.0-2.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index db3b563..18d8729 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.0-0
+IMAGEMAGICK_VERSION = 6.9.0-2
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
