From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Mar 2016 22:25:40 +0200
Subject: [Buildroot] [git commit] python-m2crypto: bump version
Message-ID: <20160328203055.2C93D80166@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ec49ad06422b3be5b3bbd070be9cae8c8038658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add stronger hash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-m2crypto/python-m2crypto.hash | 5 +++--
 package/python-m2crypto/python-m2crypto.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
index 1bf9709..4ac180f 100644
--- a/package/python-m2crypto/python-m2crypto.hash
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -1,2 +1,3 @@
-# From https://pypi.python.org/pypi/M2Crypto/
-md5 89557730e245294a6cab06de8ad4fb42 M2Crypto-0.23.0.tar.gz
+# md5 from https://pypi.python.org/pypi/M2Crypto/, sha256 locally computed
+md5 8e87235942c76d1ba9f999ee33764fdb M2Crypto-0.24.0.tar.gz
+sha256 80a56441a1d2c0cf27e725be7554c92598b938fc8767ee2c71fdbc2fdc055ee8 M2Crypto-0.24.0.tar.gz
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 735ec81..3d0e54e 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_M2CRYPTO_VERSION = 0.23.0
+PYTHON_M2CRYPTO_VERSION = 0.24.0
 PYTHON_M2CRYPTO_SITE = http://pypi.python.org/packages/source/M/M2Crypto
 PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
