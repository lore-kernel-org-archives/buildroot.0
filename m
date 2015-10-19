From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 00:21:37 +0200
Subject: [Buildroot] [git commit] linux-firmware: rtl81xx: also install
	rtl8188eufw firmware variant
Message-ID: <20151019222225.950527FA90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b312807fb8cfcb25cdbfc2880e15471e7973b0ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As used by the rtl8188eu staging driver.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 06195c9..768f3c4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -45,7 +45,8 @@ LINUX_FIRMWARE_FILES += \
 	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin 		\
 	rtlwifi/rtl8192cfwU_B.bin rtlwifi/rtl8192cufw.bin	\
 	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin		\
-	rtlwifi/rtl8188efw.bin rtlwifi/rtl8192cufw_A.bin	\
+	rtlwifi/rtl8188efw.bin rtlwifi/rtl8188eufw.bin		\
+	rtlwifi/rtl8192cufw_A.bin				\
 	rtlwifi/rtl8192cufw_B.bin rtlwifi/rtl8192cufw_TMSC.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
