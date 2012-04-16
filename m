From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Apr 2012 11:53:42 -0300
Subject: [Buildroot] [PATCH] ffmpeg: security bump to version 0.8.11
Message-ID: <1334588022-13454-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes for CVE-2012-0853, CVE-2012-0858, CVE-2011-3929, CVE-2011-3936,
CVE-2011-3937, CVE-2011-3940, CVE-2011-3945 and CVE-2011-3947.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 92eb14f..4cc29ee 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FFMPEG_VERSION = 0.8.10
+FFMPEG_VERSION = 0.8.11
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
1.7.3.4
