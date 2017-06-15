From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 15 Jun 2017 10:03:18 +0200
Subject: [Buildroot] [PATCH v2 1/2] python-cffi: bump to version 1.10.0
Message-ID: <20170615080319.9059-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - no changes

 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index f65c9e776..f6b139d3a 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/cffi/json, sha256 locally computed
-md5 b8fa7ccb87790531db3316ab17aa8244 cffi-1.9.1.tar.gz
-sha256 563e0bd53fda03c151573217b3a49b3abad8813de9dd0632e10090f6190fdaf8 cffi-1.9.1.tar.gz
+md5 2b5fa41182ed0edaf929a789e602a070 cffi-1.10.0.tar.gz
+sha256 b3b02911eb1f6ada203b0763ba924234629b51586f72a21faacc638269f4ced5 cffi-1.10.0.tar.gz
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 868366549..6f4ba3ba0 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.9.1
+PYTHON_CFFI_VERSION = 1.10.0
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://pypi.python.org/packages/a1/32/e3d6c3a8b5461b903651dd6ce958ed03c093d2e00128e3f33ea69f1d7965
+PYTHON_CFFI_SITE = https://pypi.python.org/packages/5b/b9/790f8eafcdab455bcd3bd908161f802c9ce5adbf702a83aa7712fcc345b7
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
-- 
2.11.0
