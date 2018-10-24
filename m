From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 24 Oct 2018 18:01:28 +0300
Subject: [Buildroot] [PATCH 1/1] python-zope-interface: bump to version 4.6.0
Message-ID: <20181024150128.9989-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 94493e127f..2828d85c32 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5	7b669cd692d817772c61d2e3ad0f1e71  zope.interface-4.5.0.tar.gz
-sha256	57c38470d9f57e37afb460c399eb254e7193ac7fb8042bd09bdc001981a9c74c  zope.interface-4.5.0.tar.gz
+md5	a3b24f9d079bae5e13dd7a88aa512112  zope.interface-4.6.0.tar.gz
+sha256	1b3d0dcabc7c90b470e59e38a9acaa361be43b3a6ea644c0063951964717f0e5  zope.interface-4.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256	3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 10bb70fa53..f36aab692b 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 4.5.0
+PYTHON_ZOPE_INTERFACE_VERSION = 4.6.0
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/ac/8a/657532df378c2cd2a1fe6b12be3b4097521570769d4852ec02c24bd3594e
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/4e/d0/c9d16bd5b38de44a20c6dc5d5ed80a49626fafcb3db9f9efdc2a19026db6
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.17.1
