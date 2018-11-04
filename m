From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Nov 2018 19:51:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 3.4.5
Message-ID: <20181104185108.21665-1-bernd.kuhls@t-online.de>
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
index 7d64d8441c..e00c4ec56c 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 386f7601e865df6bddde05bb6927119b5a853f0b92e2e9834f59c125a17d3fc6  ffmpeg-3.4.4.tar.xz
+sha256 741cbd6394eaed370774ca4cc089eaafbc54d0824b9aa360d4b3b0cbcbc4a92c  ffmpeg-3.4.5.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256 73d99bc83313fff665b426d6672b4e0479102bc402fe22314ac9ce94a38aa5ff  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b8cc696f83..b86d465df8 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.4.4
+FFMPEG_VERSION = 3.4.5
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.19.1
