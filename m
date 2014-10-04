From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat,  4 Oct 2014 21:20:29 +0200
Subject: [Buildroot] [PATCH] ser2net: bump to 2.10.0
Message-ID: <1412450429-8778-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ser2net/ser2net.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 5e77d36..414f1ed 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 2.9.1
+SER2NET_VERSION = 2.10.0
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
-- 
1.8.3.2
