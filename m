From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 21:29:48 +0200
Subject: [Buildroot] [PATCH 21/21] package/python-zope-interface: bump
	version to 4.3.2
In-Reply-To: <20161006192948.27956-1-bernd.kuhls@t-online.de>
References: <20161006192948.27956-1-bernd.kuhls@t-online.de>
Message-ID: <20161006192948.27956-21-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-zope-interface/python-zope-interface.hash | 6 +++---
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 2c161f3..8558c9a 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9ae3d24c0c7415deb249dd1a132f0f79, sha256 locally computed
-md5     9ae3d24c0c7415deb249dd1a132f0f79  zope.interface-4.1.3.tar.gz
-sha256  2e221a9eec7ccc58889a278ea13dcfed5ef939d80b07819a9a8b3cb1c681484f  zope.interface-4.1.3.tar.gz
+# md5 from https://pypi.python.org/pypi/zope-interface/json, sha256 locally computed
+md5	5f7e15a5bcdfa3c6c0e93ffe45caf87c  zope.interface-4.3.2.tar.gz
+sha256	6a0e224a052e3ce27b3a7b1300a24747513f7a507217fcc2a4cb02eb92945cee  zope.interface-4.3.2.tar.gz
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index ac3c230..7daf5aa 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 4.1.3
+PYTHON_ZOPE_INTERFACE_VERSION = 4.3.2
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/source/z/zope.interface
+PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/38/1b/d55c39f2cf442bd9fb2c59760ed058c84b57d25c680819c25f3aff741e1f
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPLv2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.9.3
