From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:08:21 +0200
Subject: [Buildroot] [git commit] package/python-pysocks: bump to version
 1.7.1
Message-ID: <20191002191223.0EBF08121B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bba2eb6f4ac9db4efbb9d037fa86c94e1c089108
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pysocks/python-pysocks.hash | 8 +++++---
 package/python-pysocks/python-pysocks.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pysocks/python-pysocks.hash b/package/python-pysocks/python-pysocks.hash
index 802bd37f01..dc61bfbc5c 100644
--- a/package/python-pysocks/python-pysocks.hash
+++ b/package/python-pysocks/python-pysocks.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pysocks/json, sha256 locally computed
-md5  07007ec7ed46292dab06013f2e3af365  PySocks-1.6.7.tar.gz
-sha256  d00329f27efa157db7efe3ca26fcd69033cd61f83822461ee3f8a353b48e33cf  PySocks-1.6.7.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pysocks/json
+md5	89b1a6865c61bae67a32417517612ee6  PySocks-1.7.1.tar.gz
+sha256	3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0  PySocks-1.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256	7027e214e014eb78b7adcc1ceda5aca713a79fc4f6a0c52c9da5b3e707e6ffe9  LICENSE
diff --git a/package/python-pysocks/python-pysocks.mk b/package/python-pysocks/python-pysocks.mk
index 163da761be..ccb70fc5db 100644
--- a/package/python-pysocks/python-pysocks.mk
+++ b/package/python-pysocks/python-pysocks.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSOCKS_VERSION = 1.6.7
+PYTHON_PYSOCKS_VERSION = 1.7.1
 PYTHON_PYSOCKS_SOURCE = PySocks-$(PYTHON_PYSOCKS_VERSION).tar.gz
-PYTHON_PYSOCKS_SITE = https://pypi.python.org/packages/7d/38/edca891ce16827a1de45cc347e4b6c22311eba25838b9825a5e6c48cf560
+PYTHON_PYSOCKS_SITE = https://files.pythonhosted.org/packages/bd/11/293dd436aea955d45fc4e8a35b6ae7270f5b8e00b53cf6c024c83b657a11
 PYTHON_PYSOCKS_LICENSE = BSD-3-Clause
 PYTHON_PYSOCKS_LICENSE_FILES = LICENSE
 PYTHON_PYSOCKS_SETUP_TYPE = setuptools
