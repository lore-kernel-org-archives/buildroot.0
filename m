From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 21:39:51 +0200
Subject: [Buildroot] [git commit] package/python-pycparser: bump to version
 2.20
Message-ID: <20200417192946.3BF828EEC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69fc88828518ae36ffeaf27b8b41f91fb2049f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycparser/python-pycparser.hash | 6 +++---
 package/python-pycparser/python-pycparser.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
index 6230f7cc83..0426444399 100644
--- a/package/python-pycparser/python-pycparser.hash
+++ b/package/python-pycparser/python-pycparser.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycparser/json
-md5	76396762adc3fa769c83d8e202d36b6f  pycparser-2.19.tar.gz
-sha256	a988718abfad80b6b157acce7bf130a30876d27603738ac39f140993246b25b3  pycparser-2.19.tar.gz
+md5  b8f88de737db8c346ee8d31c07c7a25a  pycparser-2.20.tar.gz
+sha256  2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0  pycparser-2.20.tar.gz
 # Locally computed sha256 checksums
-sha256	3c76629880aec2f8578ed914701a4ff9e5da8b60acb8b7ec675abf83c90c5168  LICENSE
+sha256  3c76629880aec2f8578ed914701a4ff9e5da8b60acb8b7ec675abf83c90c5168  LICENSE
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index c07edaaa25..8af37fce98 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCPARSER_VERSION = 2.19
+PYTHON_PYCPARSER_VERSION = 2.20
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/68/9e/49196946aee219aead1290e00d1e7fdeab8567783e83e1b9ab5585e6206a
+PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
