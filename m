From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Feb 2020 20:04:52 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 2.8
Message-ID: <20200213030452.57638-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/python-cryptography.hash | 4 ++--
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 715beb71d1..30ffa73d72 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cryptography/json
-md5	7dfe1035cae43569e571318f000462a4  cryptography-2.7.tar.gz
-sha256	e6347742ac8f35ded4a46ff835c60e68c22a536a8ae5c4422966d06946b6d4c6  cryptography-2.7.tar.gz
+md5	77730058b556c6d9838679a94c6229ce  cryptography-2.8.tar.gz
+sha256	3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02871651  cryptography-2.8.tar.gz
 # Locally computed sha256 checksums
 sha256	35452b557fab0efb1e80d7edb9c4e5118b9384082adaa051dde342102cb9de8d  LICENSE
 sha256	aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index dad09672eb..54437ae688 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 2.7
+PYTHON_CRYPTOGRAPHY_VERSION = 2.8
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/c2/95/f43d02315f4ec074219c6e3124a87eba1d2d12196c2767fadfdc07a83884
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/be/60/da377e1bed002716fb2d5d1d1cab720f298cb33ecff7bf7adea72788e4e4
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.20.1
