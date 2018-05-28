From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 28 May 2018 20:37:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-pydal: bump to version 17.11
Message-ID: <1527532626-18321-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps python-pyDAL to version 17.11.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pydal/python-pydal.hash | 5 ++---
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 9a3fad3..8e6fa90 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,2 @@
-# md5 from https://pypi.python.org/pypi/pydal/json, sha256 locally computed
-md5 5a6ad0db15dc39987b4518247a9d0b4b pyDAL-17.8.tar.gz
-sha256 46abe2c978ec24013e29cf485a74c90309ebcd2f0d577687ff2d224547cebfc8  pyDAL-17.8.tar.gz
+# sha256 from https://pypi.org/project/pyDAL/#files
+sha256 59b28cbad92743c76134fc078b62f49d5c02b86c55cbdee527f75995d2681735  pyDAL-17.11.tar.gz
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index c8d4b44..9de56bf 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 17.8
+PYTHON_PYDAL_VERSION = 17.11
 PYTHON_PYDAL_SOURCE = pyDAL-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://pypi.python.org/packages/e3/bd/1d5ca8be486d845074161456637f7d73acc09dc6c8d69bf0e7ad55ce9027
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/d2/64/a119cb70ed91a6273aad811fd250b8a55d4bc8b0d900757723ec5a4f0ba9
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE
 PYTHON_PYDAL_SETUP_TYPE = setuptools
-- 
2.7.4
