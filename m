From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 28 Mar 2017 12:56:58 +0100
Subject: [Buildroot] [PATCH] imagemagick: bump version to 7.0.5-4
Message-ID: <20170328115658.39795-1-Vincent.Riera@imgtec.com>
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
index 3f9f84e..ff7b24a 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 dbc0a1cc0e4e3d4e3c772724fcbfe24a00ff4434c8b12c513c447a5fb422ffa6  ImageMagick-7.0.5-3.tar.xz
+sha256 4a1dde5bdfec0fc549955a051be25b7ff96dfb192060997699e43c7ce0f06ab2  ImageMagick-7.0.5-4.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index d6923f5..9bef6f7 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.5-3
+IMAGEMAGICK_VERSION = 7.0.5-4
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.10.2
