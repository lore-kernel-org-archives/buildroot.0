From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 17:22:36 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/acpica: bump
 version to 20200717
Message-ID: <20200929152738.E6EC08E1EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7b120916f67523e61d56f38742ee9be027d8e16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
	https://github.com/acpica/acpica/issues/630

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8ba52666dc9aaa928b50526aa43a22a051c65113)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpica/acpica.hash | 2 +-
 package/acpica/acpica.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 961ee9dbe3..a2fdfe602e 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  ad8a7b1571ec94d8c1837cf0c89ff33ea820780362fbb3e26adbde96beed5205  acpica-unix2-20200528.tar.gz
+sha256  8a49904744a8159b7f325ed941b56968ba37a0371c634036628064f97538de4b  acpica-unix2-20200717.tar.gz
 sha256  cb17c679d3291eba1a70a1336062fb07eec2e839b0821b443b24f41de18c5218  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 8f1a36fbb7..21ecc155be 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20200528
+ACPICA_VERSION = 20200717
 ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
 ACPICA_SITE = https://acpica.org/sites/acpica/files
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
