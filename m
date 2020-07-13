From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Jul 2020 19:06:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-backcall: bump to version
 0.2.0
Message-ID: <20200713170625.1564386-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update indentation in hash file (two spaces)
- Add license file and its hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-backcall/python-backcall.hash | 6 ++++--
 package/python-backcall/python-backcall.mk   | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-backcall/python-backcall.hash b/package/python-backcall/python-backcall.hash
index 2eccbdef5d..063b4bed27 100644
--- a/package/python-backcall/python-backcall.hash
+++ b/package/python-backcall/python-backcall.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/backcall/json
-md5	87ce0c7839808e6a3427d57df6a792e7  backcall-0.1.0.tar.gz
-sha256	38ecd85be2c1e78f77fd91700c76e14667dc21e2713b63876c0eb901196e01e4  backcall-0.1.0.tar.gz
+md5  1f4c9a370c78743406296f48e56e8821  backcall-0.2.0.tar.gz
+sha256  5cbdbf27be5e7cfadb448baf0aa95508f91f2bbc6c6437cd9cd06e2a4c215e1e  backcall-0.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  d422f8ce77312733c07f5fec8ccbe61d58d539774f7a66f37e4bc54740d86020  LICENSE
diff --git a/package/python-backcall/python-backcall.mk b/package/python-backcall/python-backcall.mk
index 3f95ea3d24..2ead3421a8 100644
--- a/package/python-backcall/python-backcall.mk
+++ b/package/python-backcall/python-backcall.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_BACKCALL_VERSION = 0.1.0
+PYTHON_BACKCALL_VERSION = 0.2.0
 PYTHON_BACKCALL_SOURCE = backcall-$(PYTHON_BACKCALL_VERSION).tar.gz
-PYTHON_BACKCALL_SITE = https://files.pythonhosted.org/packages/84/71/c8ca4f5bb1e08401b916c68003acf0a0655df935d74d93bf3f3364b310e0
+PYTHON_BACKCALL_SITE = https://files.pythonhosted.org/packages/a2/40/764a663805d84deee23043e1426a9175567db89c8b3287b5c2ad9f71aa93
 PYTHON_BACKCALL_SETUP_TYPE = distutils
-# From https://github.com/takluyver/backcall/blob/master/LICENSE
 PYTHON_BACKCALL_LICENSE = BSD-3-Clause
+PYTHON_BACKCALL_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.27.0
