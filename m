From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Dec 2013 21:29:04 +0100
Subject: [Buildroot] [PATCH 2/4] package/linux-firmware: bump version
In-Reply-To: <cover.1388003226.git.yann.morin.1998@free.fr>
References: <cover.1388003226.git.yann.morin.1998@free.fr>
Message-ID: <4fb0e8c3cc89d0436df16660ba40cb9d6e447bbb.1388003226.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Get a bunch of new firmwares, and some firmware bumps.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index a88bc4c..f865c73 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 07ea598af5b9dde3acdf279846b062fa1b2987b8
+LINUX_FIRMWARE_VERSION = 76b366df2afdde9811fdd5fc128d1779e26e7be7
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
@@ -27,7 +27,8 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX) += \
 	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin 		\
 	rtlwifi/rtl8192cfwU_B.bin rtlwifi/rtl8192cufw.bin	\
 	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin		\
-	rtlwifi/rtl8188efw.bin					\
+	rtlwifi/rtl8188efw.bin rtlwifi/rtl8192cufw_A.bin	\
+	rtlwifi/rtl8192cufw_B.bin rtlwifi/rtl8192cufw_TMSC.bin	\
 	LICENCE.rtlwifi_firmware.txt
 
 # rtl87xx
-- 
1.8.1.2
