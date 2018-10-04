From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 14:22:16 +0200
Subject: [Buildroot] [git commit] python-logbook: bump to version 1.4.0
Message-ID: <20181004122631.9051E8C715@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b9e0810c38f10c344dfa134fe9ad1ef235e3688
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license file (plus hash)

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-logbook/python-logbook.hash | 8 +++++---
 package/python-logbook/python-logbook.mk   | 5 +++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index 1a79046c3d..b15f8b9959 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/logbook/json, sha256 locally computed
-md5	22fea705e067c118925898f0c30b0508  Logbook-1.0.0.tar.gz
-sha256	87da2515a6b3db866283cb9d4e5a6ec44e52a1d556ebb2ea3b6e7e704b5f1872  Logbook-1.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/logbook/json
+md5	926d40a90cfe8eceade449fca2314b16  Logbook-1.4.0.tar.gz
+sha256	3c0a3ebd48e89fcdd725fe393eb9226c789dca5a4e7842d65e2f256645fd1cd9  Logbook-1.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256	2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index 5fcf301ba4..25a520dc83 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_LOGBOOK_VERSION = 1.0.0
+PYTHON_LOGBOOK_VERSION = 1.4.0
 PYTHON_LOGBOOK_SOURCE = Logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
-PYTHON_LOGBOOK_SITE = https://pypi.python.org/packages/34/e8/6419c217bbf464fe8a902418120cccaf476201bd03b50958db24d6e90f65
+PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/36/4b/b610bee18d5cfc4cec7dde056639994e9b34991e4c57816bfff0f3d0ac33
 PYTHON_LOGBOOK_SETUP_TYPE = setuptools
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
+PYTHON_LOGBOOK_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
