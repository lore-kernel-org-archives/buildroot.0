From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 3 Feb 2017 14:24:44 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] imagemagick: bump version
	to 7.0.4-4
Message-ID: <20170203132519.0AE33803CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5c365b3c0790dd78a196148c9ded5b63a7a8bbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a89bdc363c637950fa86a015d99d90830a682dbe)
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
