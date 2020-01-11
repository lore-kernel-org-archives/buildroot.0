From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Jan 2020 09:42:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/exim: bump version to 4.93.0.4
Message-ID: <20200111084206.138658-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.exim.org/lurker/message/20200107.002043.053ca484.en.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 8c10adc05c..7cedf1bc88 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/fixes/00-sha256sums.txt
-sha256 8156bbe67fa72c0a297207ca0c3bb99f230df08d38d95df91f1c284b0a12983f  exim-4.93.0.3.tar.xz
+sha256 537d366ee18ed357656f54f255f8f9e11bde9684fcaaecaaa56f84cdbcd3e405  exim-4.93.0.4.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/fixes/00-sha512sums.txt
-sha512 8afece1059e4ada85f6ecef8197cf2ac5b56274f8c2e1bdd785e0470d37bb1e8b4fe225650ac03302824e3a7fe0a6db1641c6218edc8394a70adcc48af46a1d5  exim-4.93.0.3.tar.xz
+sha512 84951849b69399d6f187d2801760dc0cb9e61c88c7c88aaca4e07e48120199a6be94b2236d058ffeacb8d611dd84056b610d480353c301a3ad5799768dd39d96  exim-4.93.0.4.tar.xz
 # Locally calculated
 sha256 49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 1f814ef195..c07d6f919c 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.93.0.3
+EXIM_VERSION = 4.93.0.4
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4/fixes
 EXIM_LICENSE = GPL-2.0+
-- 
2.20.1
