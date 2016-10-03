From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Oct 2016 23:11:33 +0200
Subject: [Buildroot] [PATCH 13/28] package/python-ipaddress: bump version to
	1.0.17
In-Reply-To: <20161003211148.18603-1-bernd.kuhls@t-online.de>
References: <20161003211148.18603-1-bernd.kuhls@t-online.de>
Message-ID: <20161003211148.18603-13-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-ipaddress/python-ipaddress.hash | 6 +++---
 package/python-ipaddress/python-ipaddress.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-ipaddress/python-ipaddress.hash b/package/python-ipaddress/python-ipaddress.hash
index 21bc373..a7c3803 100644
--- a/package/python-ipaddress/python-ipaddress.hash
+++ b/package/python-ipaddress/python-ipaddress.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=12915e923b738107e47827478d553ba1, sha256 locally computed
-md5     12915e923b738107e47827478d553ba1  ipaddress-1.0.15.tar.gz
-sha256  af6c85cfc9cdb12b861655e6b9f2f59618bf3088cbde858727b2c0a98e9f6636  ipaddress-1.0.15.tar.gz
+# md5 from https://pypi.python.org/pypi/ipaddress/json, sha256 locally computed
+md5	8bbf0326719fafb1f453921ef96729fe  ipaddress-1.0.17.tar.gz
+sha256	3a21c5a15f433710aaa26f1ae174b615973a25182006ae7f9c26de151cd51716  ipaddress-1.0.17.tar.gz
diff --git a/package/python-ipaddress/python-ipaddress.mk b/package/python-ipaddress/python-ipaddress.mk
index 8019aa8..5ff70d4 100644
--- a/package/python-ipaddress/python-ipaddress.mk
+++ b/package/python-ipaddress/python-ipaddress.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_IPADDRESS_VERSION = 1.0.15
+PYTHON_IPADDRESS_VERSION = 1.0.17
 PYTHON_IPADDRESS_SOURCE = ipaddress-$(PYTHON_IPADDRESS_VERSION).tar.gz
-PYTHON_IPADDRESS_SITE = https://pypi.python.org/packages/source/i/ipaddress
+PYTHON_IPADDRESS_SITE = https://pypi.python.org/packages/bb/26/3b64955ff73f9e3155079b9ed31812afdfa5333b5c76387454d651ef593a
 PYTHON_IPADDRESS_LICENSE = Python software foundation license
+PYTHON_IPADDRESS_LICENSE_FILES = LICENSE
 PYTHON_IPADDRESS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.9.3
