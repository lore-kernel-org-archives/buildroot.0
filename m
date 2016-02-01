From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 23:57:43 +0100
Subject: [Buildroot] [git commit] package/ffmpeg: bump version to 2.8.6
Message-ID: <20160201225954.DD1CA7FD45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba14e6c2aa8d060f59f1a8ecda0d60feb06f98d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 5570a57..8643bff 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	76fb83a267d2d1cb332742dadf28ad8b58af7958165f51bb1a2c226a122f0ac7	ffmpeg-2.8.5.tar.xz
+sha256	25bcedbdafadac3d09c325c1d46a51f53d858b26a260d5aed6b4f17fea6e07fa	ffmpeg-2.8.6.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 138618d..ddfac20 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.8.5
+FFMPEG_VERSION = 2.8.6
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
