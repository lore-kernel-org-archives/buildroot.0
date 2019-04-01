From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  1 Apr 2019 17:15:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 4.1.3
Message-ID: <20190401151558.600-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/refs/heads/release/4.1:/Changelog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 208dfb5cf6..ba51af9847 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 b95f0ae44798ab1434155ac7f81f30a7e9760a02282e4b5898372c22a335347b  ffmpeg-4.1.2.tar.xz
+sha256 0c3020452880581a8face91595b239198078645e7d7184273b8bcc7758beb63d  ffmpeg-4.1.3.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256 73d99bc83313fff665b426d6672b4e0479102bc402fe22314ac9ce94a38aa5ff  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f7f882cb95..17e4fa7074 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.1.2
+FFMPEG_VERSION = 4.1.3
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.20.1
