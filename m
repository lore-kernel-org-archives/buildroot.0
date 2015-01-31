From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Jan 2015 22:45:13 +0100
Subject: [Buildroot] [git commit] package/rtmpdump: bump version
Message-ID: <20150131222039.927E1801C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa438b25e72710310733215ecef2ccc48815d9dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtmpdump/rtmpdump.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
