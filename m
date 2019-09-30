From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:53 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-scapy: bump to version 2.4.3
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-27-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use LICENSE as license file instead of PKG-INFO

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-scapy/python-scapy.hash | 6 +++---
 package/python-scapy/python-scapy.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
index 4d8001b752..df7eeb8eab 100644
--- a/package/python-scapy/python-scapy.hash
+++ b/package/python-scapy/python-scapy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scapy/json
-md5	d7d3c4294f5a718e234775d38dbeb7ec  scapy-2.4.0.tar.gz
-sha256	452f714f5c2eac6fd0a6146b1dbddfc24dd5f4103f3ed76227995a488cfb2b73  scapy-2.4.0.tar.gz
+md5	469ae6f5615799a5de3f3b4eb217b18d  scapy-2.4.3.tar.gz
+sha256	e2f8d11f6a941c14a789ae8b236b27bd634681f1b29b5e893861e284d234f6b0  scapy-2.4.3.tar.gz
 # Locally computed sha256 checksums
-sha256	7a49a7fdaf7b648e451dd01e4875cf4dbfa556c6359c6b97feed5047540ea989  PKG-INFO
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index c44b2cb2e5..f6cf2a07b3 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SCAPY_VERSION = 2.4.0
+PYTHON_SCAPY_VERSION = 2.4.3
 PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
-PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/68/01/b9943984447e7ea6f8948e90c1729b78161c2bb3eef908430638ec3f7296
+PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/52/e7/464079606a9cf97ad04936c52a5324d14dae36215f9319bf3faa46a7907d
+PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
-PYTHON_SCAPY_LICENSE_FILES = PKG-INFO
-PYTHON_SCAPY_SETUP_TYPE = distutils
+PYTHON_SCAPY_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.20.1
