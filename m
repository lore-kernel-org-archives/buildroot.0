From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 17:26:20 +0100
Subject: [Buildroot] [PATCH 1/2] package/smack: bump version to 1.1.0
Message-ID: <1454257581-22383-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/smack/smack.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/smack/smack.mk b/package/smack/smack.mk
index 7e0a362..3ef4d47 100644
--- a/package/smack/smack.mk
+++ b/package/smack/smack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMACK_VERSION = v1.0.4
+SMACK_VERSION = v1.1.0
 SMACK_SITE = $(call github,smack-team,smack,$(SMACK_VERSION))
 SMACK_LICENSE = LGPLv2.1
 SMACK_LICENSE_FILES = COPYING
-- 
2.7.0
