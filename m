From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 28 Jul 2013 08:22:16 +0200
Subject: [Buildroot] [PATCH] ser2net: bump to 2.9
Message-ID: <1374992536-7801-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ser2net/ser2net.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 588571c..cc728a6 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 2.8
+SER2NET_VERSION = 2.9
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
+SER2NET_AUTORECONF = YES
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
 
-- 
1.8.1.2
