From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:53:03 +0200
Subject: [Buildroot] [git commit] package/python-pysnmp-apps: bump to
 version 0.5.3
Message-ID: <20191005205715.B60B388F5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28ee86f01dd46b52525ab4e3e20fefd19a58598a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pysnmp-apps/python-pysnmp-apps.hash | 8 +++++---
 package/python-pysnmp-apps/python-pysnmp-apps.mk   | 5 ++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pysnmp-apps/python-pysnmp-apps.hash b/package/python-pysnmp-apps/python-pysnmp-apps.hash
index 2b865cbce9..42120486d9 100644
--- a/package/python-pysnmp-apps/python-pysnmp-apps.hash
+++ b/package/python-pysnmp-apps/python-pysnmp-apps.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pysnmp-apps/json, sha256 locally computed
-md5	7fc08e2d81a77d558b38be5e49ff833e  pysnmp-apps-0.4.1.tar.gz
-sha256	57accb8c2fcb255b4da85af07ef9cd6a266dc5143b2834419ec8a39a879edeb7  pysnmp-apps-0.4.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pysnmp-apps/json
+md5	ed3e4d421bb0e1806298120313efccc2  pysnmp-apps-0.5.3.tar.gz
+sha256	bf4ea6f3054a25b05e255d29e0b57a8aa8102f509048e3a9c0d93ddc86aff570  pysnmp-apps-0.5.3.tar.gz
+# Locally computed sha256 checksums
+sha256	f82128f64d567c333936a12b99a21d0e8cd66ce628d51ce0a7770cc38dc7fe43  LICENSE.txt
diff --git a/package/python-pysnmp-apps/python-pysnmp-apps.mk b/package/python-pysnmp-apps/python-pysnmp-apps.mk
index 79c436fa73..ee494eba0f 100644
--- a/package/python-pysnmp-apps/python-pysnmp-apps.mk
+++ b/package/python-pysnmp-apps/python-pysnmp-apps.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_APPS_VERSION = 0.4.1
+PYTHON_PYSNMP_APPS_VERSION = 0.5.3
 PYTHON_PYSNMP_APPS_SOURCE = pysnmp-apps-$(PYTHON_PYSNMP_APPS_VERSION).tar.gz
-PYTHON_PYSNMP_APPS_SITE = https://pypi.python.org/packages/source/p/pysnmp-apps
+PYTHON_PYSNMP_APPS_SITE = https://files.pythonhosted.org/packages/c2/1a/26f5f3732df2c7d34663a7f2fa6534b5b4ffae73a4a440b75864ec826ba6
 PYTHON_PYSNMP_APPS_SETUP_TYPE = setuptools
 PYTHON_PYSNMP_APPS_LICENSE = BSD-3-Clause
 PYTHON_PYSNMP_APPS_LICENSE_FILES = LICENSE.txt
-
 PYTHON_PYSNMP_APPS_DEPENDENCIES = python-pysnmp
 
 $(eval $(python-package))
