From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Oct 2018 21:32:11 +0200
Subject: [Buildroot] [git commit] package/qpdf: bump to version 8.2.1
Message-ID: <20181007193350.688F28DFE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7f62dad13cf28f3c7d4f0ceeda6ebdffc0f2aa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix version number in hash comment]
Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qpdf/qpdf.hash | 6 ++++--
 package/qpdf/qpdf.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index d27c9834b9..4bf2d3b30d 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,2 +1,4 @@
-# From https://sourceforge.net/projects/qpdf/files/qpdf/8.1.0/qpdf-8.1.0.sha512/download
-sha512	1831bcaaed87dae268db5d61805d1483ec5c101f6ce594be660664c119597ae67cf011c2b50092964d785a814d5f6c780935127a89401fe37a1026ae4d3af15c  qpdf-8.1.0.tar.gz
+# From https://sourceforge.net/projects/qpdf/files/qpdf/8.2.1/qpdf-8.2.1.sha512/download
+sha512	ef3aeb4a7ca3ec48ab62341533eedcb2a6d0985767317ab72c22f0c0ecfef6849bfdc34b1bcec6427c7bde166143adb409c895ff40d8be6628e6323e27697a8c  qpdf-8.2.1.tar.gz
+# Locally computed:
+sha256  fb929ac30decb4dc3a2eea2bec6c43296a797c5d2d602deb3784ee39430583d5  Artistic-2.0
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index 4776d22b16..2f6efdd73e 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QPDF_VERSION = 8.1.0
+QPDF_VERSION = 8.2.1
 QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Artistic-2.0
