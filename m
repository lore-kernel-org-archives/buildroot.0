From: Julien Olivain <ju.o@free.fr>
Date: Tue, 17 Nov 2020 22:21:44 +0100
Subject: [Buildroot] [PATCH 2/3] package/linux-firmware: bump version to
 20201022
In-Reply-To: <20201117212145.12198-1-ju.o@free.fr>
References: <20201117212145.12198-1-ju.o@free.fr>
Message-ID: <20201117212145.12198-2-ju.o@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This update is motivated by the inclusion SDIO firmware for QCA9377 WiFi
cards in this new version. See [1].

The license file "WHENCE" content/checksum has changed, since it's an
index of firmware provenance and their licenses, and many new firmware
files were added.

For the full linux-firmware change log, see tag 20201022 log [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=d7904d5b07a9e2c4cdd9f8b2c5a5faa9c6e665cf
[2] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/?h=20201022

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 3f56e3b540..1c1f3bd116 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  83646c58fc4e3ee9a73f4fa74213c849109f48c719322346393f3e5b0fa55044  linux-firmware-20200122.tar.gz
+sha256  ba045512bb782ba8efc82651a85679684fb0fec7a7a094971031be665d6c82d6  linux-firmware-20201022.tar.gz
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
 sha256  8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
@@ -30,6 +30,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  74d203d2fd433b73b63e8e31d8928e3817f6eaf3407c9e607802c20a5c02e6c4  WHENCE
+sha256  18313654864adbb76514e21566528ce57eff42a2a7a66d5823f1f91e895816ea  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8808b5284c..dc7f392800 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20200122
+LINUX_FIRMWARE_VERSION = 20201022
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
-- 
2.28.0
