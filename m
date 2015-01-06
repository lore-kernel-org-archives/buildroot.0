From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Jan 2015 14:25:34 -0300
Subject: [Buildroot] [PATCH] imagemagick: security bump to version 6.9.0-3
Message-ID: <1420565134-25535-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes many of the reported security audit vulnerabilities:
http://www.openwall.com/lists/oss-security/2014/12/24/1

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index ec3e0a1..f23795b 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256	ce7ced11cc1019cd37518ebc4ea03ffaff8e6891aaf41a05615689dafe854ff6  ImageMagick-6.9.0-2.tar.xz
+sha256	f00452ba2c05c2df9624c62d7adb49ecf17140edd6e5f355cceca051dab1fb38  ImageMagick-6.9.0-3.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 18d8729..4e76332 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.0-2
+IMAGEMAGICK_VERSION = 6.9.0-3
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
2.0.5
