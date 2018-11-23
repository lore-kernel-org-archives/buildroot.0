From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:10:10 +0100
Subject: [Buildroot] [git commit] linux-firmware: bump version to latest
 1baa348
Message-ID: <20181202071558.4078D82855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cff663be8e1fac8e4c20be729a9cbd1fa327721
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Brief license changes:
 * ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt: mainly cleanups
   and s/Qualcomm Atheros/Qualcomm Technologies/

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.hash | 6 +++---
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index ca6ad8f59d..12310d55ed 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,11 +1,11 @@
 # Locally calculated
-sha256 b279ca4d086887c2efab13e28a7ca36e409410d3df38a62d7c7b5799ee3de916 linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz
+sha256 5c636765fd1ac638176893feccfd4a4854f59fc3d01b38f3ccdbb89bd5bb6ef1 linux-firmware-1baa34868b2c0a004dc595b20678145e3fff83e7.tar.gz
 sha256 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9 LICENCE.Abilis
 sha256 4b3ea5d5a03c0db81bee0bcb14b30d75b30ef568597bb5be7d4dee57f434265f LICENSE.amdgpu
 sha256 38f2037aa14631b4b29826d7a99379613c41a97064d1defdee30a7a022138b20 LICENCE.Marvell
 sha256 802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2 LICENCE.atheros_firmware
 sha256 3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
-sha256 c565861ff7c42f5df98e15239241f1f42614e5e15f362094a2d3e8da724dc842 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
+sha256 8ce5c6ea0542bf4aac31fc3ae16a39792ad22d0eae4543063fac56fb3380f021 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
 sha256 b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d LICENCE.broadcom_bcm43xx
 sha256 a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061 LICENCE.chelsio_firmware
 sha256 60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83 LICENCE.fw_sst_0f28
@@ -27,5 +27,5 @@ sha256 8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e LICENSE.
 sha256 be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc LICENSE.qcom
 sha256 fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f LICENSE.radeon
 sha256 2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9 LICENSE.sdma_firmware
-sha256 ef38a9a8bb4b0f72b369d337426eea63ef8fc9d48453f127028d935f7dbc5820 WHENCE
+sha256 9b873499a822762177a7a02d2a3ead9fdf0d514c0f9899fb16a2d22ed99f4acc WHENCE
 sha256 fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a qcom/NOTICE.txt
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 4eba57434b..60f39804a2 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 44d4fca9922a252a0bd81f6307bcc072a78da54a
+LINUX_FIRMWARE_VERSION = 1baa34868b2c0a004dc595b20678145e3fff83e7
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
