From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 14:05:18 +0100
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
	4.0.0
Message-ID: <20170116130639.F35E280E61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c50dc281b7ce5785b8f4bfe5804c4a8efb88afe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps python pillow to 4.0.0 version

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 1dd816c..182e82f 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pillow/json, sha256 locally computed
-md5	09ebb92ec5cbba13ff1acf139caf6b66  Pillow-3.4.2.tar.gz
-sha256	0ee9975c05602e755ff5000232e0335ba30d507f6261922a658ee11b1cec36d1  Pillow-3.4.2.tar.gz
+md5	d5af224b0fa2c66dacc9814785fef9e7  Pillow-4.0.0.tar.gz
+sha256	ee26d2d7e7e300f76ba7b796014c04011394d0c4a5ed9a288264a3e443abca50  Pillow-4.0.0.tar.gz
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 59cde75..faa0e16 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 3.4.2
+PYTHON_PILLOW_VERSION = 4.0.0
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://pypi.python.org/packages/46/4f/94f6165052774839b4a4af0c72071aa528d5dc8cb8bc6bb43e24a55c10cc
+PYTHON_PILLOW_SITE = https://pypi.python.org/packages/8d/80/eca7a2d1a3c2dafb960f32f844d570de988e609f5fd17de92e1cf6a01b0a
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
