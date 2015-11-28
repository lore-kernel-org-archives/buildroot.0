From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Nov 2015 11:13:35 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/ffmpeg: bump version to 2.8.3
Message-ID: <1448705615-24890-1-git-send-email-bernd.kuhls@t-online.de>
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
index e984b58..d50c2cf 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d2e61d445397940e24ed5afeccfa2c70484a2db1bdc15614f5eaaf171f1d350e	ffmpeg-2.8.2.tar.xz
+sha256	18e22e3866d3b5fefcb1911c0d87ae8ababc30b7ea15901c1cf02885ccf6704a	ffmpeg-2.8.3.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 988374f..dbf3a5b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.8.2
+FFMPEG_VERSION = 2.8.3
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.6.2
