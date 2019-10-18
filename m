From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:11 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 0.13.0
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-14-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 6 +++---
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 9f57e0e70e..79759b0ac1 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/sentry_sdk/json
-md5	3380bb835596517261c4f0f6d6851e36  sentry-sdk-0.7.10.tar.gz
-sha256	ca2723556c102a1fabdf461b9a038d1d8631608c4d10085a7c06a0b590e79ad4  sentry-sdk-0.7.10.tar.gz
+# md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
+md5	6851b91d8e55e87d4bf9dd6aecffa5d3  sentry-sdk-0.13.0.tar.gz
+sha256	ff14935cc3053de0650128f124c36f34a4be120b8cc522c149f5cba342c1fd05  sentry-sdk-0.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256	59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 7e4c9b169e..a1a1623edf 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 0.7.10
+PYTHON_SENTRY_SDK_VERSION = 0.13.0
 PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/22/82/81445c38c82511d7bc4187669f04de74fde05c1dff0705f362cf1af3c4f0
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/b3/c7/e00a892215ffe68d9d1efea5cf497e5a55e393f34e6be1c693f043bb8c5d
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.20.1
