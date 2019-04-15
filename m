From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 15 Apr 2019 16:08:08 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 0.7.10
Message-ID: <20190415230808.21013-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 6 +++---
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 44af302ae4..9f57e0e70e 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5	3a5bd3a5d9bd1305d26a702b38134140  sentry-sdk-0.7.3.tar.gz
-sha256	6f4e264d0ad6267c40e20431a6a50f815515805ffe8eb9815340adf931279523  sentry-sdk-0.7.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/sentry_sdk/json
+md5	3380bb835596517261c4f0f6d6851e36  sentry-sdk-0.7.10.tar.gz
+sha256	ca2723556c102a1fabdf461b9a038d1d8631608c4d10085a7c06a0b590e79ad4  sentry-sdk-0.7.10.tar.gz
 # Locally computed sha256 checksums
 sha256	59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index c84b999e5c..7e4c9b169e 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 0.7.3
+PYTHON_SENTRY_SDK_VERSION = 0.7.10
 PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/9a/8d/e2af648ebb60cff433cdc80760bb45fe9cb7f32ccdff19c43c0d2e743968
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/22/82/81445c38c82511d7bc4187669f04de74fde05c1dff0705f362cf1af3c4f0
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.21.0
