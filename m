From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 Oct 2013 16:46:55 -0300
Subject: [Buildroot] [PATCH 1/2] ffmpeg: security bump to version 0.8.15
Message-ID: <1381175216-30916-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes several vulnerabilities.
TODO: update to a more modern branch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ffmpeg/ffmpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b102af1..6685110 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 0.8.12
+FFMPEG_VERSION = 0.8.15
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
1.8.1.5
