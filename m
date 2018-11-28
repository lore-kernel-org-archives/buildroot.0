From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 28 Nov 2018 10:08:32 -0800
Subject: [Buildroot] [PATCH 1/1] python-networkmanager: bump to version 2.1
Message-ID: <20181128180832.78708-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/python-networkmanager/python-networkmanager.hash | 6 +++---
 package/python-networkmanager/python-networkmanager.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-networkmanager/python-networkmanager.hash b/package/python-networkmanager/python-networkmanager.hash
index 1fed4befb7..83621761cd 100644
--- a/package/python-networkmanager/python-networkmanager.hash
+++ b/package/python-networkmanager/python-networkmanager.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/python-networkmanager/json, sha256 locally computed
-md5	5fc644a65463031295c6b7dd51a0f1bd  python-networkmanager-2.0.1.tar.gz
-sha256	bc36507506ad29bfdac941b0987ebd1cc9633c9a9291d7378e229e4515a0a517  python-networkmanager-2.0.1.tar.gz
+# md5 and sha256 from https://pypi.python.org/pypi/python-networkmanager/json
+md5	f638d854a3639fb37c0e06d1092a771e  python-networkmanager-2.1.tar.gz
+sha256	aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc  python-networkmanager-2.1.tar.gz
diff --git a/package/python-networkmanager/python-networkmanager.mk b/package/python-networkmanager/python-networkmanager.mk
index 29afb5e564..de893f757a 100644
--- a/package/python-networkmanager/python-networkmanager.mk
+++ b/package/python-networkmanager/python-networkmanager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_NETWORKMANAGER_VERSION = 2.0.1
-PYTHON_NETWORKMANAGER_SITE = https://pypi.python.org/packages/d7/f9/5cbd99fd24a072875ce048e48d1754285f137aab447de8fee63b6cba990a
+PYTHON_NETWORKMANAGER_VERSION = 2.1
+PYTHON_NETWORKMANAGER_SITE = https://files.pythonhosted.org/packages/73/ec/2cc46290cedc99f59df3633d428dfa91d95946ca49af96fdb53514ee195f
 PYTHON_NETWORKMANAGER_SETUP_TYPE = setuptools
 PYTHON_NETWORKMANAGER_LICENSE = Zlib
 PYTHON_NETWORKMANAGER_LICENSE_FILES = COPYING
-- 
2.19.2
