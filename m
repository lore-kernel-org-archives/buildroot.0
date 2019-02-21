From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:35:57 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] jpeg-turbo: bump to
 version 1.5.3
Message-ID: <20190221104037.3B12D815A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b23c5a7aa4bebdb04b2c79e5f177cae274a763f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a08d7f44ea855852cff293444813762dbbbbb32f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 8 ++++----
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 11b323b8bf..df1c053005 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/1.5.2/
-sha1 e788f6defa58b4393a5e1685c018f3b962971457  libjpeg-turbo-1.5.2.tar.gz
-md5 6b4923e297a7eaa255f08511017a8818  libjpeg-turbo-1.5.2.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/1.5.3/
+sha1 87ebf4cab2bb27fcb8e7ccb18ec4eb680e1f2c2d  libjpeg-turbo-1.5.3.tar.gz
+md5 7c82f0f6a3130ec06b8a4d0b321cbca3  libjpeg-turbo-1.5.3.tar.gz
 # Locally computed
-sha256 9098943b270388727ae61de82adec73cf9f0dbb240b3bc8b172595ebf405b528  libjpeg-turbo-1.5.2.tar.gz
+sha256 b24890e2bb46e12e72a79f7e965f409f4e16466d00e1dd15d93d73ee6b592523  libjpeg-turbo-1.5.3.tar.gz
 sha256 5c08657eda60b7946a913ee22ac73603335a468a6aa95204506a1586a8d677ee  LICENSE.md
 sha256 53a3e3c299e08856964f4c5986e242c3695837b73c64625092f70c774e8af5d2  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index d52ab916e0..2b5d876928 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 1.5.2
+JPEG_TURBO_VERSION = 1.5.3
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
