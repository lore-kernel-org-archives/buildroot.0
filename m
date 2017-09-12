From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 22:06:06 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: security bump to version
	3.3.4
Message-ID: <20170912200056.31EC08043F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71bd3f97b4e88a3c02459c455a1cf8d4574c080f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a number of integer overflows and DoS issues.

[Peter: explain security impact]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 2397f72..42cfeed 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d2a9002cdc6b533b59728827186c044ad02ba64841f1b7cd6c21779875453a1e  ffmpeg-3.3.3.tar.xz
+sha256 98b97e1b908dfeb6aeb6d407e5a5eacdfc253a40c2d195f5867ed2d1d46ea957  ffmpeg-3.3.4.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f50b410..a27819b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.3.3
+FFMPEG_VERSION = 3.3.4
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
