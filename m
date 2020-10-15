From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 13:49:12 +0200
Subject: [Buildroot] [git commit] package/python-multidict: bump to version
 5.0.0
Message-ID: <20201015113802.2DE377F930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=253184b00aa5431039004e374f8c007f477e48f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index cf48033f7c..a08a14a8a6 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  40b6ca77171ac8af55f7aa60049f3cdf  multidict-4.7.6.tar.gz
-sha256  fbb77a75e529021e7c4a8d4e823d88ef4d23674a202be4f5addffc72cbb91430  multidict-4.7.6.tar.gz
+md5  c2c3311e25636a6f213e998cd1e80d72  multidict-5.0.0.tar.gz
+sha256  1b324444299c3a49b601b1bf621fc21704e29066f6ac2b7d7e4034a4a18662a1  multidict-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 6284570ccb..1084fe0f6a 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 4.7.6
+PYTHON_MULTIDICT_VERSION = 5.0.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/65/d4/fabdcc5ee4451c8a8e177e27ddfd131a53a82ecc5a3b68468b7e9f8d70b4
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/d2/5a/e95b0f9ebacd42e094e229a9a0a9e44d02876abf64969d0cb07dadcf3c4a
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
