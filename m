From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Jun 2017 09:45:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/imagemagick: bump version to 7.0.6-0
In-Reply-To: <20170618074538.1237-1-bernd.kuhls@t-online.de>
References: <20170618074538.1237-1-bernd.kuhls@t-online.de>
Message-ID: <20170618074538.1237-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 3e2749dd4..d3097f522 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 bd965d36a65cbcd420ec79a509a5ce0ecdfef036770cdc87fcd5374b9ed15ea7  7.0.5-10.tar.gz
+sha256 3a6b21352ed0eb984bdbd0943471df8605b978b527125921e97e5b404f2bee3a  7.0.6-0.tar.gz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 23552d708..22c29d36a 100644
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
-- 
2.11.0
