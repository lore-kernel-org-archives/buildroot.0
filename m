From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 14:48:40 +0200
Subject: [Buildroot] [git commit] package/python-pysnmp: bump version to
	4.3.2
Message-ID: <20161007131551.90F7882262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cecbee260390e94513281f513100e09decf3597f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pysnmp/python-pysnmp.hash | 5 +++--
 package/python-pysnmp/python-pysnmp.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index c7957a0..b0f0f49 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  c5d78273f14afc6401b7456f086e7b56baaaa51fa0c39830d159bed611c9d89d  pysnmp-4.2.4.tar.gz
+# md5 from https://pypi.python.org/pypi/pysnmp/json, sha256 locally computed
+md5	9a4d23c4c1edea1c77faed72c469d8e8  pysnmp-4.3.2.tar.gz
+sha256	7c2bd81df17aa7dca0057a68e7a32284a72231309a0237d66d5b803b5c118977  pysnmp-4.3.2.tar.gz
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index 3d0f3b5..dff8bdd 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 4.2.4
+PYTHON_PYSNMP_VERSION = 4.3.2
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://pypi.python.org/packages/source/p/pysnmp
+PYTHON_PYSNMP_SITE = https://pypi.python.org/packages/9e/77/795fcc9d9a01adcb6175a3bf6532132addb8904922afd7877a9930d89f2f
 PYTHON_PYSNMP_SETUP_TYPE = setuptools
 
 PYTHON_PYSNMP_LICENSE = BSD-3c
-PYTHON_PYSNMP_LICENSE_FILES = LICENSE
+PYTHON_PYSNMP_LICENSE_FILES = LICENSE.txt
 
 PYTHON_PYSNMP_DEPENDENCIES = python-pyasn python-pycrypto
 
