From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:33:01 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-yieldfrom: bump to version
 1.0.4
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-35-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE was added to the package, so we can use it instead
of PKG-INFO.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-yieldfrom/python-yieldfrom.hash | 9 +++++----
 package/python-yieldfrom/python-yieldfrom.mk   | 6 +++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-yieldfrom/python-yieldfrom.hash b/package/python-yieldfrom/python-yieldfrom.hash
index 2df8085327..ec7f58e007 100644
--- a/package/python-yieldfrom/python-yieldfrom.hash
+++ b/package/python-yieldfrom/python-yieldfrom.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/yieldfrom/json, sha256 locally computed
-md5	1a1c6fd152032d49ccd4ac250aad7746  yieldfrom-1.0.3.tar.gz
-sha256	388004d0ee8854c2ed7a2c87e664aad13acd70c9b33d7f3c441182d37357739b  yieldfrom-1.0.3.tar.gz
-sha256	3695faeb17a2507f445b7e0a454043671f646591795477ced20e29de2359d666  PKG-INFO
+# md5, sha256 from https://pypi.org/pypi/yieldfrom/json
+md5	98182ff0e861458e9e3dfaa0d47a47af  yieldfrom-1.0.4.tar.gz
+sha256	09c4e32402ec1c098e66ef5e25e036134f0e84f72ff5817641728707a168f5b3  yieldfrom-1.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256	b3092d61cce29e25f3799285495095d220e5e015b88c1c70e1e72dae052f21e8  LICENSE
diff --git a/package/python-yieldfrom/python-yieldfrom.mk b/package/python-yieldfrom/python-yieldfrom.mk
index b1137cdbb4..2576a8ced3 100644
--- a/package/python-yieldfrom/python-yieldfrom.mk
+++ b/package/python-yieldfrom/python-yieldfrom.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_YIELDFROM_VERSION = 1.0.3
+PYTHON_YIELDFROM_VERSION = 1.0.4
 PYTHON_YIELDFROM_SOURCE = yieldfrom-$(PYTHON_YIELDFROM_VERSION).tar.gz
-PYTHON_YIELDFROM_SITE = https://pypi.python.org/packages/de/2d/05524f368e691846824d962b64f983e3fde9b8c10839e7efbc1b51d42de3
+PYTHON_YIELDFROM_SITE = https://files.pythonhosted.org/packages/6e/d2/dc48e4cc6bbe48afd022da745f981cf0437ab7e658de9078bf56747b1d73
 PYTHON_YIELDFROM_SETUP_TYPE = setuptools
 PYTHON_YIELDFROM_LICENSE = MIT
-PYTHON_YIELDFROM_LICENSE_FILES = PKG-INFO
+PYTHON_YIELDFROM_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.20.1
