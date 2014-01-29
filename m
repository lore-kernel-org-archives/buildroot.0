From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 29 Jan 2014 19:15:04 +0100
Subject: [Buildroot] [PATCH] rtmpdump: bump version
Message-ID: <1391019304-14024-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rtmpdump was not compatible with BR's version of PolarSSL, the bump
fixes that.

Fixes:
http://autobuild.buildroot.net/results/55bda4076af031db9778d97f9ddc5c6b14de17ce
http://autobuild.buildroot.net/results/9ba2f8ecb0a73cc7e625faf713ad4161202b2293
http://autobuild.buildroot.net/results/4e1988f049fa97574da54e5097e5ef1668c2687c
http://autobuild.buildroot.net/results/02a15ad5211a1e620002c442ce256147d9b9ee88

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/rtmpdump/rtmpdump.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 4f9d247..e836cb6 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTMPDUMP_VERSION = e0056c51cc1710c9a44d2a2c4e2f344fa9cabcf4
+RTMPDUMP_VERSION = dc76f0a8461e6c8f1277eba58eae201b2dc1d06a
 RTMPDUMP_SITE = git://git.ffmpeg.org/rtmpdump
 RTMPDUMP_INSTALL_STAGING = YES
 # Note that rtmpdump is GPLv2 but librtmp has its own license and since we only
-- 
1.8.5.3
