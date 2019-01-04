From: Florian La Roche <F.LaRoche@pilz.de>
Date: Fri, 4 Jan 2019 11:53:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/irqbalance: bump to version 1.5.0
Message-ID: <20190104105341.25481-1-F.LaRoche@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the upstream changelog:

New Features in irqbalance 1.5.0
* file based socket ipc mechanism
* support for multiple policy scripts
* add some sandboxing support
* enhanced debug output
* Imroved irq type determination for ARM
Bugs fixed:
* Fixed xen event interrupt detection
* Fix node parsing in sysfs
* Covscan fixes
* Fix use on systems without a pci bus
* Various other cleanups

Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
---
 package/irqbalance/irqbalance.hash | 2 +-
 package/irqbalance/irqbalance.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
index 9bbbc7e4fb..dfe14c9003 100644
--- a/package/irqbalance/irqbalance.hash
+++ b/package/irqbalance/irqbalance.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 62de71510a2496fcf027efb0b288dd48e53e9efc931fa573c95580cad6264d07  irqbalance-v1.4.0.tar.gz
+sha256 3318eddc03782cfdad22b20eff18eaf378c498c5de286e8cbaa5521ddf4f810b  irqbalance-v1.5.0.tar.gz
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index c7676e13cf..063b02bb68 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = v1.4.0
+IRQBALANCE_VERSION = v1.5.0
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
