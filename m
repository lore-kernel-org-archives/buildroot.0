From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  8 Apr 2015 23:43:58 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/tvheadend: bump version
In-Reply-To: <1428529439-29437-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428529439-29437-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1428529439-29437-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: bump to current git master

 package/tvheadend/tvheadend.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 44154c6..74b261f 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 7006b9fd88ce0cf54d59399df40fe4ee003c4180
+TVHEADEND_VERSION = 995aaf895b175d1c0b5ef52860f78f443449e84a
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
1.7.10.4
