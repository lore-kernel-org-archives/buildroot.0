From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 14 Oct 2015 19:39:59 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: bump version to 2.8.1
In-Reply-To: <1444844399-12782-1-git-send-email-bernd.kuhls@t-online.de>
References: <1444844399-12782-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1444844399-12782-2-git-send-email-bernd.kuhls@t-online.de>
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
index eb23f58..d0175cc 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 993ca7216aa0eac899a85fe1119dac12ef0655d67f932de6a32acc00188f8182  ffmpeg-2.8.tar.xz
+sha256	5790162028a868234f4f60b030f5f51bd70785de8a27878e271df029cdf4cb9a	ffmpeg-2.8.1.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index afa43f6..4f4c52c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.8
+FFMPEG_VERSION = 2.8.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.6.1
