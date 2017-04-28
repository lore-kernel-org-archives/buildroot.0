From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:28:14 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] imagemagick: bump version
	to 7.0.5-4
Message-ID: <20170428125448.21EEF7FC90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b8f4d29ed1e33d02f3bc566dc933ab6162a7927
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 49a3ed0feee3ce58563fdec94b3d64112f41696b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
