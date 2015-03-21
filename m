From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Mar 2015 12:11:15 +0100
Subject: [Buildroot] [PATCH 2/3] package/tvheadend: bump version
In-Reply-To: <1426936276-23649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426936276-23649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1426936276-23649-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 96c040d..d2b7f02 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 7006b9fd88ce0cf54d59399df40fe4ee003c4180
+TVHEADEND_VERSION = 96898a66e96927e4ace9a637ea923fd9f514dd1d
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
1.7.10.4
