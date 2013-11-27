From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 27 Nov 2013 22:18:00 +0000
Subject: [Buildroot] [PATCH] ofono: bump version to 1.13
Message-ID: <1385590680-2322-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/ofono/ofono.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 4b3b7a5..aaaa8fa 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.12
+OFONO_VERSION = 1.13
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPLv2
-- 
1.8.3.2
