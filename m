From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  5 Jul 2020 15:54:35 -0600
Subject: [Buildroot] [PATCH 2/2] package/python-greenlet: bump to version
 0.4.16
In-Reply-To: <20200705215435.148058-1-james.hilliard1@gmail.com>
References: <20200705215435.148058-1-james.hilliard1@gmail.com>
Message-ID: <20200705215435.148058-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-greenlet/python-greenlet.hash | 6 +++---
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index 4cbadaedb1..eed8e59713 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5	10fa304f673fc18b28fa6d8c6658cb80  greenlet-0.4.15.tar.gz
-sha256	9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc  greenlet-0.4.15.tar.gz
+md5  9aebea08f7beb6b87143d0588578c984  greenlet-0.4.16.tar.gz
+sha256  6e06eac722676797e8fce4adb8ad3dc57a1bb3adfb0dd3fdf8306c055a38456c  greenlet-0.4.16.tar.gz
 # Locally computed sha256 checksums
-sha256	bbde55d5456a1e912633ed3f66d1dbd9504e3e3dce4f4c2015043cdcbc56e697  LICENSE
+sha256  bbde55d5456a1e912633ed3f66d1dbd9504e3e3dce4f4c2015043cdcbc56e697  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 01d578a183..9243afe514 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 0.4.15
+PYTHON_GREENLET_VERSION = 0.4.16
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/f8/e8/b30ae23b45f69aa3f024b46064c0ac8e5fcb4f22ace0dca8d6f9c8bbe5e7
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/20/5e/b989a19f4597b825f44125345cd8a8574216fae7fafe69e2cb1238ebd18a
 PYTHON_GREENLET_SETUP_TYPE = distutils
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
-- 
2.25.1
