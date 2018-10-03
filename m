From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Oct 2018 21:02:18 +0200
Subject: [Buildroot] [git commit] python-zope-interface: bump to version
 4.5.0
Message-ID: <20181003190139.3F9068B8EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28e15dae70d5b8e4c650724a44233f3cbe293828
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix indentation for license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-zope-interface/python-zope-interface.hash | 9 +++++----
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 2aa07335a4..94493e127f 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/zope.interface/json, sha256 locally computed
-md5	8700a4f527c1203b34b10c2b4e7a6912  zope.interface-4.4.3.tar.gz
-sha256	d6d26d5dfbfd60c65152938fcb82f949e8dada37c041f72916fef6621ba5c5ce  zope.interface-4.4.3.tar.gz
-sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
+# md5, sha256 from https://pypi.org/pypi/zope-interface/json
+md5	7b669cd692d817772c61d2e3ad0f1e71  zope.interface-4.5.0.tar.gz
+sha256	57c38470d9f57e37afb460c399eb254e7193ac7fb8042bd09bdc001981a9c74c  zope.interface-4.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256	3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 7dd6812976..10bb70fa53 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 4.4.3
+PYTHON_ZOPE_INTERFACE_VERSION = 4.5.0
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/bd/d2/25349ed41f9dcff7b3baf87bd88a4c82396cf6e02f1f42bb68657a3132af
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/ac/8a/657532df378c2cd2a1fe6b12be3b4097521570769d4852ec02c24bd3594e
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
