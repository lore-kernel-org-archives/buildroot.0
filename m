From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:00 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-ipaddress: bump to version
 1.0.23
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-ipaddress/python-ipaddress.hash | 4 ++--
 package/python-ipaddress/python-ipaddress.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipaddress/python-ipaddress.hash b/package/python-ipaddress/python-ipaddress.hash
index 5a3e674fa7..e61835e192 100644
--- a/package/python-ipaddress/python-ipaddress.hash
+++ b/package/python-ipaddress/python-ipaddress.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ipaddress/json
-md5	74c1ce3109f30eaa1ab3dd342e7b76d4  ipaddress-1.0.22.tar.gz
-sha256	b146c751ea45cad6188dd6cf2d9b757f6f4f8d6ffb96a023e6f2e26eea02a72c  ipaddress-1.0.22.tar.gz
+md5	aaee67a8026782af1831148beb0d9060  ipaddress-1.0.23.tar.gz
+sha256	b7f8e0369580bb4a24d5ba1d7cc29660a4a6987763faf1d8a8046830e020e7e2  ipaddress-1.0.23.tar.gz
 # Locally computed sha256 checksums
 sha256	38675419eb4a79ec616396d70f1254b3a433fb7088fb3f4cc9b6c0bcdcec6162  LICENSE
diff --git a/package/python-ipaddress/python-ipaddress.mk b/package/python-ipaddress/python-ipaddress.mk
index 189efdfb1f..8f1ad5ffc7 100644
--- a/package/python-ipaddress/python-ipaddress.mk
+++ b/package/python-ipaddress/python-ipaddress.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPADDRESS_VERSION = 1.0.22
+PYTHON_IPADDRESS_VERSION = 1.0.23
 PYTHON_IPADDRESS_SOURCE = ipaddress-$(PYTHON_IPADDRESS_VERSION).tar.gz
-PYTHON_IPADDRESS_SITE = https://files.pythonhosted.org/packages/97/8d/77b8cedcfbf93676148518036c6b1ce7f8e14bf07e95d7fd4ddcb8cc052f
+PYTHON_IPADDRESS_SITE = https://files.pythonhosted.org/packages/b9/9a/3e9da40ea28b8210dd6504d3fe9fe7e013b62bf45902b458d1cdc3c34ed9
 PYTHON_IPADDRESS_LICENSE = Python-2.0
 PYTHON_IPADDRESS_LICENSE_FILES = LICENSE
 PYTHON_IPADDRESS_SETUP_TYPE = setuptools
-- 
2.20.1
