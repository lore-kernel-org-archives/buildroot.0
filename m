From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Dec 2015 19:31:37 +0100
Subject: [Buildroot] [PATCH 2/8] package/tvheadend: bump version
In-Reply-To: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
References: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1449945103-23715-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 60ca524..8177057 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 8902dcbcc48b6a76168882a856111237f13e60ea
+TVHEADEND_VERSION = 676a34f24b182928770cef5d4ba2903a6a25323d
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.6.2
