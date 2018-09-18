From: Marcel Patzlaff <m.patzlaff@pilz.de>
Date: Tue, 18 Sep 2018 15:40:21 +0200
Subject: [Buildroot] [PATCH 1/1] host-tzdump: bump to version
 e1a52ce12a701b8ea4163d6719713e38c0e53d35
Message-ID: <20180918134021.7878-1-m.patzlaff@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
---
 package/tzdump/tzdump.hash | 2 +-
 package/tzdump/tzdump.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tzdump/tzdump.hash b/package/tzdump/tzdump.hash
index 71114e0bed..b0d58c62d3 100644
--- a/package/tzdump/tzdump.hash
+++ b/package/tzdump/tzdump.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  403f22f9c3007a051f9dbccff48b396b8e04eb1afcc8d779e6b3d9b6d971e1fe  tzdump-65a10105564801094b18c3fcacf4dde4c44e4ab8.tar.gz
+sha256  e078ba9bd90cb46368beb3cfef2288194e5edefd53ad9565961a97d1c7d6c59f  tzdump-e1a52ce12a701b8ea4163d6719713e38c0e53d35.tar.gz
diff --git a/package/tzdump/tzdump.mk b/package/tzdump/tzdump.mk
index baad978c4f..f6b6a1a729 100644
--- a/package/tzdump/tzdump.mk
+++ b/package/tzdump/tzdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDUMP_VERSION = 65a10105564801094b18c3fcacf4dde4c44e4ab8
+TZDUMP_VERSION = e1a52ce12a701b8ea4163d6719713e38c0e53d35
 TZDUMP_SITE = $(call github,alexandrebelloni,tzdump,$(TZDUMP_VERSION))
 HOST_TZDUMP_DEPENDENCIES = host-zic
 
-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
