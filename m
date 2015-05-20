From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 May 2015 10:26:37 +0200
Subject: [Buildroot] [PATCH/next 6/7] package/ffmpeg: bump version to 2.6.3
In-Reply-To: <1432110398-22791-1-git-send-email-bernd.kuhls@t-online.de>
References: <1432110398-22791-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1432110398-22791-6-git-send-email-bernd.kuhls@t-online.de>
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
index f2e4cd4..0add973 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	889e3aa069b724dc95cbfc79ef83322a8a39d9f6225f39fad1b47294fc1f29ba	ffmpeg-2.6.2.tar.bz2
+sha256	59eb98c1b5896ac29abc0385f7c875d1b4942d695818818d418ee71eea1e0cfb	ffmpeg-2.6.3.tar.bz2
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 787dbb1..41ac616 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.6.2
+FFMPEG_VERSION = 2.6.3
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
1.7.10.4
