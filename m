From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Apr 2014 20:24:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/linux-firmware: fix typo in
	variable name
In-Reply-To: <cover.1398104592.git.yann.morin.1998@free.fr>
References: <cover.1398104592.git.yann.morin.1998@free.fr>
Message-ID: <5ef805f3491c31ea7a7c2015f2207be1e91242d9.1398104592.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Remove a trailing _ leftover from: c0d82bd3 (package/linux-firmware: install
license files with 'make legal-info')

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index df6c36b..135b29b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -10,7 +10,7 @@ LINUX_FIRMWARE_SITE_METHOD = git
 
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
-LINUX_FIRMWARE_FILES_ += rt2561.bin rt2561s.bin rt2661.bin
+LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink-firmware.txt
 endif
 
-- 
1.8.3.2
