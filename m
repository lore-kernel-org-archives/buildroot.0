From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Mar 2018 13:25:13 +0100
Subject: [Buildroot] [git commit] linux-firmware: add QCA6174 firmware legal
 notice files
Message-ID: <20180319122537.8EDFD837C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12b01c98a4b21a8b48034e93029835429abe5cc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.hash | 2 ++
 package/linux-firmware/linux-firmware.mk   | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 1beb1f76da..14c1935b27 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -3,6 +3,8 @@ sha256 d253f7abb32e0407bcc840a5bddba1dc20190bb4a4bb6d40512f279fde384671 linux-fi
 sha256 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9 LICENCE.Abilis
 sha256 38f2037aa14631b4b29826d7a99379613c41a97064d1defdee30a7a022138b20 LICENCE.Marvell
 sha256 802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2 LICENCE.atheros_firmware
+sha256 3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
+sha256 c565861ff7c42f5df98e15239241f1f42614e5e15f362094a2d3e8da724dc842 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
 sha256 b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d LICENCE.broadcom_bcm43xx
 sha256 a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061 LICENCE.chelsio_firmware
 sha256 60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83 LICENCE.fw_sst_0f28
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 3f710a2f09..6f0ba53800 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -149,7 +149,9 @@ LINUX_FIRMWARE_FILES += ath10k/QCA6174/hw3.0/board.bin \
 			ath10k/QCA6174/hw3.0/board-2.bin \
 			ath10k/QCA6174/hw3.0/firmware-4.bin \
 			ath10k/QCA6174/hw3.0/firmware-6.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware \
+				ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt \
+				ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
 endif
 
 # sd8686 v8
