From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun,  7 Jun 2020 19:02:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-pydal: bump to version
 v20200531.1
Message-ID: <20200607170238.194921-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps python-pydal to version v20200531.1.
It updates alse the LICENSE hash cause the file was cleaned and revised by the
author, the license remains the same.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index ccc388d932..1823050713 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,3 @@
 # sha256 from https://pypi.org/project/pyDAL/#files
-sha256 763ed017f431fc3d9fa9243f6be2519ff49b8a260d15763c4733762d9c086904  python-pydal-18.09.tar.gz
-sha256 ae7d7b6888bb72f26af2bcbee69ae6f8a49e12f66c99e78f2a8b806effc5219d  LICENSE
+sha256 ae0de85bbecfef886db8f8888c9b6de794ba2615867a75d5daa463701152baa4  python-pydal-20200531.1.tar.gz
+sha256 1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 8ef06bc036..0836b1d00a 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 18.09
+PYTHON_PYDAL_VERSION = 20200531.1
 PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
-PYTHON_PYDAL_LICENSE_FILES = LICENSE
+PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.25.1
