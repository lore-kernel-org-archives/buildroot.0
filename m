From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  6 Feb 2017 20:45:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 3.2.3
Message-ID: <20170206194512.25960-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index b1ad2f7d69..6adf7e440a 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 3f01bd1fe1a17a277f8c84869e5d9192b4b978cb660872aa2b54c3cc8a2fedfc  ffmpeg-3.2.2.tar.xz
+sha256 54ce502aca10b7e6059f19220ea2f68fa0c9c4c4d255ae13e615f08f0c94dcc5  ffmpeg-3.2.3.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 7e98ef6754..6540d41c52 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.2.2
+FFMPEG_VERSION = 3.2.3
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.11.0
