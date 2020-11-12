From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 12 Nov 2020 20:31:28 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/python-yatl: bump to version
 20200711.1
Message-ID: <20201112193128.440625-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/web2py/yatl/compare/v20200430.1...master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-yatl/python-yatl.hash | 4 ++--
 package/python-yatl/python-yatl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yatl/python-yatl.hash b/package/python-yatl/python-yatl.hash
index 9238e71b22..534d74b654 100644
--- a/package/python-yatl/python-yatl.hash
+++ b/package/python-yatl/python-yatl.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/yatl/json
-md5  930be78b3d6e33f3f920619d673c345a  yatl-20200430.1.tar.gz
-sha256  5220390b27f010046642c00aded9ffc694e383a3d7a47985c8809d8482c8478a  yatl-20200430.1.tar.gz
+md5  3368146e56b35ba5569ff64054c2a3fd  yatl-20200711.1.tar.gz
+sha256  d37b90e7679d2d2873ac634e66adfcd0cd7e4c34438e76a3192cf984faba2595  yatl-20200711.1.tar.gz
diff --git a/package/python-yatl/python-yatl.mk b/package/python-yatl/python-yatl.mk
index fca39bb5ef..6df5fcd83e 100644
--- a/package/python-yatl/python-yatl.mk
+++ b/package/python-yatl/python-yatl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YATL_VERSION = 20200430.1
+PYTHON_YATL_VERSION = 20200711.1
 PYTHON_YATL_SOURCE = yatl-$(PYTHON_YATL_VERSION).tar.gz
-PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/7f/bd/aa36c1a1d876757e3fa365e6c455097ebd3f2e8e7ded23e75901ff9c9ecf
+PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/b4/f5/b6020f8ccb3e156fbe0ed7e4a35fbdce4d6a7ef6a9ab0c54cb8880fb7c04
 PYTHON_YATL_SETUP_TYPE = setuptools
 PYTHON_YATL_LICENSE = BSD-3-Clause
 
-- 
2.28.0
