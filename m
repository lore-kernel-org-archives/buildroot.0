From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:02 -0500
Subject: [Buildroot] [PATCH 05/58] python-cffi: bump to version 1.9.1
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-6-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 39065bc..f65c9e7 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/cffi/json, sha256 locally computed
-md5  c8e877fe0426a99d0cf5872cf2f95b27  cffi-1.8.3.tar.gz
-sha256	 c321bd46faa7847261b89c0469569530cad5a41976bb6dba8202c0159f476568  cffi-1.8.3.tar.gz
+md5 b8fa7ccb87790531db3316ab17aa8244 cffi-1.9.1.tar.gz
+sha256 563e0bd53fda03c151573217b3a49b3abad8813de9dd0632e10090f6190fdaf8 cffi-1.9.1.tar.gz
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index d348695..8683665 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.8.3
+PYTHON_CFFI_VERSION = 1.9.1
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://pypi.python.org/packages/0a/f3/686af8873b70028fccf67b15c78fd4e4667a3da995007afc71e786d61b0a
+PYTHON_CFFI_SITE = https://pypi.python.org/packages/a1/32/e3d6c3a8b5461b903651dd6ce958ed03c093d2e00128e3f33ea69f1d7965
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
-- 
2.9.3
