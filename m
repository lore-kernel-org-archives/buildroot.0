From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 15:40:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-yatl: bump to version
 20210326.1
Message-ID: <20210405134030.3916629-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-yatl/python-yatl.hash | 4 ++--
 package/python-yatl/python-yatl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yatl/python-yatl.hash b/package/python-yatl/python-yatl.hash
index 534d74b654..6f4623c516 100644
--- a/package/python-yatl/python-yatl.hash
+++ b/package/python-yatl/python-yatl.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/yatl/json
-md5  3368146e56b35ba5569ff64054c2a3fd  yatl-20200711.1.tar.gz
-sha256  d37b90e7679d2d2873ac634e66adfcd0cd7e4c34438e76a3192cf984faba2595  yatl-20200711.1.tar.gz
+md5  2954413784ced7e52513ae12b2183c88  yatl-20210326.1.tar.gz
+sha256  add729efdc2c9c06e0fcf640d97d4c500de611a38d5fdcc2ec12545d5ab14ca1  yatl-20210326.1.tar.gz
diff --git a/package/python-yatl/python-yatl.mk b/package/python-yatl/python-yatl.mk
index 6df5fcd83e..3a9e2748a5 100644
--- a/package/python-yatl/python-yatl.mk
+++ b/package/python-yatl/python-yatl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YATL_VERSION = 20200711.1
+PYTHON_YATL_VERSION = 20210326.1
 PYTHON_YATL_SOURCE = yatl-$(PYTHON_YATL_VERSION).tar.gz
-PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/b4/f5/b6020f8ccb3e156fbe0ed7e4a35fbdce4d6a7ef6a9ab0c54cb8880fb7c04
+PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/9d/76/5906d641f452dc2ee56795e2152dafc1d212cd411d1cb893af29a7d06e33
 PYTHON_YATL_SETUP_TYPE = setuptools
 PYTHON_YATL_LICENSE = BSD-3-Clause
 
-- 
2.30.2
