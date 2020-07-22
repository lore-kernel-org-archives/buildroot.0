From: Dick Olsson <hi@senzilla.io>
Date: Wed, 22 Jul 2020 07:11:08 +0000
Subject: [Buildroot] [PATCH v2 1/4] package/python-pycryptodomex: bump to
 version 3.9.8
In-Reply-To: <20200722071030.16128-1-hi@senzilla.io>
References: <20200722071030.16128-1-hi@senzilla.io>
Message-ID: <20200722071030.16128-2-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://www.pycryptodome.org/en/latest/src/changelog.html#june-2020

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 +---
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 2f2ca3ca7f..abffd19f4e 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5	c55b52fc81cbf795fb7c302b0cc19b9f  pycryptodomex-3.9.6.tar.gz
-sha256	c021b66f5b3c4ea0c45422ec3241bfea4a16651e1ee5459a136639d0716ccb3c  pycryptodomex-3.9.6.tar.gz
 # Locally computed sha256 checksums
 sha256	d1af3fab2ef8cc53b6c7f48bdeb178ac874b04faf4ba0159a96b6109f1d393e2  LICENSE.rst
 sha256	8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
+sha256  48cc2cfc251f04a6142badeb666d1ff49ca6fdfc303fd72579f62b768aaa52b9  pycryptodomex-3.9.8.tar.gz
\ No newline at end of file
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 1459bb8fc3..7f93d93131 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.9.6
+PYTHON_PYCRYPTODOMEX_VERSION = 3.9.8
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/d7/4f/20258a48e6760cff6523a176ecec671c85cad3f199754a8b89728d130aa8
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f5/79/9d9206688385d1e7a5ff925e7aab1d685636256e34a409037aa7adbbe611
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.20.1
