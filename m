From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 16:21:40 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/imagemagick: bump
	version to 7.0.6-0
Message-ID: <20170921145320.3513A810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc6dda414cd12196c09b0eb6ba43041bc515f837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit dfde97dce57cee38febb1b5687876c34df1f9bbc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 3e2749d..d3097f5 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 bd965d36a65cbcd420ec79a509a5ce0ecdfef036770cdc87fcd5374b9ed15ea7  7.0.5-10.tar.gz
+sha256 3a6b21352ed0eb984bdbd0943471df8605b978b527125921e97e5b404f2bee3a  7.0.6-0.tar.gz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 23552d7..22c29d3 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.5-10
+IMAGEMAGICK_VERSION = 7.0.6-0
 IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
 IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
