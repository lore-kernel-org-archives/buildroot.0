From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:45:47 +0100
Subject: [Buildroot] [git commit] package/python-sentry-sdk: bump to version
 0.13.1
Message-ID: <20191028224426.B12008B90C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b8473eec5c56c1f3a67584449498a54de637175
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 79759b0ac1..e9dc465592 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5	6851b91d8e55e87d4bf9dd6aecffa5d3  sentry-sdk-0.13.0.tar.gz
-sha256	ff14935cc3053de0650128f124c36f34a4be120b8cc522c149f5cba342c1fd05  sentry-sdk-0.13.0.tar.gz
+md5	1b22a7cb91e1f9b83acbd61709d5e71d  sentry-sdk-0.13.1.tar.gz
+sha256	f6e850f304382d87c5c52c01db8c0004d2ced6a0b073df2f2257168cf31b31aa  sentry-sdk-0.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256	59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index a1a1623edf..dd47e7c0c3 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 0.13.0
+PYTHON_SENTRY_SDK_VERSION = 0.13.1
 PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/b3/c7/e00a892215ffe68d9d1efea5cf497e5a55e393f34e6be1c693f043bb8c5d
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/e2/5f/1f5881e98746c16464d46ae9d6ccdd6ce3c01c7e13093ea8a7d917642ee7
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
