From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 10:17:44 +0200
Subject: [Buildroot] [PATCH 10/10] package/tvheadend: bump version
In-Reply-To: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1430554664-19320-10-git-send-email-bernd.kuhls@t-online.de>
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
index 2a0019e..04617ba 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 14f03b8efbc40b840eda8e203a6002d6c3f24250
+TVHEADEND_VERSION = 8dbc38df4a5cd85be243e77e1ebdd43dfe6e2683
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
1.7.10.4
