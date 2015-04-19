From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 19:53:04 +0200
Subject: [Buildroot] [PATCH 01/10] package/libev: bump version to 4.19
Message-ID: <1429465993-30357-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libev/libev.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index dc42858..cde2ee0 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEV_VERSION = 4.15
+LIBEV_VERSION = 4.19
 LIBEV_SITE = http://dist.schmorp.de/libev
 LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2c or GPLv2+
-- 
1.7.10.4
