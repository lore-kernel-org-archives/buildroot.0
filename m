From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:41 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-ipy: bump to version 1.00
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-15-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-ipy/python-ipy.hash | 8 +++++---
 package/python-ipy/python-ipy.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-ipy/python-ipy.hash b/package/python-ipy/python-ipy.hash
index ed93448b1d..641a2eb21f 100644
--- a/package/python-ipy/python-ipy.hash
+++ b/package/python-ipy/python-ipy.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/ipy/json, sha256 locally computed
-md5	7b8c6eb4111b15aea31b67108e769712  IPy-0.83.tar.gz
-sha256	61da5a532b159b387176f6eabf11946e7458b6df8fb8b91ff1d345ca7a6edab8  IPy-0.83.tar.gz
+# md5, sha256 from https://pypi.org/pypi/ipy/json
+md5	1a90c68174234672241a7e60c7ea0fb9  IPy-1.00.tar.gz
+sha256	2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621  IPy-1.00.tar.gz
+# Locally computed sha256 checksums
+sha256	078bb46799e46e51e7239c24ff130d345db911c11efafef5e3c45dfb7adb0a61  COPYING
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index 2b2bdf2ddf..817b531e0b 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPY_VERSION = 0.83
+PYTHON_IPY_VERSION = 1.00
 PYTHON_IPY_SOURCE = IPy-$(PYTHON_IPY_VERSION).tar.gz
-PYTHON_IPY_SITE = https://pypi.python.org/packages/88/28/79162bfc351a3f1ab44d663ab3f03fb495806fdb592170990a1568ffbf63
+PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/e1/66/b6dd22472bb027556849876beae2dd4dca3a4eaf2dd3039277b4edb8c6af
 PYTHON_IPY_LICENSE = BSD-3-Clause
 PYTHON_IPY_LICENSE_FILES = COPYING
 PYTHON_IPY_SETUP_TYPE = distutils
-- 
2.20.1
