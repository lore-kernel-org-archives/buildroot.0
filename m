From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:22:24 +0200
Subject: [Buildroot] [git commit branch/next] package/ffmpeg: bump version
	to 2.7.2
Message-ID: <20150808105641.869707FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a95960e5655ce0f56de38bd4aa0f0c007d3a5a0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.hash |    2 +-
 package/ffmpeg/ffmpeg.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index a6cb310..2e6b413 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	7e07b97d2415feeae9c9b5595e35e7b7aab33207e81bf9f8c0d1eece43f7f720	ffmpeg-2.7.1.tar.bz2
+sha256	7ceb7550ad628c526fa6c9ff23fdfb687a62f54d90c4a730998d8c2b417b9ef2	ffmpeg-2.7.2.tar.bz2
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 28c6012..54c9f52 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.7.1
+FFMPEG_VERSION = 2.7.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
