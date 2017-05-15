From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 15 May 2017 13:31:44 +0100
Subject: [Buildroot] [PATCH next] imagemagick: bump version to 7.0.5-6
Message-ID: <20170515123144.52524-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 06a957a89..b7be7bc66 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 c3644119dce993aa241fa08eced2cb6043fb5345f0eee7a7822a497f1142ebe3  ImageMagick-7.0.5-5.tar.xz
+sha256 f60c3e3466ccbf9a0e643284ffec3467363edf9611f16a98387f927a974b49ab  ImageMagick-7.0.5-6.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 6b5cd4eae..b1048f5f6 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.5-5
+IMAGEMAGICK_VERSION = 7.0.5-6
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.13.0
