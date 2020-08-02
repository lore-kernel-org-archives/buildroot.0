From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2020 22:27:16 +0200
Subject: [Buildroot] [git commit] package/python-cython: bump to version
 0.29.21
Message-ID: <20200802202326.658CC83962@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ebeeefe438f4072ff4cd7f6426aeeb66a874900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 73c6904f60..168d168838 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  0936311ccd09f1164ab2f46ca5cd8c3b  Cython-0.29.17.tar.gz
-sha256  6361588cb1d82875bcfbad83d7dd66c442099759f895cf547995f00601f9caf2  Cython-0.29.17.tar.gz
+md5  12c5e45af71dcc6dff28cdcbcbef6f39  Cython-0.29.21.tar.gz
+sha256  e57acb89bd55943c8d8bf813763d20b9099cc7165c0f16b707631a7654be9cad  Cython-0.29.21.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index cf19e35b8b..308b01e5b2 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.17
+PYTHON_CYTHON_VERSION = 0.29.21
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/99/36/a3dc962cc6d08749aa4b9d85af08b6e354d09c5468a3e0edc610f44c856b
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/6c/9f/f501ba9d178aeb1f5bf7da1ad5619b207c90ac235d9859961c11829d0160
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
