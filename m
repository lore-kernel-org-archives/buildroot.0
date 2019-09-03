From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:36 -0000
Subject: [Buildroot] [git commit] package/python-uvloop: bump to version
 0.13.0
Message-ID: <20190903133620.265DD81413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43d6d92f5b64d7891bfd3aebe54eb42af9864114
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 package/python-uvloop/python-uvloop.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 8cf4a2c9d4..3c274097fe 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5	43d7986ac163267ab4d61eac950d34de  uvloop-0.12.2.tar.gz
-sha256	c48692bf4587ce281d641087658eca275a5ad3b63c78297bbded96570ae9ce8f  uvloop-0.12.2.tar.gz
+md5	11c84a0a62048200a70272ec9a990ff9  uvloop-0.13.0.tar.gz
+sha256	942cd07035510b149d6160796f4e972137130ae953871b6a98c2cf5d5ab68c2e  uvloop-0.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256	2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
 sha256	9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 58d6e4bb66..d9932b931d 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.12.2
+PYTHON_UVLOOP_VERSION = 0.13.0
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/75/99/7a470e4950d8ecb1b561e8483716c414cd51b8ee193de8eb23506275f5a7
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/e3/15/dc3276384f4363015d7c72282f37066bae26c77f99158f66c9058ac167cf
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
