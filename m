From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 11:41:53 +0200
Subject: [Buildroot] [git commit] package/python-packaging: bump to version
 20.4
Message-ID: <20200923093224.906258D6B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c20a80d832b1e0a07c8eab6425cb05f3d2efe71e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index 112bc695f6..aafb16c1b0 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  19e0d1f82a9007b448650ccfeffd0a26  packaging-20.3.tar.gz
-sha256  3c292b474fda1671ec57d46d739d072bfd495a4f51ad01a055121d81e952b7a3  packaging-20.3.tar.gz
+md5  3208229da731c5d8e29d4d8941e75005  packaging-20.4.tar.gz
+sha256  4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d556079f8  packaging-20.4.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index bd5177e8e5..62a9d68cbb 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 20.3
+PYTHON_PACKAGING_VERSION = 20.4
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/65/37/83e3f492eb52d771e2820e88105f605335553fe10422cba9d256faeb1702
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/55/fd/fc1aca9cf51ed2f2c11748fa797370027babd82f87829c7a8e6dbe720145
 PYTHON_PACKAGING_SETUP_TYPE = setuptools
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
