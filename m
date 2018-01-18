From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 18 Jan 2018 15:31:00 +0100
Subject: [Buildroot] [PATCH] python-cssselect: bump to version 1.0.3
Message-ID: <1516285860-29712-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cssselect/python-cssselect.hash | 5 +++--
 package/python-cssselect/python-cssselect.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
index 4825950..dd05beb 100644
--- a/package/python-cssselect/python-cssselect.hash
+++ b/package/python-cssselect/python-cssselect.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/cssselect/json, sha256 locally computed
-md5 3fa03bf82a9f0b1223c0f1eb1369e139 cssselect-1.0.1.tar.gz
-sha256 73db1c054b9348409e2862fc6c0dde5c4e4fbe4da64c5c5a9e05fbea45744077 cssselect-1.0.1.tar.gz
+md5	50422c9ec04b74cd60c571f74ddc1a80  cssselect-1.0.3.tar.gz
+sha256	066d8bc5229af09617e24b3ca4d52f1f9092d9e061931f4184cd572885c23204  cssselect-1.0.3.tar.gz
+sha256  5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index 7136a52..4ecc07a 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT_VERSION = 1.0.1
+PYTHON_CSSSELECT_VERSION = 1.0.3
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
-PYTHON_CSSSELECT_SITE = https://pypi.python.org/packages/77/ff/9c865275cd19290feba56344eba570e719efb7ca5b34d67ed12b22ebbb0d
+PYTHON_CSSSELECT_SITE = https://pypi.python.org/packages/52/ea/f31e1d2e9eb130fda2a631e22eac369dc644e8807345fbed5113f2d6f92b
 PYTHON_CSSSELECT_SETUP_TYPE = setuptools
 PYTHON_CSSSELECT_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
-- 
2.1.4
