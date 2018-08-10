From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 14:18:29 +0200
Subject: [Buildroot] [git commit branch/next] package/python-can: bump to
 version 2.2.1
Message-ID: <20180810131900.BB7CB8B895@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a3d71eaea8ac9d9b697b94596177d5c469e7b64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps python-can to version 2.2.1 and adds the has for
license file.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-can/python-can.hash | 7 ++++---
 package/python-can/python-can.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index 8a70bb42b7..234f138562 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,3 +1,4 @@
-# md5 from https://pypi.python.org/pypi/python-can/json, sha256 locally computed
-md5     3310f0aa2a8492d0ff614ecf636ec8a8  python-can-2.1.0.tar.gz
-sha256  4a5c01dd67feeda35f88e6c12ea14ac8cabd426b9be0cc5f9fd083fe90a9dbfc  python-can-2.1.0.tar.gz
+# sha256 for python-can from https://pypi.org/project/python-can/#files
+# sha256 for LICENSE.txt locally computed
+sha256  b5e93b2ee32bdd597d9d908afe5171c402a04c9678ba47b60f33506738b1375b  python-can-2.2.1.tar.gz
+sha256  ea7d049c7705dc13afc202dd18e1827f3484f8212fd3fa7b82fc4a0c363432c9  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 9a7e903303..01a335f5c8 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 2.1.0
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/04/87/0d5b0f2f4e5d7f64a44f74b7f0bc1668457e6aa7e90b04ad15c3b9a44411
+PYTHON_CAN_VERSION = 2.2.1
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/e6/49/7a25ca6f38421009621b9958a725a0bd57dc0caa656ee508324f26ea5363
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
 PYTHON_CAN_SETUP_TYPE = setuptools
