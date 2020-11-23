From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2020 20:40:12 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version 5.2.0
Message-ID: <20201123034012.2128722-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License hash changed due to formating update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cbor2/python-cbor2.hash | 6 +++---
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index a643cdbe25..073d071a58 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  693c1bd6635bee8a591a70ea924ad676  cbor2-5.1.2.tar.gz
-sha256  91759bd0ee5ef0d4fa24144dfa551670730baeca8cf2fff1cc59f734ecd21de6  cbor2-5.1.2.tar.gz
+md5  0940aa8bfd1a07f06a983bb6dc78f1ca  cbor2-5.2.0.tar.gz
+sha256  a33aa2e5534fd74401ac95686886e655e3b2ce6383b3f958199b6e70a87c94bf  cbor2-5.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
+sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 115eb8d276..17639ccf1c 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.1.2
+PYTHON_CBOR2_VERSION = 5.2.0
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/3f/14/a7cdcab562ee9b599ce409168eb0a5f7c7190a83f23c92c8c310e56d1b58
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/02/15/f4d7fb47753099fcd9d7f7c81920d422a3ab2e710400ec0f4a1b511b51ae
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
