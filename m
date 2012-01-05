From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2012 15:26:20 -0300
Subject: [Buildroot] [PATCH 07/10] ffmpeg: bump to version 0.8.8
In-Reply-To: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
References: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1325787983-8591-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index ef97674..38f04aa 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FFMPEG_VERSION = 0.8.7
+FFMPEG_VERSION = 0.8.8
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
1.7.3.4
