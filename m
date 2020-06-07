From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 12:11:07 +0200
Subject: [Buildroot] [git commit] package/acpica: bump version to 20200528
Message-ID: <20200607105756.2038B82570@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24e9ef824715243bac07e4b3e3b2f646414be151
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update the hash file to the new 2 spaces convention
- Update the hash of the license file due to license date change
   - * Copyright (C) 2000 - 2019, Intel Corp.
   + * Copyright (C) 2000 - 2020, Intel Corp.

Fixes:
http://autobuild.buildroot.net/results/fe58e834bb67a9aab640e1d913588b47eaf7e4f5/

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/acpica/acpica.hash | 4 ++--
 package/acpica/acpica.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index ac2201d570..961ee9dbe3 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 edb9a886455d22955c93753e2de61b780bed94fb434079e844dc5e4376cadd4c  acpica-unix2-20191018.tar.gz
-sha256 65464cea6ee2f7a5d38e2b5f1050a4b39a15358a09b8e36119416d4e2c5031b8  source/include/acpi.h
+sha256  ad8a7b1571ec94d8c1837cf0c89ff33ea820780362fbb3e26adbde96beed5205  acpica-unix2-20200528.tar.gz
+sha256  cb17c679d3291eba1a70a1336062fb07eec2e839b0821b443b24f41de18c5218  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 68b948c86d..8f1a36fbb7 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20191018
+ACPICA_VERSION = 20200528
 ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
 ACPICA_SITE = https://acpica.org/sites/acpica/files
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
