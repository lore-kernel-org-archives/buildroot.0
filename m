From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 08:55:52 +0200
Subject: [Buildroot] [git commit] [PATCH 01/05 package/python-cryptography:
 bump to version 2.7
Message-ID: <20190804065537.5596986BF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=123a63df6ff006cb52004b7615760f7aee2a58da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also change the hash for LICENSE.APACHE due to changing http to https
in the license URL.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cryptography/python-cryptography.hash | 6 +++---
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 36da21c9c1..715beb71d1 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/cryptography/json
-md5	2b5e8269c43c9b9ab54fc8c75ba3c7ac  cryptography-2.3.1.tar.gz
-sha256	8d10113ca826a4c29d5b85b2c4e045ffa8bad74fb525ee0eceb1d38d4c70dfd6  cryptography-2.3.1.tar.gz
+md5	7dfe1035cae43569e571318f000462a4  cryptography-2.7.tar.gz
+sha256	e6347742ac8f35ded4a46ff835c60e68c22a536a8ae5c4422966d06946b6d4c6  cryptography-2.7.tar.gz
 # Locally computed sha256 checksums
 sha256	35452b557fab0efb1e80d7edb9c4e5118b9384082adaa051dde342102cb9de8d  LICENSE
-sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE
+sha256	aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
 sha256	602c4c7482de6479dd2e9793cda275e5e63d773dacd1eca689232ab7008fb4fb  LICENSE.BSD
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 91b680b2be..dad09672eb 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 2.3.1
+PYTHON_CRYPTOGRAPHY_VERSION = 2.7
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/22/21/233e38f74188db94e8451ef6385754a98f3cad9b59bedf3a8e8b14988be4
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/c2/95/f43d02315f4ec074219c6e3124a87eba1d2d12196c2767fadfdc07a83884
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
