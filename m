From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat,  3 Aug 2019 21:06:32 -0400
Subject: [Buildroot] [PATCH 03/05] package/python-cffi: bump to version
 1.12.3
In-Reply-To: <20190804010634.85332-1-aduskett@gmail.com>
References: <20190804010634.85332-1-aduskett@gmail.com>
Message-ID: <20190804010634.85332-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 3d4387fb08..15f67e9cc1 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/cffi/json, sha256 locally computed
-md5	a731487324b501c8295221b629d3f5f3  cffi-1.11.2.tar.gz
-sha256	ab87dd91c0c4073758d07334c1e5f712ce8fe48f007b86f8238773963ee700a6  cffi-1.11.2.tar.gz
+md5	35ad1f9e1003cac9404c1493eb10d7f5  cffi-1.12.3.tar.gz
+sha256	041c81822e9f84b1d9c401182e174996f0bae9991f33725d059b771744290774  cffi-1.12.3.tar.gz
 sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 1ef83917ad..810c032bff 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.11.2
+PYTHON_CFFI_VERSION = 1.12.3
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://pypi.python.org/packages/c9/70/89b68b6600d479034276fed316e14b9107d50a62f5627da37fafe083fde3
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/93/1a/ab8c62b5838722f29f3daffcc8d4bd61844aa9b5f437341cc890ceee483b
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
-- 
2.21.0
