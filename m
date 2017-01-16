From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 15:29:31 +0100
Subject: [Buildroot] [git commit] imagemagick: bump version to 7.0.4-4
Message-ID: <20170116143128.5C5BC81DFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a89bdc363c637950fa86a015d99d90830a682dbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index e47c9b1..d0ed022 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 bc09ea103a82d1c2c093889eda7e36dd0aa7aa98a06c55de4b73932838459fc4  ImageMagick-7.0.4-3.tar.xz
+sha256 c46975d23ff0c587219daaa3e1dbd43a54a5d7d5ec20d0bdc2c34188facdb0f9  ImageMagick-7.0.4-4.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index ccd580f..9d2c964 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.4-3
+IMAGEMAGICK_VERSION = 7.0.4-4
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
