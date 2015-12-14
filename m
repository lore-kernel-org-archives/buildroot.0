From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:46 -0300
Subject: [Buildroot] [PATCH 07/45] bluez5_utils: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bluez5_utils/bluez5_utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 4c50e53..cd3849a 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -9,7 +9,7 @@ BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
 BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
-BLUEZ5_UTILS_LICENSE = GPLv2+ LGPLv2.1+
+BLUEZ5_UTILS_LICENSE = GPLv2+, LGPLv2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
 # 0001-Link-mcaptest-with-lrt.patch
-- 
2.4.10
