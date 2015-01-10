From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jan 2015 13:33:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version
Message-ID: <1420893204-17313-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.hash |    2 +-
 package/ffmpeg/ffmpeg.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index ea37531..b1d8c95 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	9edf17e7c280cbcfca4bc4219b1c22f760a61ec6a3f39ef26e3e2ad4cd24465e	ffmpeg-2.5.2.tar.bz2
+sha256	9d383d7ef9dffe6980849a93accfef848e197fdac9b1fbd02fca2798f863411a	ffmpeg-2.5.3.tar.bz2
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b74a59a..bc8c220 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.5.2
+FFMPEG_VERSION = 2.5.3
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
1.7.10.4
