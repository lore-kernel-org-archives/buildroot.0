From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:40:06 +0200
Subject: [Buildroot] [git commit] package/python-ecdsa: bump to version
 0.13.2
Message-ID: <20191005204258.635908103D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dab0de42da9fd5a9a93190c2ade93cf2e3a25c30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ecdsa/python-ecdsa.hash | 9 +++++----
 package/python-ecdsa/python-ecdsa.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
index b4bd70638d..62296de8cc 100644
--- a/package/python-ecdsa/python-ecdsa.hash
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/ecdsa/json
-md5	1f60eda9cb5c46722856db41a3ae6670  ecdsa-0.13.tar.gz
-# sha256 calculated by scanpypi
-sha256	64cf1ee26d1cde3c73c6d7d107f835fed7c6a2904aef9eac223d57ad800c43fa  ecdsa-0.13.tar.gz
+# md5, sha256 from https://pypi.org/pypi/ecdsa/json
+md5	0ce51d17c0751e5232be4eafd69b7f13  ecdsa-0.13.2.tar.gz
+sha256	5c034ffa23413ac923541ceb3ac14ec15a0d2530690413bff58c12b80e56d884  ecdsa-0.13.2.tar.gz
+# Locally computed sha256 checksums
+sha256	3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index 75b0634e14..3325f2b152 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ECDSA_VERSION = 0.13
+PYTHON_ECDSA_VERSION = 0.13.2
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://pypi.python.org/packages/source/e/ecdsa
+PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/51/76/139bf6e9b7b6684d5891212cdbd9e0739f2bfc03f380a1a6ffa700f392ac
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
