From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 21 Dec 2015 11:50:21 +0100
Subject: [Buildroot] [PATCH 1/4] python-zope-interface: bump to 4.1.3
Message-ID: <1450695024-24875-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add pypi MD5 checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-zope-interface/python-zope-interface.hash | 5 +++--
 package/python-zope-interface/python-zope-interface.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index bdd05d7..2c161f3 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  441fefcac1fbac57c55239452557d3598571ab82395198b2565a29d45d1232f6  zope.interface-4.1.2.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9ae3d24c0c7415deb249dd1a132f0f79, sha256 locally computed
+md5     9ae3d24c0c7415deb249dd1a132f0f79  zope.interface-4.1.3.tar.gz
+sha256  2e221a9eec7ccc58889a278ea13dcfed5ef939d80b07819a9a8b3cb1c681484f  zope.interface-4.1.3.tar.gz
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index dea6203..ac3c230 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 4.1.2
+PYTHON_ZOPE_INTERFACE_VERSION = 4.1.3
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
 PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/source/z/zope.interface
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
-- 
2.1.4
