From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 27 Oct 2017 09:07:28 +0200
Subject: [Buildroot] [PATCH 1/2] python-zope-interface: bump version to 4.4.3
Message-ID: <1509088049-13995-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-zope-interface/python-zope-interface.hash | 7 ++++---
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 5ba2e84df9..2aa07335a4 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,3 +1,4 @@
-# md5 from https://pypi.python.org/pypi/zope-interface/json, sha256 locally computed
-md5	d69131352ef06753388c3da09cd8c8aa  zope.interface-4.4.2.tar.gz
-sha256	4e59e427200201f69ef82956ddf9e527891becf5b7cde8ec3ce39e1d0e262eb0  zope.interface-4.4.2.tar.gz
+# md5 from https://pypi.python.org/pypi/zope.interface/json, sha256 locally computed
+md5	8700a4f527c1203b34b10c2b4e7a6912  zope.interface-4.4.3.tar.gz
+sha256	d6d26d5dfbfd60c65152938fcb82f949e8dada37c041f72916fef6621ba5c5ce  zope.interface-4.4.3.tar.gz
+sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 37e8d39335..7dd6812976 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 4.4.2
+PYTHON_ZOPE_INTERFACE_VERSION = 4.4.3
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/c5/88/93373971f893714f0dc15e09696ec4886ee8b4e561ce5ae45612c2c516c4
+PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/bd/d2/25349ed41f9dcff7b3baf87bd88a4c82396cf6e02f1f42bb68657a3132af
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.11.0
