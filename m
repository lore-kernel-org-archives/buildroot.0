From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] at91bootstrap: add help text
Message-ID: <20100614203445.5A830804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1e17790cf282bd5d3cb8e3d419c331f991134742
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/at91bootstrap/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index 1bf8d50..67604cd 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -1,6 +1,12 @@
 menuconfig BR2_TARGET_AT91BOOTSTRAP
 	depends on BR2_arm
 	bool "AT91 Bootstrap"
+	help
+	  AT91Bootstrap is a first level bootloader for the Atmel AT91
+	  devices. It integrates algorithms for:
+	  - Device initialization such as clock configuration, PIO settings...
+	  - Peripheral drivers such as PIO, PMC or SDRAMC...
+	  - Physical media algorithm such as DataFlash, NandFlash, NOR Flash...
 
 if	BR2_TARGET_AT91BOOTSTRAP
 
-- 
1.7.1
