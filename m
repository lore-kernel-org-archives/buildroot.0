From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 30 Apr 2019 09:19:11 -0400
Subject: [Buildroot] [PATCH 03/11] package/python-markupsafe: bump to
 version 1.1.1
In-Reply-To: <20190430131919.130128-1-aduskett@gmail.com>
References: <20190430131919.130128-1-aduskett@gmail.com>
Message-ID: <20190430131919.130128-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also add hash for the license file.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-markupsafe/python-markupsafe.hash | 6 ++++--
 package/python-markupsafe/python-markupsafe.mk   | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index 4226a1ddf6..044d6d83a5 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,3 +1,5 @@
 # md5 from https://pypi.python.org/pypi/markupsafe/json, sha256 locally computed
-md5	2fcedc9284d50e577b5192e8e3578355  MarkupSafe-1.0.tar.gz
-sha256	a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665  MarkupSafe-1.0.tar.gz
+md5	43fd756864fe42063068e092e220c57b  MarkupSafe-1.1.1.tar.gz
+sha256	29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b  MarkupSafe-1.1.1.tar.gz
+sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
+
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index 625a9b5bbf..b527706091 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_MARKUPSAFE_VERSION = 1.0
+PYTHON_MARKUPSAFE_VERSION = 1.1.1
 PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://pypi.python.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
-PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE
+PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.20.1
