From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:22:13 +0200
Subject: [Buildroot] [git commit] python-cryptography: bump to version 1.3.4
Message-ID: <20160605202804.D1494819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a1ed67c7a708ec99651aaf4f8ad420a51ffd1f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cryptography/python-cryptography.hash | 6 +++---
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index fa15fa0..3f8f61b 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,4 +1,4 @@
-# From https://pypi.python.org/pypi?:action=show_md5&digest=bc8148d2ff2d80fef8ef2d2e856b3a7f
-md5     bc8148d2ff2d80fef8ef2d2e856b3a7f  cryptography-1.3.1.tar.gz
+# From https://pypi.python.org/pypi?:action=show_md5&digest=defd153ed901089f5aeac6eb066d5ef7
+md5     defd153ed901089f5aeac6eb066d5ef7  cryptography-1.3.4.tar.gz
 # Calculated based on the hash above
-sha256  b4b36175e0f95ddc88435c26dbe3397edce48e2ff5fe41d504cdb3beddcd53e2  cryptography-1.3.1.tar.gz
+sha256  423ff890c01be7c70dbfeaa967eeef5146f1a43a5f810ffdc07b178e48a105a9  cryptography-1.3.4.tar.gz
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 1b5eb9c..fe392f9 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 1.3.1
+PYTHON_CRYPTOGRAPHY_VERSION = 1.3.4
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/source/c/cryptography
+PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/f8/70/d7bd5c9c764732d5876ad34293e1ca55b2305a73ae6fcf1312202d1a798e
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3c
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
