From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 17 Aug 2012 12:10:07 +0200
Subject: [Buildroot] [PATCH] flashrom: bump to version 0.9.6.1
Message-ID: <1345198207-28746-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/flashrom/flashrom.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 4b310ef..675cc6e 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -3,7 +3,7 @@
 # flashrom
 #
 #############################################################
-FLASHROM_VERSION = 0.9.3
+FLASHROM_VERSION = 0.9.6.1
 FLASHROM_SOURCE  = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE    = http://download.flashrom.org/releases
 
-- 
1.7.9.5
