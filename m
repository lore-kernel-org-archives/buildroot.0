From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 31 Jan 2015 17:49:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/rtmpdump: bump version
Message-ID: <1422722945-31832-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rtmpdump/rtmpdump.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 0e2eccc..14037fb 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTMPDUMP_VERSION = 79459a2b43f41ac44a2ec001139bcb7b1b8f7497
+RTMPDUMP_VERSION = a107cef9b392616dff54fabfd37f985ee2190a6f
 RTMPDUMP_SITE = git://git.ffmpeg.org/rtmpdump
 RTMPDUMP_INSTALL_STAGING = YES
 # Note that rtmpdump is GPLv2 but librtmp has its own license and since we only
-- 
1.7.10.4
