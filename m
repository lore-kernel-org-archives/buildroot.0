From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 11 Jan 2018 10:25:18 +0100
Subject: [Buildroot] [PATCH 3/5] python-txaio: bump to version 2.8.2
In-Reply-To: <20180111092520.28438-1-yegorslists@googlemail.com>
References: <20180111092520.28438-1-yegorslists@googlemail.com>
Message-ID: <20180111092520.28438-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-txaio/python-txaio.hash | 7 ++++---
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index f19014c5bb..6fb8e78ce2 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,3 +1,4 @@
-# md5 from https://pypi.python.org/pypi/txaio/json, sha256 locally computed.
-md5	643ac20b895b878786cd6a46790367d0  txaio-2.8.0.tar.gz
-sha256	8029d956591107ff9a2221d2a288fdd3718713a6991f59b97359d3d4f4b7b564  txaio-2.8.0.tar.gz
+# md5 from https://pypi.python.org/pypi/txaio/json, sha256 locally computed
+md5	a20e3431c95896a49fa3ffa84f77cde1  txaio-2.8.2.tar.gz
+sha256	484cd6c4cdd3f6081b87188f3b2b9a36e02fba6816e8256917c4f6571b567571  txaio-2.8.2.tar.gz
+sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index e0f5e28918..5e4d710135 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 2.8.0
+PYTHON_TXAIO_VERSION = 2.8.2
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://pypi.python.org/packages/03/86/2cb7ae81209cc3fc64f68a31d70c20ab4771b520d7e13a5219b1f5e16ee1
+PYTHON_TXAIO_SITE = https://pypi.python.org/packages/d6/95/d0c67304515f352342bc8fd14e5a3e7ca924134608acb730916073b18464
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = setuptools
-- 
2.11.0
