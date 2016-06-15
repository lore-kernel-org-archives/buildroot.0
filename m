From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:18:54 +0200
Subject: [Buildroot] [git commit] python-autobahn: bump to version 0.14.1
Message-ID: <20160615201934.3D34681796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1addb8959a7993b3cc628ad60d946a971b427830
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-autobahn/python-autobahn.hash | 6 +++---
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 8f55ac1..1ee1e0e 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b4b5445050749c1033b9b58f694f0c64, sha256 locally computed.
-md5	b4b5445050749c1033b9b58f694f0c64  autobahn-0.12.1.tar.gz
-sha256	664223879e159c88221f42d8d1ac6b8c4268d8b9316d8ab69a02761c5744cd79  autobahn-0.12.1.tar.gz
+# md5 from https://pypi.python.org/pypi/autobahn/json, sha256 locally computed.
+md5	576b63ce7fa7846f64650263842b712b  autobahn-0.14.1.tar.gz
+sha256	c1695e139e36daeaad9cb788dd3f9b907a3fd83b67884424e59b3e07032956e0  autobahn-0.14.1.tar.gz
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 1d02867..2cc2e5d 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 0.12.1
+PYTHON_AUTOBAHN_VERSION = 0.14.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = http://pypi.python.org/packages/source/a/autobahn
+PYTHON_AUTOBAHN_SITE = https://pypi.python.org/packages/e3/37/1297551d3066ec9b013dd3a1a7e2cca85900d3fe95194779370e8e7a7af7
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
