From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 22:24:13 +0100
Subject: [Buildroot] [PATCH 1/5] package/linux-firmware: fix typo in
	firmware file for cxgb4
In-Reply-To: <cover.1394486562.git.yann.morin.1998@free.fr>
References: <cover.1394486562.git.yann.morin.1998@free.fr>
Message-ID: <8b9f0a67a107a072e5d738e12c72233ce2aa2bbf.1394486562.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Trivial inversion b/g: cxbg4 -> cxgb4

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Jeremy Kerr <jk@ozlabs.org>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c4e7857..45c82c6 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -157,7 +157,7 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4),y)
 LINUX_FIRMWARE_FILES += \
 	cxgb4/t4fw-1.9.23.0.bin \
-	cxbg4/t4fw.bin
+	cxgb4/t4fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
-- 
1.8.3.2
