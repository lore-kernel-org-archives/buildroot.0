From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Apr 2015 18:48:27 +0200
Subject: [Buildroot] [PATCH 6/6] package/linux-firmware: fix legal-info
In-Reply-To: <cover.1428252467.git.yann.morin.1998@free.fr>
References: <cover.1428252467.git.yann.morin.1998@free.fr>
Message-ID: <a556182f9ddaca8f73745709a7f748de37b887fb.1428252467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, I was not careful enough when reworking the radeon parts...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0919b16..9acfc53 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -16,7 +16,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RADEON),y)
 LINUX_FIRMWARE_DIRS += radeon
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.radeon
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
 endif
 
 # rt2501/rt61
-- 
1.9.1
