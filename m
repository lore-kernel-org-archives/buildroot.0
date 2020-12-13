From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 10:21:26 +0100
Subject: [Buildroot] [git commit] package/python-pyparsing: bump to version
 2.4.7
Message-ID: <20201213091419.5F8B4814A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26bd4c90629fb7259ca79ebc97582a5c1f8c76e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyparsing/python-pyparsing.hash | 8 ++++----
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index d1161e4f8f..2c52ff0843 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pyparsing/json, sha256 locally computed
-md5 46d02cbe0461fe0571d51649e6006ef5 pyparsing-2.4.2.tar.gz
-sha256 6f98a7b9397e206d78cc01df10131398f1c8b8510a2f4d97d9abd82e1aacdd80 pyparsing-2.4.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyparsing/json
+md5  f0953e47a0112f7a65aec2305ffdf7b4  pyparsing-2.4.7.tar.gz
+sha256  c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5f8ead507bc3246ecc1  pyparsing-2.4.7.tar.gz
 # Locally computed sha256 checksums
-sha256	10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
+sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index f419e00d40..0dacf2371d 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 2.4.2
+PYTHON_PYPARSING_VERSION = 2.4.7
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/7e/24/eaa8d7003aee23eda270099eeec754d7bf4399f75c6a011ef948304f66a2
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/c1/47/dfc9c342c9842bbe0036c7f763d2d6686bcf5eb1808ba3e170afdb282210
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = setuptools
