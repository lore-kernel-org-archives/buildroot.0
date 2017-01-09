From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 9 Jan 2017 14:34:40 +0000
Subject: [Buildroot] [PATCH] imagemagick: bump version to 7.0.4-3 (security)
Message-ID: <20170109143440.441-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2016-8707 (Fix possible buffer overflow when writing
compressed TIFFS). This CVE fix is included since 7.0.3-9:
  http://git.imagemagick.org/repos/ImageMagick/commit/fde5f55af94f189f16958535a9c22b439d71ac93

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 9eb3a9e..e47c9b1 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 dc128b281c255d71d754934408d278b3ca314253103ca2501cd0b8d5ec98db74  ImageMagick-7.0.3-8.tar.xz
+sha256 bc09ea103a82d1c2c093889eda7e36dd0aa7aa98a06c55de4b73932838459fc4  ImageMagick-7.0.4-3.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index f384fc3..ccd580f 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.3-8
+IMAGEMAGICK_VERSION = 7.0.4-3
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.10.2
