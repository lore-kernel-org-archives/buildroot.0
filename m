From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Dec 2014 10:32:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 2.5.1
Message-ID: <1419067972-7731-1-git-send-email-bernd.kuhls@t-online.de>
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
index b45d375..d0949e8 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 148cfd694b60245f9116f5932f3f60bb6dba47bcfef395cdda7a7d8ed48d57ac  ffmpeg-2.5.tar.bz2
+sha256	03cf50b2f9109548e466f144c960b37031ffc1b9fab96382b4b26b7607c7ef52	ffmpeg-2.5.1.tar.bz2
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 3262115..0e6653d 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.5
+FFMPEG_VERSION = 2.5.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
1.7.10.4
