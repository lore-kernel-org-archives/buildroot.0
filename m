From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:09:18 +0200
Subject: [Buildroot] [git commit] package/python{3}-cryptography: bump to
 version 3.3.2
Message-ID: <20210717073535.1EEE081364@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=c64abc69349e28707a8861f0719edf65e7a91462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the last version to support python2.

License hash change due to removal of OpenSSL locking reference:
https://github.com/pyca/cryptography/commit/49109ce1a6e870cb6cc87f05d9ae7c03d70a684b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cryptography/python-cryptography.hash | 6 +++---
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 package/python3-cryptography/python3-cryptography.mk | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index c6768ff21a..7cb38c8d3d 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/cryptography/json
-md5  163608a7cb838c6b39360e1e64377d54  cryptography-3.0.tar.gz
-sha256  8e924dbc025206e97756e8903039662aa58aa9ba357d8e1d8fc29e3092322053  cryptography-3.0.tar.gz
+md5  e2ce2ec8a63965fad351f36ed70fde4b  cryptography-3.3.2.tar.gz
+sha256  5a60d3780149e13b7a6ff7ad6526b38846354d11a15e21068e57073e29e19bed  cryptography-3.3.2.tar.gz
 # Locally computed sha256 checksums
-sha256  35452b557fab0efb1e80d7edb9c4e5118b9384082adaa051dde342102cb9de8d  LICENSE
+sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
 sha256  602c4c7482de6479dd2e9793cda275e5e63d773dacd1eca689232ab7008fb4fb  LICENSE.BSD
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index eff0fa14a5..98c65e1528 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cryptography/python3-cryptography.mk
-PYTHON_CRYPTOGRAPHY_VERSION = 3.0
+PYTHON_CRYPTOGRAPHY_VERSION = 3.3.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/bf/ac/552fc8729d90393845cc3a2062facf4a89dcbe206fa78771d60ddaae7554
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/d4/85/38715448253404186029c575d559879912eb8a1c5d16ad9f25d35f7c4f4c
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
diff --git a/package/python3-cryptography/python3-cryptography.mk b/package/python3-cryptography/python3-cryptography.mk
index 03112e41d4..516864f315 100644
--- a/package/python3-cryptography/python3-cryptography.mk
+++ b/package/python3-cryptography/python3-cryptography.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-cryptography/python-cryptography.mk
-PYTHON3_CRYPTOGRAPHY_VERSION = 3.0
+PYTHON3_CRYPTOGRAPHY_VERSION = 3.3.2
 PYTHON3_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON3_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON3_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/bf/ac/552fc8729d90393845cc3a2062facf4a89dcbe206fa78771d60ddaae7554
+PYTHON3_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/d4/85/38715448253404186029c575d559879912eb8a1c5d16ad9f25d35f7c4f4c
 PYTHON3_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON3_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON3_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
