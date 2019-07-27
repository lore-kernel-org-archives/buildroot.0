From: arnomessiaen at gmail.com <arnomessiaen@gmail.com>
Date: Sat, 27 Jul 2019 23:49:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20190717
Message-ID: <20190727214921.20327-1-arnomessiaen@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arno Messiaen <arnomessiaen@gmail.com>

License changes:
 * amdgpu: year on license was bumped to 2019
 * Marvell: reformatting, rewording and changed conditions

Signed-off-by: Arno Messiaen <arnomessiaen@gmail.com>
---
 package/linux-firmware/linux-firmware.hash | 8 ++++----
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index b44934893c..89bf4bcd2d 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256 5c636765fd1ac638176893feccfd4a4854f59fc3d01b38f3ccdbb89bd5bb6ef1 linux-firmware-1baa34868b2c0a004dc595b20678145e3fff83e7.tar.gz
+sha256 270f4b2dd89feb6ed7d9e166bb1677f27d8f93da9d95312e6d188b0e1efaba73 linux-firmware-20190717.tar.gz
 sha256 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9 LICENCE.Abilis
-sha256 4b3ea5d5a03c0db81bee0bcb14b30d75b30ef568597bb5be7d4dee57f434265f LICENSE.amdgpu
-sha256 38f2037aa14631b4b29826d7a99379613c41a97064d1defdee30a7a022138b20 LICENCE.Marvell
+sha256 ac7c42c8331ef69221039f770193a2120bc67c7bba357e51a5b3f557bca0037c LICENSE.amdgpu
+sha256 2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4 LICENCE.Marvell
 sha256 802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2 LICENCE.atheros_firmware
 sha256 3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
 sha256 8ce5c6ea0542bf4aac31fc3ae16a39792ad22d0eae4543063fac56fb3380f021 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
@@ -27,6 +27,6 @@ sha256 8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e LICENSE.
 sha256 be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc LICENSE.qcom
 sha256 fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f LICENSE.radeon
 sha256 2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9 LICENSE.sdma_firmware
-sha256 9b873499a822762177a7a02d2a3ead9fdf0d514c0f9899fb16a2d22ed99f4acc WHENCE
+sha256 440c2ed4fba90edb52847f1550ff33fbfb36f61688eecced84c22dfc247f31e9 WHENCE
 sha256 fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a qcom/NOTICE.txt
 sha256 bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604 LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 500050f284..1da323826c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 1baa34868b2c0a004dc595b20678145e3fff83e7
+LINUX_FIRMWARE_VERSION = 20190717
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
-- 
2.20.1
