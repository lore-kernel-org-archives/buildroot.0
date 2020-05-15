From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 21:33:51 +0200
Subject: [Buildroot] [git commit branch/next] package/python-multidict: bump
 to version 4.7.6
Message-ID: <20200515191937.9606A918EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5440491d6ad54fcfec4a8d95aeaf2dfc33403b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 431a94247a..cf48033f7c 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  9a1ed2cc0cd3e5dd2e71921104f2b760  multidict-4.7.5.tar.gz
-sha256  aee283c49601fa4c13adc64c09c978838a7e812f85377ae130a24d7198c0331e  multidict-4.7.5.tar.gz
+md5  40b6ca77171ac8af55f7aa60049f3cdf  multidict-4.7.6.tar.gz
+sha256  fbb77a75e529021e7c4a8d4e823d88ef4d23674a202be4f5addffc72cbb91430  multidict-4.7.6.tar.gz
 # Locally computed sha256 checksums
 sha256  a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 2f80b1f851..6284570ccb 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 4.7.5
+PYTHON_MULTIDICT_VERSION = 4.7.6
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/61/b4/475114b3f1671da634f89239e61038f8742d9ac13aa34b32a05bf8022d22
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/65/d4/fabdcc5ee4451c8a8e177e27ddfd131a53a82ecc5a3b68468b7e9f8d70b4
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
