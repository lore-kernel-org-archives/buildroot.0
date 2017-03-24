From: Rahul Jain <Rahul.Jain@imgtec.com>
Date: Fri, 24 Mar 2017 18:19:50 +0530
Subject: [Buildroot] [PATCH 1/6] libubox: bump version
Message-ID: <1490359795-18362-1-git-send-email-Rahul.Jain@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
---
 package/libubox/libubox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 00392c3..0675a17 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = 290c64ef5b5c3e75be851594f269d6a9568e64e5
+LIBUBOX_VERSION = 723730214732862de7e892bae2f7a7889e66bf1b
 LIBUBOX_SITE = git://git.openwrt.org/project/libubox.git
 LIBUBOX_LICENSE = ISC, BSD-3c
 LIBUBOX_INSTALL_STAGING = YES
-- 
2.6.2
