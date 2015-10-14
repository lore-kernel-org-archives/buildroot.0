From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 14 Oct 2015 12:34:22 +0200
Subject: [Buildroot] [PATCH 1/1] ffmpeg: change tarball compression to xz
Message-ID: <1444818862-1530-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 9e44f2e..eb23f58 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9565236404d3515aab754283c687c0a001019003148bf7f708e643608c0690b8  ffmpeg-2.8.tar.bz2
+sha256 993ca7216aa0eac899a85fe1119dac12ef0655d67f932de6a32acc00188f8182  ffmpeg-2.8.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f817471..afa43f6 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FFMPEG_VERSION = 2.8
-FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
+FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
 
-- 
1.9.1
