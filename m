From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:28:05 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] imagemagick: bump version
	to 7.0.5-3
Message-ID: <20170428125448.158887FC90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83e50860e77ee2ec0703524d73a09802dc17805b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 84bc1fb5320568a9475aaca03d24196ecad48ec0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 5a281cf..3f9f84e 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 a7c55f0fd5203cbff12bf4a8d9158c002fab8d4290859a8087c3d329013b1af8  ImageMagick-7.0.5-2.tar.xz
+sha256 dbc0a1cc0e4e3d4e3c772724fcbfe24a00ff4434c8b12c513c447a5fb422ffa6  ImageMagick-7.0.5-3.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index ac10cd6..d6923f5 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.5-2
+IMAGEMAGICK_VERSION = 7.0.5-3
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
