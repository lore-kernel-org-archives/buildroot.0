From: Marcel Patzlaff <m.patzlaff@pilz.de>
Date: Tue, 18 Sep 2018 15:18:55 +0200
Subject: [Buildroot] [PATCH 1/1] smcroute: bump to version 2.4.2
Message-ID: <20180918131855.4621-1-m.patzlaff@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
---
 package/smcroute/smcroute.hash | 6 +++---
 package/smcroute/smcroute.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index 0487ef6cab..a181929409 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  cd6c5cc2edfa1348acb07ed026180ebfc8dd0f87153f5382cb27cb5557724c56  smcroute-2.3.1.tar.xz
-# From https://github.com/troglobit/smcroute/releases/download/2.3.1/smcroute-2.3.1.tar.xz.md5
-md5     d8080828b7730bffb86969afd2bf94cb  smcroute-2.3.1.tar.xz
+sha256  d8c6abb45f5e13c8c557ad143f05e79778641eebef9bb28ef6eadb583d2a225e  smcroute-2.4.2.tar.xz
+# From https://github.com/troglobit/smcroute/releases/download/2.4.2/smcroute-2.4.2.tar.xz.md5
+md5     85b8bbdf2dccecfea770bcd17a731cc7  smcroute-2.4.2.tar.xz
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index e7e6ef1521..aacf211387 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.3.1
+SMCROUTE_VERSION = 2.4.2
 SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
