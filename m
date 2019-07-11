From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 11 Jul 2019 20:44:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 4.1.4
Message-ID: <20190711184402.5820-1-bernd.kuhls@t-online.de>
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
index ba51af9847..f27eaa5706 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 0c3020452880581a8face91595b239198078645e7d7184273b8bcc7758beb63d  ffmpeg-4.1.3.tar.xz
+sha256 f1f049a82fcfbf156564e73a3935d7e750891fab2abf302e735104fd4050a7e1  ffmpeg-4.1.4.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256 73d99bc83313fff665b426d6672b4e0479102bc402fe22314ac9ce94a38aa5ff  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 5c070b7ee4..21fb24e597 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.1.3
+FFMPEG_VERSION = 4.1.4
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.20.1
