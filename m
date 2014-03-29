From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 29 Mar 2014 23:40:33 +0100
Subject: [Buildroot] [PATCH 1/1] eudev : bump version to 1.5.3
Message-ID: <1396132833-20016-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/eudev/eudev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index a2fe528..8e5e83d 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 1.5.2
+EUDEV_VERSION = 1.5.3
 EUDEV_SITE = $(call github,gentoo,eudev,$(EUDEV_VERSION))
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
-- 
1.9.1
