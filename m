From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 22 Dec 2018 20:02:20 +0200
Subject: [Buildroot] [PATCH 1/1] python-six: bump to version 1.12.0
Message-ID: <20181222180220.23744-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE update - year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-six/python-six.hash | 9 +++++----
 package/python-six/python-six.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-six/python-six.hash b/package/python-six/python-six.hash
index f9dbf09eaa..b7262b12b1 100644
--- a/package/python-six/python-six.hash
+++ b/package/python-six/python-six.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/six/json, sha256 locally computed
-md5	d12789f9baf7e9fb2524c0c64f1773f8  six-1.11.0.tar.gz
-sha256	70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9  six-1.11.0.tar.gz
-sha256  63478682e84e8c98f4c46308995f1f521a6886976e25421827d2a2be03581328  LICENSE
+# md5, sha256 from https://pypi.org/pypi/six/json
+md5	9ae5d1feed8c0215f4ae4adcd9207fcb  six-1.12.0.tar.gz
+sha256	d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73  six-1.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256	e732f54da58f3e9cf0c48e8b512948936fcf7361bd58afa63a9a3c392bf794ad  LICENSE
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index cd80634233..95817fa34b 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIX_VERSION = 1.11.0
+PYTHON_SIX_VERSION = 1.12.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
-PYTHON_SIX_SITE = https://pypi.python.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe
+PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca
 PYTHON_SIX_SETUP_TYPE = setuptools
 PYTHON_SIX_LICENSE = MIT
 PYTHON_SIX_LICENSE_FILES = LICENSE
-- 
2.19.1
