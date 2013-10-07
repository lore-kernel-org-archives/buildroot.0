From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 07 Oct 2013 17:10:20 +0800
Subject: [Buildroot] [PATCH] sudo: bump to version 1.8.8
Message-ID: <1381137020.12106.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/sudo/sudo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 661d858..e0db465 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.6p7
+SUDO_VERSION = 1.8.8
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ICS BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
-- 
1.8.1.2
