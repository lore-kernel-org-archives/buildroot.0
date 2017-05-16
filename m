From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 21:36:15 +0200
Subject: [Buildroot] [git commit branch/next] imagemagick: bump version to
	7.0.5-6
Message-ID: <20170516194312.6A8EA82823@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cd8ad2364cb178e7d6c99462b05668dac1485d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 06a957a..b7be7bc 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 c3644119dce993aa241fa08eced2cb6043fb5345f0eee7a7822a497f1142ebe3  ImageMagick-7.0.5-5.tar.xz
+sha256 f60c3e3466ccbf9a0e643284ffec3467363edf9611f16a98387f927a974b49ab  ImageMagick-7.0.5-6.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 6b5cd4e..b1048f5 100644
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
