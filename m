From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  9 Mar 2012 15:39:50 +0100
Subject: [Buildroot] [PATCH 5/5] bluez_utils: bump to 4.99
In-Reply-To: <1331303990-13548-1-git-send-email-yegorslists@googlemail.com>
References: <1331303990-13548-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1331303990-13548-5-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/bluez_utils/bluez_utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 025f31a..eb42e23 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BLUEZ_UTILS_VERSION = 4.98
+BLUEZ_UTILS_VERSION = 4.99
 BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.gz
 BLUEZ_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ_UTILS_INSTALL_STAGING = YES
-- 
1.7.7
