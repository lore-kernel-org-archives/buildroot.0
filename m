From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 26 Mar 2020 16:58:48 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-pyasn1-modules: bump to
 version 0.2.8
Message-ID: <20200326225848.40673-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyasn1-modules/python-pyasn1-modules.hash | 6 +++---
 package/python-pyasn1-modules/python-pyasn1-modules.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.hash b/package/python-pyasn1-modules/python-pyasn1-modules.hash
index 96831dc5dc..2305596585 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.hash
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1-modules/json
-md5	18c77d56abeef631d94f95ff2d652859  pyasn1-modules-0.2.7.tar.gz
-sha256	0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe874fe4b  pyasn1-modules-0.2.7.tar.gz
+md5  107e1ece7d0a41d782f69f8a95a4d9bc  pyasn1-modules-0.2.8.tar.gz
+sha256  905f84c712230b2c592c19470d3ca8d552de726050d1d1716282a1f6146be65e  pyasn1-modules-0.2.8.tar.gz
 # Locally computed sha256 checksums
-sha256	22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.txt
+sha256  22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.txt
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.mk b/package/python-pyasn1-modules/python-pyasn1-modules.mk
index afc3c363fd..9933a63aa7 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.mk
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_MODULES_VERSION = 0.2.7
+PYTHON_PYASN1_MODULES_VERSION = 0.2.8
 PYTHON_PYASN1_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
-PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/75/93/c51104ea6a74252957c341ccd110b65efecc18edfd386b666637d67d4d10
+PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/88/87/72eb9ccf8a58021c542de2588a867dbefc7556e14b2866d1e40e9e2b587e
 PYTHON_PYASN1_MODULES_SETUP_TYPE = setuptools
 PYTHON_PYASN1_MODULES_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_MODULES_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
