From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:25:20 +0200
Subject: [Buildroot] [git commit] package/python-xmltodict: bump to version
 0.12.0
Message-ID: <20190903133624.045C38A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4deed54ebde00cd1215cadb92724fcc12c1e4c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-xmltodict/python-xmltodict.hash | 9 +++++----
 package/python-xmltodict/python-xmltodict.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-xmltodict/python-xmltodict.hash b/package/python-xmltodict/python-xmltodict.hash
index 4cb265e9b7..16422d78c9 100644
--- a/package/python-xmltodict/python-xmltodict.hash
+++ b/package/python-xmltodict/python-xmltodict.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/xmltodict/json, sha256 locally computed
-md5	9f955947db085485873ac68154e88069  xmltodict-0.11.0.tar.gz
-sha256	8f8d7d40aa28d83f4109a7e8aa86e67a4df202d9538be40c0cb1d70da527b0df  xmltodict-0.11.0.tar.gz
-sha256  d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
+# md5, sha256 from https://pypi.org/pypi/xmltodict/json
+md5	ddb2bd078cef4f7e3021a578034ad941  xmltodict-0.12.0.tar.gz
+sha256	50d8c638ed7ecb88d90561beedbf720c9b4e851a9fa6c47ebd64e99d166d8a21  xmltodict-0.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256	d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
diff --git a/package/python-xmltodict/python-xmltodict.mk b/package/python-xmltodict/python-xmltodict.mk
index 66007dfb84..05be4b3c6c 100644
--- a/package/python-xmltodict/python-xmltodict.mk
+++ b/package/python-xmltodict/python-xmltodict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XMLTODICT_VERSION = 0.11.0
+PYTHON_XMLTODICT_VERSION = 0.12.0
 PYTHON_XMLTODICT_SOURCE = xmltodict-$(PYTHON_XMLTODICT_VERSION).tar.gz
-PYTHON_XMLTODICT_SITE = https://pypi.python.org/packages/57/17/a6acddc5f5993ea6eaf792b2e6c3be55e3e11f3b85206c818572585f61e1
+PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/58/40/0d783e14112e064127063fbf5d1fe1351723e5dfe9d6daad346a305f6c49
 PYTHON_XMLTODICT_SETUP_TYPE = setuptools
 PYTHON_XMLTODICT_LICENSE = MIT
 PYTHON_XMLTODICT_LICENSE_FILES = LICENSE
