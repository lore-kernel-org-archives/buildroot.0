From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 24 Aug 2020 20:21:20 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-sh: bump to version 1.13.1
Message-ID: <20200824172120.183170-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-sh/python-sh.hash | 6 +++---
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index cc9ba214b8..fffdd20c15 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/sh/json
-md5 a8351aef25d25f707c17e0a7a6280251 sh-1.12.14.tar.gz
+# md5, sha256 from https://pypi.org/pypi/sh/json
+md5  7e3dd3a6b49c06db93746994a68cb8cf  sh-1.13.1.tar.gz
+sha256  97a3d2205e3c6a842d87ebbc9ae93acae5a352b1bc4609b428d0fd5bb9e286a3  sh-1.13.1.tar.gz
 # Locally computed
-sha256  b52bf5833ed01c7b5c5fb73a7f71b3d98d48e9b9b8764236237bdc7ecae850fc  sh-1.12.14.tar.gz
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index dfe80d5628..21c0fb3d77 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 1.12.14
+PYTHON_SH_VERSION = 1.13.1
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://pypi.python.org/packages/7c/71/199d27d3e7e78bf448bcecae0105a1d5b29173ffd2bbadaa95a74c156770
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/c9/3b/2c9a22bf1c48ced7ff3a11d4a862682c21d825c35f9d025811ad9808d263
 PYTHON_SH_SETUP_TYPE = setuptools
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
-- 
2.26.2
