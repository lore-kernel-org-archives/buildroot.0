From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 10:09:16 +0100
Subject: [Buildroot] [git commit] package/python-cffi: bump to version 1.13.1
Message-ID: <20191102090553.DDC088E519@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1dabff6d7cdc0f87d3ec7d46e2675ad34e4d119
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 9ee472ce09..dd8720e822 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5	2c90be6d3bfbf80ab732b28fd677051d  cffi-1.13.0.tar.gz
-sha256	8fe230f612c18af1df6f348d02d682fe2c28ca0a6c3856c99599cdacae7cf226  cffi-1.13.0.tar.gz
+md5	824ad9f228fbc6ce203c334e2ff4ab8f  cffi-1.13.1.tar.gz
+sha256	558b3afef987cf4b17abd849e7bedf64ee12b28175d564d05b628a0f9355599b  cffi-1.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 623c439f84..b43e8887e5 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.13.0
+PYTHON_CFFI_VERSION = 1.13.1
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/d6/cf/ba7e2df852a2fc807d48b3f7bea46f741830be4f047a0712e6de3e95fb6a
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/0d/aa/c5ac2f337d9a10ee95d160d47beb8d9400e1b2a46bb94990a0409fe6d133
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
