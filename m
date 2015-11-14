From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2015 09:48:32 +0100
Subject: [Buildroot] [git commit branch/next] package/ffmpeg: bump version
	to 2.8.2
Message-ID: <20151114084926.07191819D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=093db034ed4b097c9f03cb5ec13bc2a1736c9a2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.hash |    2 +-
 package/ffmpeg/ffmpeg.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index d0175cc..e984b58 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5790162028a868234f4f60b030f5f51bd70785de8a27878e271df029cdf4cb9a	ffmpeg-2.8.1.tar.xz
+sha256	d2e61d445397940e24ed5afeccfa2c70484a2db1bdc15614f5eaaf171f1d350e	ffmpeg-2.8.2.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index d25346c..988374f 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.8.1
+FFMPEG_VERSION = 2.8.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
