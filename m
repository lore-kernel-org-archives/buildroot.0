From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:49 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pyelftools: bump to version
 0.25
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-23-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pyelftools/python-pyelftools.hash | 9 +++++----
 package/python-pyelftools/python-pyelftools.mk   | 6 +++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-pyelftools/python-pyelftools.hash b/package/python-pyelftools/python-pyelftools.hash
index e345a5bbf9..80900b711d 100644
--- a/package/python-pyelftools/python-pyelftools.hash
+++ b/package/python-pyelftools/python-pyelftools.hash
@@ -1,4 +1,5 @@
-# From https://pypi.python.org/packages/ba/78/d4a186a2e38731286c99dc3e3ca8123b6f55cf2e28608e8daf2d84b65494/pyelftools-0.24.tar.gz#md5=c960d5fe0a9308d96ba38b4beec8ac8e
-md5 c960d5fe0a9308d96ba38b4beec8ac8e pyelftools-0.24.tar.gz
-# Locally calculated
-sha256 e9dd97d685a5b96b88a988dabadb88e5a539b64cd7d7927fac9a7368dc4c459c pyelftools-0.24.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyelftools/json
+md5	c5629b9a5d19c82107a946cce52eeec2  pyelftools-0.25.tar.gz
+sha256	89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24  pyelftools-0.25.tar.gz
+# Locally computed sha256 checksums
+sha256	ae18bf4cb82f92af7547259177bc28bc48e4fc732518bcedfe690226288d3445  LICENSE
diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
index 92dafbe27f..21b9e409be 100644
--- a/package/python-pyelftools/python-pyelftools.mk
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYELFTOOLS_VERSION = 0.24
+PYTHON_PYELFTOOLS_VERSION = 0.25
 PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
-PYTHON_PYELFTOOLS_SITE = https://pypi.python.org/packages/ba/78/d4a186a2e38731286c99dc3e3ca8123b6f55cf2e28608e8daf2d84b65494
+PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/fa/9a/0674cb1725196568bdbca98304f2efb17368b57af1a4bb3fc772c026f474
 PYTHON_PYELFTOOLS_LICENSE = Public domain
 PYTHON_PYELFTOOLS_LICENSE_FILES = LICENSE
-PYTHON_PYELFTOOLS_SETUP_TYPE = distutils
+PYTHON_PYELFTOOLS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.20.1
