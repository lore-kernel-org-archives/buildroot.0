From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 12 Feb 2020 22:08:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/qpdf: bump to version 9.1.1
Message-ID: <20200212210854.1562030-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qpdf/qpdf.hash | 4 ++--
 package/qpdf/qpdf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index 48b8c77f1e..050c9d9a4c 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/qpdf/files/qpdf/9.1.0/qpdf-9.1.0.sha512/download
-sha512	7561ffc366dbce9df58cc85ff18480b28b0d46de04733ba463139188bee95690f92cf0960a328619f0c9f34ce865598db490fa1c6aaa76ee87d2c034a5f7f57e  qpdf-9.1.0.tar.gz
+# From https://sourceforge.net/projects/qpdf/files/qpdf/9.1.1/qpdf-9.1.1.sha512/download
+sha512  008a11fef663a57ca173631f2053988023babea6c333cfe01db0ef955c8cd36d387ed9f2039f55bd5f9ca94c7a8e400461a09a15c5f89e03bc0817fdd0d3d585  qpdf-9.1.1.tar.gz
 # Locally computed:
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
 sha256  fb929ac30decb4dc3a2eea2bec6c43296a797c5d2d602deb3784ee39430583d5  Artistic-2.0
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index 5d28a8007a..ac703d716e 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QPDF_VERSION = 9.1.0
+QPDF_VERSION = 9.1.1
 QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Apache-2.0 or Artistic-2.0
-- 
2.24.1
