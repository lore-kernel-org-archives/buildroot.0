From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jan 2015 13:17:31 +0100
Subject: [Buildroot] [PATCH 4/6] package/tvheadend: bump version
In-Reply-To: <1420373853-20008-1-git-send-email-bernd.kuhls@t-online.de>
References: <1420373853-20008-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1420373853-20008-4-git-send-email-bernd.kuhls@t-online.de>
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
index f1c3921..01feb82 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 388f57ecc32a3b631de2ff9c200cd398322a27bf
+TVHEADEND_VERSION = c051d0bda5b69ce61e64a97fd4a41db899dcfb53
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
1.7.10.4
