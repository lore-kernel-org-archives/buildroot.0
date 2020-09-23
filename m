From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:56:55 +0200
Subject: [Buildroot] [git commit] package/python-sentry-sdk: bump version to
 0.17.3
Message-ID: <20200923204731.B2F588B8AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc27e7e1fc386662e338430b10d8c4f991c4965e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 6 +++---
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index a2c739e262..feade89f0a 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/sentry_sdk/json
-md5  21ec2fefe3561a12b4ee1efef3748400  sentry-sdk-0.14.4.tar.gz
-sha256  0e5e947d0f7a969314aa23669a94a9712be5a688ff069ff7b9fc36c66adc160c  sentry-sdk-0.14.4.tar.gz
+# md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
+md5  5d4abcc416cbd0b9443bf56588b02b55  sentry-sdk-0.17.3.tar.gz
+sha256  0af429c221670e602f960fca85ca3f607c85510a91f11e8be8f742a978127f78  sentry-sdk-0.17.3.tar.gz
 # Locally computed sha256 checksums
 sha256  59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 13495047b9..696c487005 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 0.14.4
+PYTHON_SENTRY_SDK_VERSION = 0.17.3
 PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/ab/67/b653a44ce124a2b700a7fc349ca129282c5fec4fdc9197f558178a9e32ae
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/64/7e/f1725d8649ef8f7d58cbec582157c454884238e59fef00b1707d555c7bea
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
