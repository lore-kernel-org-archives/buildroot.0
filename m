From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:07:03 +0100
Subject: [Buildroot] [git commit] package/qpdf: bump to version 8.4.0
Message-ID: <20190318210354.661348F3FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=497f6922aa143bf0c307238c22aed51814654b5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qpdf/qpdf.hash | 4 ++--
 package/qpdf/qpdf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index 4bf2d3b30d..825d2048e6 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/projects/qpdf/files/qpdf/8.2.1/qpdf-8.2.1.sha512/download
-sha512	ef3aeb4a7ca3ec48ab62341533eedcb2a6d0985767317ab72c22f0c0ecfef6849bfdc34b1bcec6427c7bde166143adb409c895ff40d8be6628e6323e27697a8c  qpdf-8.2.1.tar.gz
+# From https://sourceforge.net/projects/qpdf/files/qpdf/8.4.0/qpdf-8.4.0.sha512/download
+sha512	13225c6285311e8fe89970971b082b9613e70d474ee71dd5572f1ae268234d366c2c9c7bf427c4758a746a1a27ecc0127d31044ab501dbc08885c8aa0a514028  qpdf-8.4.0.tar.gz
 # Locally computed:
 sha256  fb929ac30decb4dc3a2eea2bec6c43296a797c5d2d602deb3784ee39430583d5  Artistic-2.0
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index 2f6efdd73e..6ed3195733 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QPDF_VERSION = 8.2.1
+QPDF_VERSION = 8.4.0
 QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Artistic-2.0
