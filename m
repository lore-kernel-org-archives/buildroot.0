From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  5 Nov 2019 21:47:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-six: bump to version 1.13.0
Message-ID: <20191105194756.9213-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License changed due to a copyright year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-six/python-six.hash | 6 +++---
 package/python-six/python-six.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-six/python-six.hash b/package/python-six/python-six.hash
index b7262b12b1..fe9a455c05 100644
--- a/package/python-six/python-six.hash
+++ b/package/python-six/python-six.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/six/json
-md5	9ae5d1feed8c0215f4ae4adcd9207fcb  six-1.12.0.tar.gz
-sha256	d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73  six-1.12.0.tar.gz
+md5	e92c23c882c7d5564ce5773fe31b2771  six-1.13.0.tar.gz
+sha256	30f610279e8b2578cab6db20741130331735c781b56053c59c4076da27f06b66  six-1.13.0.tar.gz
 # Locally computed sha256 checksums
-sha256	e732f54da58f3e9cf0c48e8b512948936fcf7361bd58afa63a9a3c392bf794ad  LICENSE
+sha256	b7529b8c07171a78a8c36c3283905528e4812945d977d125eb926e8ccbf245b6  LICENSE
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 95817fa34b..906c268d74 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIX_VERSION = 1.12.0
+PYTHON_SIX_VERSION = 1.13.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
-PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca
+PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/94/3e/edcf6fef41d89187df7e38e868b2dd2182677922b600e880baad7749c865
 PYTHON_SIX_SETUP_TYPE = setuptools
 PYTHON_SIX_LICENSE = MIT
 PYTHON_SIX_LICENSE_FILES = LICENSE
-- 
2.20.1
