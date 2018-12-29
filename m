From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 29 Dec 2018 21:01:48 +0200
Subject: [Buildroot] [PATCH 1/1] python-pysmi: bump to version 0.3.3
Message-ID: <20181229190148.17568-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change in license file - year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pysmi/python-pysmi.hash | 6 +++---
 package/python-pysmi/python-pysmi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index ea4d7633ea..3127d20576 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5	8df6d5ebc5d71bffb09f47787d8c7b9e  pysmi-0.3.2.tar.gz
-sha256	309039ab9bd458cc721692ffff10b4ad2c4a8e731e6507c34866ca2727323353  pysmi-0.3.2.tar.gz
+md5	7ca6a849ea51929cfd44c4e5bc316b0e  pysmi-0.3.3.tar.gz
+sha256	4e35c2b935ba5a68e086d7781dae1b508c228a960279620d182e876448acf02f  pysmi-0.3.3.tar.gz
 # Locally computed sha256 checksums
-sha256	ac2f8f67cae76e36a25496fbdf3293dd14b3d6db63f1ce4242ae9dd4fb7b90fd  LICENSE.rst
+sha256	c43704eafcfa2bc33e56168f2b498c3c34a1d7865855626a52b5af411fc5837f  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index d4f2ef1cd0..a686b6fba7 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 0.3.2
+PYTHON_PYSMI_VERSION = 0.3.3
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/46/be/8c1b68ec30992dd9f5127fff7bf518110ad4de8ae8533f921ad605d09a01
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/71/32/182dd4fa0c4e20c2a14154d3133cc08374694c2518a7c5445a918332b113
 PYTHON_PYSMI_SETUP_TYPE = setuptools
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
-- 
2.19.1
