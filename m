From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 May 2014 17:52:17 +0200
Subject: [Buildroot] [PATCH 1/1] rtmpdump: bump version
Message-ID: <1399218737-8498-1-git-send-email-bernd.kuhls@t-online.de>
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
index e836cb6..4a8a1b0 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTMPDUMP_VERSION = dc76f0a8461e6c8f1277eba58eae201b2dc1d06a
+RTMPDUMP_VERSION = 79459a2b43f41ac44a2ec001139bcb7b1b8f7497
 RTMPDUMP_SITE = git://git.ffmpeg.org/rtmpdump
 RTMPDUMP_INSTALL_STAGING = YES
 # Note that rtmpdump is GPLv2 but librtmp has its own license and since we only
-- 
1.7.10.4
