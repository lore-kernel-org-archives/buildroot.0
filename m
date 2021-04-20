From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 20 Apr 2021 10:21:04 +0200
Subject: [Buildroot] [PATCH v2 6/6] package/freescale-imx/imx-sc-firmware:
 bump to version 1.8.0
In-Reply-To: <20210420082104.11514-1-sebastien.szymanski@armadeus.com>
References: <20210420082104.11514-1-sebastien.szymanski@armadeus.com>
Message-ID: <20210420082104.11514-6-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Same version as NXP release 5.10.9_1.0.0
- EULA/COPYING: update to LA_OPT_NXP_Software_License v19

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---

Changes for v2:
 - update this package too as advised by Stephane Viau.

 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 6 +++---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
index 661a77de1a..ed83e757af 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  db4c414d405aea6f013946d109db198798f40f71bf0810b9b50c027ca252b4b7  imx-sc-firmware-1.7.0.bin
-sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
-sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
+sha256  24a647237c0077ce0172563d67fcbc5e8f231bad7cf55a2436848c89579c5a06  imx-sc-firmware-1.8.0.bin
+sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
+sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index b05ca3c724..bbb7310306 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SC_FIRMWARE_VERSION = 1.7.0
+IMX_SC_FIRMWARE_VERSION = 1.8.0
 IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
 IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
 
-- 
2.26.3
