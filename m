From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jan 2021 13:41:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump version
 to 3.9.9
Message-ID: <20210117124147.2414576-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 package/python3-pycryptodomex/python3-pycryptodomex.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index df8d2a2f8d..1016672af8 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  4cede80c602d8814bbfb24a1cdc50dc8  pycryptodomex-3.9.8.tar.gz
-sha256  48cc2cfc251f04a6142badeb666d1ff49ca6fdfc303fd72579f62b768aaa52b9  pycryptodomex-3.9.8.tar.gz
+md5  08bc8fbbcd6060c06f1f10e2dc18b834  pycryptodomex-3.9.9.tar.gz
+sha256  7b5b7c5896f8172ea0beb283f7f9428e0ab88ec248ce0a5b8c98d73e26267d51  pycryptodomex-3.9.9.tar.gz
 # Locally computed sha256 checksums
 sha256  d1af3fab2ef8cc53b6c7f48bdeb178ac874b04faf4ba0159a96b6109f1d393e2  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 5123acb8ec..341d1fa0f5 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
-PYTHON_PYCRYPTODOMEX_VERSION = 3.9.8
+PYTHON_PYCRYPTODOMEX_VERSION = 3.9.9
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f5/79/9d9206688385d1e7a5ff925e7aab1d685636256e34a409037aa7adbbe611
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/14/90/f4a934bffae029e16fb33f3bd87014a0a18b4bec591249c4fc01a18d3ab6
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
index 92ac248d51..bd7602c9d4 100644
--- a/package/python3-pycryptodomex/python3-pycryptodomex.mk
+++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
-PYTHON3_PYCRYPTODOMEX_VERSION = 3.9.8
+PYTHON3_PYCRYPTODOMEX_VERSION = 3.9.9
 PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f5/79/9d9206688385d1e7a5ff925e7aab1d685636256e34a409037aa7adbbe611
+PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/14/90/f4a934bffae029e16fb33f3bd87014a0a18b4bec591249c4fc01a18d3ab6
 PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON3_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.29.2
