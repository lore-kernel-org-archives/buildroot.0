From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 18:38:34 +0200
Subject: [Buildroot] [git commit] libubox: update legal info
Message-ID: <20160916163855.635417FD8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f1a59924013928ff0ad3ed8cc2253a7f3485368
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Signed-off-by: Rahul Jain <rahul.jain@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
