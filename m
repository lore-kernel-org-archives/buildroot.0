From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Feb 2019 22:47:38 +0100
Subject: [Buildroot] [git commit branch/next] package/python-sentry-sdk:
 bump to version 0.7.3
Message-ID: <20190218214549.09E1F8B7F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f287be9cfca8bb09c56e7661d861ed1df6283bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 34acf6ec14..44af302ae4 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5	78642322818c1ce47e80938fe1f40b5f  sentry-sdk-0.6.2.tar.gz
-sha256	56118f4c3bd3412e47d1969997580df2f27ae951df949d07f0c2120cefe40b00  sentry-sdk-0.6.2.tar.gz
+md5	3a5bd3a5d9bd1305d26a702b38134140  sentry-sdk-0.7.3.tar.gz
+sha256	6f4e264d0ad6267c40e20431a6a50f815515805ffe8eb9815340adf931279523  sentry-sdk-0.7.3.tar.gz
 # Locally computed sha256 checksums
 sha256	59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index ae218de1cf..c84b999e5c 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 0.6.2
+PYTHON_SENTRY_SDK_VERSION = 0.7.3
 PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/92/6f/b7b74d7635e220660c06897213fc6df894d291900c8e2710d72fb67528a7
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/9a/8d/e2af648ebb60cff433cdc80760bb45fe9cb7f32ccdff19c43c0d2e743968
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
