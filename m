From: Rahul Jain <Rahul.Jain@imgtec.com>
Date: Fri, 16 Sep 2016 14:46:25 +0530
Subject: [Buildroot] [PATCH 2/4] libubox: bump version
In-Reply-To: <1474017387-3985-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1474017387-3985-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <1474017387-3985-2-git-send-email-Rahul.Jain@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
---
 package/libubox/libubox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 4c56951..67451fe 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = e88d816d6e462180f0337565e04e36be58a63309
+LIBUBOX_VERSION = 290c64ef5b5c3e75be851594f269d6a9568e64e5
 LIBUBOX_SITE = git://git.openwrt.org/project/libubox.git
 LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
 LIBUBOX_INSTALL_STAGING = YES
-- 
2.6.2
