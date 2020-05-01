From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  1 May 2020 15:19:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-parso: bump to version 0.7.0
Message-ID: <20200501131932.2478175-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-parso/python-parso.hash | 10 +++++-----
 package/python-parso/python-parso.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-parso/python-parso.hash b/package/python-parso/python-parso.hash
index e687c437c4..ab2e20943f 100644
--- a/package/python-parso/python-parso.hash
+++ b/package/python-parso/python-parso.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/parso/json
-md5	cfdc0d7ce446ac3984cd7ef3e5850354  parso-0.5.1.tar.gz
-sha256	666b0ee4a7a1220f65d367617f2cd3ffddff3e205f3f16a0284df30e774c2a9c  parso-0.5.1.tar.gz
+md5  d3a892fb4d9a0ffed838b0a3416145bf  parso-0.7.0.tar.gz
+sha256  908e9fae2144a076d72ae4e25539143d40b8e3eafbaeae03c1bfe226f4cdf12c  parso-0.7.0.tar.gz
 # Locally computed sha256 checksums
-sha256	fa67973073753d17624caf8684d5ee816d70c89d912c5bca7ca0f08e7b150edb  LICENSE.txt
-sha256	9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
-sha256	368780dd953e09148834e8d8c6cc1b09b3d621e77dbd1c4f5e8873561acda873  test/normalizer_issue_files/LICENSE
+sha256  fa67973073753d17624caf8684d5ee816d70c89d912c5bca7ca0f08e7b150edb  LICENSE.txt
+sha256  9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
+sha256  368780dd953e09148834e8d8c6cc1b09b3d621e77dbd1c4f5e8873561acda873  test/normalizer_issue_files/LICENSE
diff --git a/package/python-parso/python-parso.mk b/package/python-parso/python-parso.mk
index 28f699d641..a0b6af8732 100644
--- a/package/python-parso/python-parso.mk
+++ b/package/python-parso/python-parso.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARSO_VERSION = 0.5.1
+PYTHON_PARSO_VERSION = 0.7.0
 PYTHON_PARSO_SOURCE = parso-$(PYTHON_PARSO_VERSION).tar.gz
-PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/21/40/615957db4d178b7504c87b1a5b85fa5945b0b4fa5f5a845e31fc7aad6018
+PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/fe/24/c30eb4be8a24b965cfd6e2e6b41180131789b44042112a16f9eb10c80f6e
 PYTHON_PARSO_SETUP_TYPE = setuptools
 PYTHON_PARSO_LICENSE = MIT, Python-2.0, BSD-3-Clause (flask theme)
 PYTHON_PARSO_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE test/normalizer_issue_files/LICENSE
-- 
2.26.2
