From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:43:11 +0200
Subject: [Buildroot] [git commit] package/python-dialog: bump to version
 3.4.0
Message-ID: <20191020135059.BDB3582DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6e3884dfda1d4c37b0fef3bcbd8ba70177fb58a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Verify .asc file from sourceforge.
* Add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dialog/python-dialog.hash | 7 +++++--
 package/python-dialog/python-dialog.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-dialog/python-dialog.hash b/package/python-dialog/python-dialog.hash
index 3cf0eaa3d6..8f84e198b2 100644
--- a/package/python-dialog/python-dialog.hash
+++ b/package/python-dialog/python-dialog.hash
@@ -1,2 +1,5 @@
-# Locally computed:
-sha256  58466c2f897ef761716b811ff74e035979b5ecefb529ba004b12db117a0f4581  python2-pythondialog-3.0.1.tar.bz2
+# Locally computed after verifying
+# https://sourceforge.net/projects/pythondialog/files/pythondialog/3.4.0/python3-pythondialog-3.4.0.tar.bz2.asc
+# with key 9B6F19FB52965E6C21FE76142A205688F8489BDD
+sha256	8978d355c8db6728eeb9e23b39449b14597f1c76cb06dc72462642ca7cde46a0  python2-pythondialog-3.4.0.tar.bz2
+sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/python-dialog/python-dialog.mk b/package/python-dialog/python-dialog.mk
index 01bcb760da..d5d4a4ceb5 100644
--- a/package/python-dialog/python-dialog.mk
+++ b/package/python-dialog/python-dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DIALOG_VERSION = 3.0.1
+PYTHON_DIALOG_VERSION = 3.4.0
 PYTHON_DIALOG_SOURCE = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.bz2
 PYTHON_DIALOG_SITE = http://downloads.sourceforge.net/project/pythondialog/pythondialog/$(PYTHON_DIALOG_VERSION)
 PYTHON_DIALOG_LICENSE = LGPL-2.1+
