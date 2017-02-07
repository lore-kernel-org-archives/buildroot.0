From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  7 Feb 2017 12:48:09 +0100
Subject: [Buildroot] [PATCH 1/4] python-cbor: bump to version 1.0.0
Message-ID: <20170207114812.24632-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cbor/python-cbor.hash | 6 +++---
 package/python-cbor/python-cbor.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cbor/python-cbor.hash b/package/python-cbor/python-cbor.hash
index 6714348b5..a47607d9d 100644
--- a/package/python-cbor/python-cbor.hash
+++ b/package/python-cbor/python-cbor.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=711ee5ecc896595c1e95c1c48356606c, sha256 locally computed.
-md5	711ee5ecc896595c1e95c1c48356606c  cbor-0.1.25.tar.gz
-sha256	e342d425dde88bb93b741e34e3ba092492ba1f6fca94ce356054fb7daa420746  cbor-0.1.25.tar.gz
+# md5 from https://pypi.python.org/pypi/cbor/json, sha256 locally computed
+md5	22b03b59784fd78cb6c27aa498af0db6  cbor-1.0.0.tar.gz
+sha256	13225a262ddf5615cbd9fd55a76a0d53069d18b07d2e9f19c39e6acb8609bbb6  cbor-1.0.0.tar.gz
diff --git a/package/python-cbor/python-cbor.mk b/package/python-cbor/python-cbor.mk
index 4c3ce9dba..32ca4594d 100644
--- a/package/python-cbor/python-cbor.mk
+++ b/package/python-cbor/python-cbor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR_VERSION = 0.1.25
+PYTHON_CBOR_VERSION = 1.0.0
 PYTHON_CBOR_SOURCE = cbor-$(PYTHON_CBOR_VERSION).tar.gz
-PYTHON_CBOR_SITE = http://pypi.python.org/packages/source/c/cbor
+PYTHON_CBOR_SITE = https://pypi.python.org/packages/9b/99/01c6a987c920500189eb74a291bd3a388e6c7cf85736bb6b066d9833315e
 PYTHON_CBOR_LICENSE = Apache
 PYTHON_CBOR_SETUP_TYPE = setuptools
 
-- 
2.11.0
