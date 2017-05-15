From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 15 May 2017 17:05:42 +0100
Subject: [Buildroot] [PATCH next 1/2] python-dataproperty: bump version to
	0.22.0
Message-ID: <20170515160543.21760-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/python-dataproperty/python-dataproperty.hash | 4 ++--
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index ad8849827..6ab0646ee 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/dataproperty/json, sha256 locally computed
-md5 89e78396b91e6156c522175b3316546f  DataProperty-0.21.1.tar.gz
-sha256 7a5c77004e8f1bca734838966e30e555e323c06bda613ed3985fa9bef2665c71  DataProperty-0.21.1.tar.gz
+md5 7b41e6f9b250c4f04f07bbd2999c4259  DataProperty-0.22.0.tar.gz
+sha256 3ed49c923a996cbabc008fba7f2df8b2f303e961d64507348120faaacb6b5157  DataProperty-0.22.0.tar.gz
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index d9d0783b0..7feeed555 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.21.1
+PYTHON_DATAPROPERTY_VERSION = 0.22.0
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/fc/9a/e6cc202b81b02aec39f35f2d13a6efc349cdc62ae3890f84b586468597ad
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/ed/00/091f46cc81869b925d4001300bef31ea2224436c494d1de7145d4bb56df1
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.13.0
