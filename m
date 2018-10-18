From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 18 Oct 2018 21:34:53 +0300
Subject: [Buildroot] [PATCH 1/1] python-certifi: bump to version 2018.10.15
Message-ID: <20181018183454.15543-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 2d339dd2d5..596475fc25 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5	f5d81d0048e84285611412b0dea0630a  certifi-2018.4.16.tar.gz
-sha256	13e698f54293db9f89122b0581843a782ad0934a4fe0172d2a980ba77fc61bb7  certifi-2018.4.16.tar.gz
+md5	3f4ca75a66bc65fea0693b8040f66d13  certifi-2018.10.15.tar.gz
+sha256	6d58c986d22b038c8c0df30d639f23a3e6d172a05c3583e766f4c0b785c0986a  certifi-2018.10.15.tar.gz
 # Locally computed sha256 checksums
 sha256	6a70a4bf6b010016d59a64b8ae4ad8dc7f5ef16f1fb453cc2ecd771c5a341131  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 716e6a3840..addb52fc11 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2018.4.16
+PYTHON_CERTIFI_VERSION = 2018.10.15
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/4d/9c/46e950a6f4d6b4be571ddcae21e7bc846fcbb88f1de3eff0f6dd0a6be55d
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/41/b6/4f0cefba47656583217acd6cd797bc2db1fede0d53090fdc28ad2c8e0716
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.17.1
