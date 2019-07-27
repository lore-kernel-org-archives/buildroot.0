From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 27 Jul 2019 16:59:16 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: bump to version 4.4.0
Message-ID: <20190727135916.23015-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index f37c673807..afbecc920a 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  3ce1c49d4b4a7bc75fb12acb3a6247bb7a91fe420542e6d671ba9187d12a12c2  lxml-4.3.4.tar.gz
+sha256  3b57dc5ed7b6a7d852c961f2389ca99404c2b59fd2088baec6fbaca02f688be4  lxml-4.4.0.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 3b867d46a4..7869290ce8 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.3.4
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/da/b5/d3e0d22649c63e92cb0902847da9ae155c1e801178ab5d272308f35f726e
+PYTHON_LXML_VERSION = 4.4.0
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/e1/f5/5eb3b491958dcfdcfa5daae3c655ab59276bc216ca015e44743c9c220e9e
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
-- 
2.20.1
