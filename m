From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 23:22:48 +0200
Subject: [Buildroot] [git commit] package/cups: bump to version 2.3.3op2
Message-ID: <20210423205557.1A44680773@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cf034ab0f686d0a3891b6fe5bb5a2d1bdf381d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to new OpenPrinting upstream repository.

NOTICE hash change due to date+copyright holder update in:
https://github.com/OpenPrinting/cups/commit/1bc199354e592f73b9d17215953b9965849b3124

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups/cups.hash | 6 +++---
 package/cups/cups.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 2eb289e209..22e081255c 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256 261fd948bce8647b6d5cb2a1784f0c24cc52b5c4e827b71d726020bcc502f3ee  cups-2.3.3-source.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
-sha256 a5d616e6322a9cb1a971e18765025edfca4f3cd9c0eafc32d6d2eb4b8c8787b5  NOTICE
+sha256  deb3575bbe79c0ae963402787f265bfcf8d804a71fc2c94318a74efec86f96df  cups-2.3.3op2-source.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  1f8e5879fb8b15e3ee5111809fd3ca22c606d0897d6b5e74329e480c348e034d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 2fe9b03a60..8490fe109a 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.3.3
+CUPS_VERSION = 2.3.3op2
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
-CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
+CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
 CUPS_LICENSE_FILES = LICENSE NOTICE
 CUPS_CPE_ID_VENDOR = cups
