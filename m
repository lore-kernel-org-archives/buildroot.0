From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 22:55:05 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: bump version to 2.8.7
Message-ID: <20160509205513.4D0728183F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69c3f7e86f6cfde3d7d59e3a1040d5ad167e5e07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 8643bff..3120a7a 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	25bcedbdafadac3d09c325c1d46a51f53d858b26a260d5aed6b4f17fea6e07fa	ffmpeg-2.8.6.tar.xz
+sha256	97be8a6c1cab2c52015544f76d40f6fd0babcb1b40cf601b4e57fb818564157c	ffmpeg-2.8.7.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index ddfac20..a2026dc 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.8.6
+FFMPEG_VERSION = 2.8.7
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
