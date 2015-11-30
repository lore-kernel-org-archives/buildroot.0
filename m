From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 17:04:48 +0100
Subject: [Buildroot] [git commit branch/next] imagemagick: bump version to
	6.9.2-7
Message-ID: <20151130160520.141C5805BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b768ed4d06524204dbed46df68a24887fab48ea9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash |    2 +-
 package/imagemagick/imagemagick.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 61f73fb..3931762 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 19fb341725a13c01458cfce23d0a260fd032432a5daeebdd4f06c92d716ded40 ImageMagick-6.9.2-5.tar.xz
+sha256 eef80bf259823523dafbcdae15e236b443ecf6d4ae415106d7a861d1fa8d9d13  ImageMagick-6.9.2-7.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index c149829..9238952 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.2-5
+IMAGEMAGICK_VERSION = 6.9.2-7
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
