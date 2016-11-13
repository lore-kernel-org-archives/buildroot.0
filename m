From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 13 Nov 2016 22:41:03 +0100
Subject: [Buildroot] [PATCH] package/python-pillow: bump to pillow 3.4.2
Message-ID: <1479073263-18837-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps python pillow to version 3.4.2

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index ed195f6..1dd816c 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pillow/json, sha256 locally computed
-md5	1ea45914e8cc375fb385da2555b37267  Pillow-3.4.0.tar.gz
-sha256	51027d511f4ab991f628f6f7b9b0fbf18f584ee8a67160410afe3b19685b9d50  Pillow-3.4.0.tar.gz
+md5	09ebb92ec5cbba13ff1acf139caf6b66  Pillow-3.4.2.tar.gz
+sha256	0ee9975c05602e755ff5000232e0335ba30d507f6261922a658ee11b1cec36d1  Pillow-3.4.2.tar.gz
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 795fe47..e0e9d5f 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 3.4.0
+PYTHON_PILLOW_VERSION = 3.4.2
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://pypi.python.org/packages/51/1d/6456623ea7e155249c0e82cf92715c42ba1902759d1eeff6ac5c3107e747
+PYTHON_PILLOW_SITE = https://pypi.python.org/packages/46/4f/94f6165052774839b4a4af0c72071aa528d5dc8cb8bc6bb43e24a55c10cc
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
-- 
2.7.4
