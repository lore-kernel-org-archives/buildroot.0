From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 22 Jan 2018 12:20:53 -0800
Subject: [Buildroot] [PATCH 1/1] python-raven: bump to version 6.5.0
Message-ID: <20180122202053.3956-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/python-raven/python-raven.hash | 4 ++--
 package/python-raven/python-raven.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-raven/python-raven.hash b/package/python-raven/python-raven.hash
index 3ed123996d..66452a7fc1 100644
--- a/package/python-raven/python-raven.hash
+++ b/package/python-raven/python-raven.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/raven/json, sha256 locally computed
-md5	2efce7acbabe1a0f32d168736a654789  raven-6.3.0.tar.gz
-sha256	f3e465a545dcdb6a387d1fcb199d08f786ba3732d7ce6aa681718b04da6aedf1  raven-6.3.0.tar.gz
+md5	4471e9e881da64f057ee7740345a6b27  raven-6.5.0.tar.gz
+sha256	84da75114739191bdf2388f296ffd6177e83567a7fbaf2701e034ad6026e4f3b  raven-6.5.0.tar.gz
 # License file, locally calculated
 sha256	5ce9459bc19ced99cc9eb135d4f559ed01e336354bdf16dd998be85aa688c233  LICENSE
diff --git a/package/python-raven/python-raven.mk b/package/python-raven/python-raven.mk
index c17aac4a3d..4a4cdee353 100644
--- a/package/python-raven/python-raven.mk
+++ b/package/python-raven/python-raven.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RAVEN_VERSION = 6.3.0
+PYTHON_RAVEN_VERSION = 6.5.0
 PYTHON_RAVEN_SOURCE = raven-$(PYTHON_RAVEN_VERSION).tar.gz
-PYTHON_RAVEN_SITE = https://pypi.python.org/packages/e8/b0/27886f69cdb4d9f6265bba1c4973bb5371b060272a5795c511d8839a6028
+PYTHON_RAVEN_SITE = https://pypi.python.org/packages/e0/26/1bdd4431f59ff92fee7f2378b7d54eb175eb69f68c40c6c9b15161f6774f
 PYTHON_RAVEN_SETUP_TYPE = setuptools
 PYTHON_RAVEN_LICENSE = BSD-3-Clause
 PYTHON_RAVEN_LICENSE_FILES = LICENSE
-- 
2.16.0
