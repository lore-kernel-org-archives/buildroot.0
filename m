From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 12 Oct 2015 22:09:45 +0200
Subject: [Buildroot] [PATCH 2/2] package/tvheadend: bump version
In-Reply-To: <1444680585-31135-1-git-send-email-bernd.kuhls@t-online.de>
References: <1444680585-31135-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1444680585-31135-2-git-send-email-bernd.kuhls@t-online.de>
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
index b901c4e..10374f6 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 7b327910eefa3b89901e86aaec7acc3cd8d15b90
+TVHEADEND_VERSION = 1b682a46a11ea821c4ed183a274bc78993ef40a0
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.6.1
