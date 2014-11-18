From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 18 Nov 2014 10:16:20 +0000
Subject: [Buildroot] [PATCH] imagemagick: bump version to 6.9.0-0
Message-ID: <1416305780-3302-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 6.9.0-0
- Update the hash value

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/imagemagick/imagemagick.hash |    4 ++--
 package/imagemagick/imagemagick.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index e67e059..20bc982 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	a4cccc70179ff2c67550e063cdcb2e62907338ef3e68b45bb1c41931e515b3eb	ImageMagick-6.8.9-9.tar.xz
+# From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
+sha256  12331c904c691cb128865fdc97e5f8a2654576f9b032e274b74dd7617aa1b9b6  ImageMagick-6.9.0-0.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index a1296d4..b8e5155 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.8.9-9
+IMAGEMAGICK_VERSION = 6.9.0-0
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
1.7.1
