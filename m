From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:27:58 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] imagemagick: bump version
	to 7.0.5-2
Message-ID: <20170428125448.0BA8D7FC90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33adae56f9abc36791040b7c9bbde7714ac31beb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 22562f7f056623ce8ca6a90e89fb2b2cbd35ff19)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 75bc9a9..5a281cf 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 7362805eaa9f9b90cdb67a1f8762782bef4a42ca44939629aecad3c40305bf4c  ImageMagick-7.0.5-0.tar.xz
+sha256 a7c55f0fd5203cbff12bf4a8d9158c002fab8d4290859a8087c3d329013b1af8  ImageMagick-7.0.5-2.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index d1cd608..ac10cd6 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.5-0
+IMAGEMAGICK_VERSION = 7.0.5-2
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
