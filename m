From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:19:00 +0200
Subject: [Buildroot] [git commit branch/next] package/python-sentry-sdk:
 bump to version 0.14.4
Message-ID: <20200521130224.2CEF084890@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70eab17ee245a939041d8e058ca4cc8e81182e76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 8 ++++----
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index e9dc465592..a2c739e262 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5	1b22a7cb91e1f9b83acbd61709d5e71d  sentry-sdk-0.13.1.tar.gz
-sha256	f6e850f304382d87c5c52c01db8c0004d2ced6a0b073df2f2257168cf31b31aa  sentry-sdk-0.13.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/sentry_sdk/json
+md5  21ec2fefe3561a12b4ee1efef3748400  sentry-sdk-0.14.4.tar.gz
+sha256  0e5e947d0f7a969314aa23669a94a9712be5a688ff069ff7b9fc36c66adc160c  sentry-sdk-0.14.4.tar.gz
 # Locally computed sha256 checksums
-sha256	59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
+sha256  59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index dd47e7c0c3..13495047b9 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 0.13.1
+PYTHON_SENTRY_SDK_VERSION = 0.14.4
 PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/e2/5f/1f5881e98746c16464d46ae9d6ccdd6ce3c01c7e13093ea8a7d917642ee7
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/ab/67/b653a44ce124a2b700a7fc349ca129282c5fec4fdc9197f558178a9e32ae
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
