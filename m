From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 28 May 2018 20:18:05 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version 5.1.0
Message-ID: <1527531485-24693-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps python-pillow to version 5.1.0.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pillow/python-pillow.hash | 5 ++---
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index d8c083b..463b562 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,3 +1,2 @@
-# md5 from https://pypi.python.org/pypi/pillow/json, sha256 locally computed
-md5 11e5e2046cf41586716a6042d89abeeb  Pillow-4.2.1.tar.gz
-sha256 c724f65870e545316f9e82e4c6d608ab5aa9dd82d5185e5b2e72119378740073  Pillow-4.2.1.tar.gz
+# sha256 from https://pypi.org/project/Pillow/5.1.0/#files
+sha256 cee9bc75bff455d317b6947081df0824a8f118de2786dc3d74a3503fd631f4ef  Pillow-5.1.0.tar.gz
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 8407c99..dbce3fb 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 4.2.1
+PYTHON_PILLOW_VERSION = 5.1.0
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://pypi.python.org/packages/55/aa/f7f983fb72710a9daa4b3374b7c160091d3f94f5c09221f9336ade9027f3
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/89/b8/2f49bf71cbd0e9485bb36f72d438421b69b7356180695ae10bd4fd3066f5
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
-- 
2.7.4
