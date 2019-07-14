From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 12:14:14 +0200
Subject: [Buildroot] [git commit] package/acpica: bump to version 20190703
Message-ID: <20190714102157.7DF2980163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=645a4e962dc965faf0e674bda0ae59d5d36dfc1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpica/acpica.hash | 3 ++-
 package/acpica/acpica.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 4942fe4548..20d7e0fdfa 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 0b979b778bcf711a2b8702b1831affd7dac4a776235d7877fd185651b6a390a3  acpica-unix2-20170531.tar.gz
+sha256 9f539986b91749947dfc32b3b00d338ba565ee1a394b95c049dd393aac8ae34e  acpica-unix2-20190703.tar.gz
+sha256 65464cea6ee2f7a5d38e2b5f1050a4b39a15358a09b8e36119416d4e2c5031b8  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index c540061928..03d1c45e06 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20170531
+ACPICA_VERSION = 20190703
 ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
 ACPICA_SITE = https://acpica.org/sites/acpica/files
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
