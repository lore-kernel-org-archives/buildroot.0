From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 23:09:42 +0100
Subject: [Buildroot] [git commit] package/raspi-gpio: bump to revision
 4edfde1
Message-ID: <20191222220037.D232B8DAB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d04d9a3ee36da8b86782c343db016054b873cc82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes the following changes:

4edfde1 Update raw output to show pull registers on 2711

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/raspi-gpio/raspi-gpio.hash | 2 +-
 package/raspi-gpio/raspi-gpio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/raspi-gpio/raspi-gpio.hash b/package/raspi-gpio/raspi-gpio.hash
index 8a808b657f..41d885f317 100644
--- a/package/raspi-gpio/raspi-gpio.hash
+++ b/package/raspi-gpio/raspi-gpio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 8f3fb411746d339d69adc398497892883c11d2d715ccbe6d8b0b5a401da73bd5  raspi-gpio-2eaa8b8755a550e34d07c898b90b0d9b3d66fd81.tar.gz
+sha256 2526dcec1e5a171b13c44b1fb6f2faed5ec849f08021278e2be09bc18264a2fd  raspi-gpio-4edfde183ff3ac9ed66cdc015ae25e45f3a5502d.tar.gz
 sha256 6e02227e1fb942687163996678d94add7911890c50025912d0ae7ee66d256bb2  LICENSE
diff --git a/package/raspi-gpio/raspi-gpio.mk b/package/raspi-gpio/raspi-gpio.mk
index f841c988bb..d124108217 100644
--- a/package/raspi-gpio/raspi-gpio.mk
+++ b/package/raspi-gpio/raspi-gpio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RASPI_GPIO_VERSION = 2eaa8b8755a550e34d07c898b90b0d9b3d66fd81
+RASPI_GPIO_VERSION = 4edfde183ff3ac9ed66cdc015ae25e45f3a5502d
 RASPI_GPIO_SITE = $(call github,RPi-Distro,raspi-gpio,$(RASPI_GPIO_VERSION))
 RASPI_GPIO_LICENSE = BSD-3-Clause
 RASPI_GPIO_LICENSE_FILES = LICENSE
