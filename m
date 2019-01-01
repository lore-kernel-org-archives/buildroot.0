From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 11:11:04 +0100
Subject: [Buildroot] [git commit] package/python-pyasn1-modules: bump to
 version 0.2.3
Message-ID: <20190101100626.23CFA883E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a52a3c1d53337feb8d30335b5beb238e66f98294
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License change - 2019 year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyasn1-modules/python-pyasn1-modules.hash | 6 +++---
 package/python-pyasn1-modules/python-pyasn1-modules.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.hash b/package/python-pyasn1-modules/python-pyasn1-modules.hash
index 7c7f02461f..afceea3902 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.hash
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1-modules/json
-md5	65ce1ea1021679bffe96065baab232de  pyasn1-modules-0.2.2.tar.gz
-sha256	a0cf3e1842e7c60fde97cb22d275eb6f9524f5c5250489e292529de841417547  pyasn1-modules-0.2.2.tar.gz
+md5	59e45656b8b2661ba97ad401797caa36  pyasn1-modules-0.2.3.tar.gz
+sha256	d14fcb29dabecba3d7b360bf72327c26c385248a5d603cf6be5f566ce999b261  pyasn1-modules-0.2.3.tar.gz
 # Locally computed sha256 checksums
-sha256	f82128f64d567c333936a12b99a21d0e8cd66ce628d51ce0a7770cc38dc7fe43  LICENSE.txt
+sha256	22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.txt
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.mk b/package/python-pyasn1-modules/python-pyasn1-modules.mk
index dbdf82e6ee..784f2014ac 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.mk
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_MODULES_VERSION = 0.2.2
+PYTHON_PYASN1_MODULES_VERSION = 0.2.3
 PYTHON_PYASN1_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
-PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/37/33/74ebdc52be534e683dc91faf263931bc00ae05c6073909fde53999088541
+PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/c8/0e/3fe59edc782faf8b429f4a1db734418d0f68a7e50f43095747c08330e952
 PYTHON_PYASN1_MODULES_SETUP_TYPE = setuptools
 PYTHON_PYASN1_MODULES_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_MODULES_LICENSE_FILES = LICENSE.txt
