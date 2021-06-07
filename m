From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jun 2021 23:42:21 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/imagemagick:
 security bump to version 7.0.11-13
Message-ID: <20210607211335.106618B845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b14c5918d4022e1a67ec85bd65e115a36f4bb32c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2021-20309 to CVE-2021-20313

https://github.com/ImageMagick/ImageMagick/blob/7.0.11-13/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d64238104949d3c3653cc35f1cb76282792d4c4f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index c45caf6c52..b787643fde 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  84442158aea070095efa832cfe868fd99d6befdf609444f0c9e9f1b4f25480cd  imagemagick-7.0.10-62.tar.gz
+sha256  fc454be622724c6224fa6c8230bb9c50191a05fbf05b9c9c25aa3e5497090b83  imagemagick-7.0.11-13.tar.gz
 sha256  040badb77b659e751ea16113490a937e1e01f3f5d32181e966b8982413533fb2  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 97517228cf..a6eaf99887 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.10-62
+IMAGEMAGICK_VERSION = 7.0.11-13
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
