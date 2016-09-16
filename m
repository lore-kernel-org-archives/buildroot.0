From: Rahul Jain <Rahul.Jain@imgtec.com>
Date: Fri, 16 Sep 2016 14:46:26 +0530
Subject: [Buildroot] [PATCH 3/4] libubox: update legal info
In-Reply-To: <1474017387-3985-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1474017387-3985-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <1474017387-3985-3-git-send-email-Rahul.Jain@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Rahul Jain <rahul.jain@imgtec.com>

Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Signed-off-by: Rahul Jain <rahul.jain@imgtec.com>
---
 package/libubox/libubox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 67451fe..00392c3 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -6,7 +6,7 @@
 
 LIBUBOX_VERSION = 290c64ef5b5c3e75be851594f269d6a9568e64e5
 LIBUBOX_SITE = git://git.openwrt.org/project/libubox.git
-LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
+LIBUBOX_LICENSE = ISC, BSD-3c
 LIBUBOX_INSTALL_STAGING = YES
 LIBUBOX_DEPENDENCIES = $(if $(BR2_PACKAGE_JSON_C),json-c)
 
-- 
2.6.2
