From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Jan 2018 20:00:16 +0100
Subject: [Buildroot] [git commit] linux-firmware: bump version to 65b1c68
Message-ID: <20180112190111.9FE94810D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7a649dea9cebae0c7dc912595ceccd93ccfb831
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes since last version (17e6288):

  02d857e linux-firmware: DMC firmware for skylake v1.27
  00a92a3 nfp: update firmware for Agilio CX SmartNICs
  c752e24 nfp: change firmware directory layout
  b39260f nfp: add firmware for tc-flower
  89c6211 linux-firmware: intel: Add Cannonlake audio firmware
  71a4800 amdgpu: update vega10 vce firmware
  30946b9 amdgpu: add firmware for Raven
  73d13b5 linux-firmware: Add firmware file for Intel Bluetooth 9560
  041aff8 linux-firmware: Add firmware file for Intel Bluetooth 9260
  c113d33 linux-firmware: Update firmware file for Intel Bluetooth 8265
  a42f895 linux-firmware: Update firmware patch for Intel Bluetooth 8260
  5d98692 Merge branch 'cnl' of git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/firmware
  e4252cf Revert commits a42f895, c113d33, 041aff8, 73d13b5
  db9964e linux-firmware: Add firmware file for Intel Bluetooth 9560
  97339b3 linux-firmware: Add firmware file for Intel Bluetooth 9260
  9a843a1 linux-firmware: Update firmware file for Intel Bluetooth 8265
  fdee922 linux-firmware: Update firmware patch for Intel Bluetooth 8260
  bc2164d Merge commit 'b39260f04b9b0a9da8a337098f73cbca7c4e9b2d' of https://github.com/Netronome/linux-firmware
  7f93c9d brcm: add CYW4373 firmwares and Cypress license file
  2451bb2 linux-firmware: liquidio: add v1.7.0 vswitch firmware
  2567e09 nvidia: add GP108 signed firmware
  4a77cab linux-firmware: DMC firmware for cannonlake v1.07
  2eefafb rtlwifi: rtl8723de: Add firmware for new driver/device
  8650396 wl127x/wl128x: update firmwares
  65b1c68 wl18xx: update firmware file 8.9.0.0.76

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.hash | 2 +-
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 209ea26..ff2e162 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 28d359523a36c1cdc3e85a8e148bb2d68b036d28b10f0e80a192f3dc29f02c16 linux-firmware-17e6288135d4500f9fe60224dce2b46d850c346b.tar.gz
+sha256 d253f7abb32e0407bcc840a5bddba1dc20190bb4a4bb6d40512f279fde384671 linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2.tar.gz
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b636f79..1a4fbc1 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 17e6288135d4500f9fe60224dce2b46d850c346b
+LINUX_FIRMWARE_VERSION = 65b1c68c63f974d72610db38dfae49861117cae2
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
