From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri,  6 Mar 2015 23:42:44 +0100
Subject: [Buildroot] [PATCH] socketcand: bump version
Message-ID: <1425681764-18099-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/socketcand/socketcand.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 90d7540..10b8b5b 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCKETCAND_VERSION = 274e4e44107f6138a29bbc4e20f9fbd2a7d4dab1
+SOCKETCAND_VERSION = 8339e62a6bf60be571672678fb1de544768cf40e
 SOCKETCAND_SITE = $(call github,dschanoeh,socketcand,$(SOCKETCAND_VERSION))
 SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_LICENSE = BSD-3c or GPLv2
-- 
2.1.0
