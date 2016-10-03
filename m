From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Oct 2016 23:11:22 +0200
Subject: [Buildroot] [PATCH 02/28] package/python-autobahn: bump version to
	0.16.0
In-Reply-To: <20161003211148.18603-1-bernd.kuhls@t-online.de>
References: <20161003211148.18603-1-bernd.kuhls@t-online.de>
Message-ID: <20161003211148.18603-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-autobahn/python-autobahn.hash | 6 +++---
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 1ee1e0e..cae9160 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/autobahn/json, sha256 locally computed.
-md5	576b63ce7fa7846f64650263842b712b  autobahn-0.14.1.tar.gz
-sha256	c1695e139e36daeaad9cb788dd3f9b907a3fd83b67884424e59b3e07032956e0  autobahn-0.14.1.tar.gz
+# md5 from https://pypi.python.org/pypi/autobahn/json, sha256 locally computed
+md5	9850702d0078c5a4aa17170afe2f233c  autobahn-0.16.0.tar.gz
+sha256	a1dcb4315a0914da56ec484659816de72dfad229be4ac19fa61bbc0111ada884  autobahn-0.16.0.tar.gz
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 2cc2e5d..a5e9aee 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 0.14.1
+PYTHON_AUTOBAHN_VERSION = 0.16.0
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://pypi.python.org/packages/e3/37/1297551d3066ec9b013dd3a1a7e2cca85900d3fe95194779370e8e7a7af7
+PYTHON_AUTOBAHN_SITE = https://pypi.python.org/packages/68/37/2523309412f0fb93a7784c65e5c5639b4b5d7a84f91374ad6c3c2d5af60b
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
-- 
2.9.3
