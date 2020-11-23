From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2020 20:01:53 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 5.0.2
Message-ID: <20201123030153.2020831-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index a08a14a8a6..6b78301200 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  c2c3311e25636a6f213e998cd1e80d72  multidict-5.0.0.tar.gz
-sha256  1b324444299c3a49b601b1bf621fc21704e29066f6ac2b7d7e4034a4a18662a1  multidict-5.0.0.tar.gz
+md5  b1dab3349efe90934ae3612f1202b733  multidict-5.0.2.tar.gz
+sha256  e5bf89fe57f702a046c7ec718fe330ed50efd4bcf74722940db2eb0919cddb1c  multidict-5.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 1084fe0f6a..a7043643c5 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 5.0.0
+PYTHON_MULTIDICT_VERSION = 5.0.2
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/d2/5a/e95b0f9ebacd42e094e229a9a0a9e44d02876abf64969d0cb07dadcf3c4a
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/da/e6/50c7f52781f45c2b37c77e962c30a3944a9e79a46ea92956e826c24d3432
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.25.1
