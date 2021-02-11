From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 11 Feb 2021 17:20:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-uvloop: bump to version
 0.15.0
Message-ID: <20210211152039.255506-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 package/python-uvloop/python-uvloop.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 436babf915..baed0b3e58 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5	a2f82abb676756f11f544c6b51caf171  uvloop-0.14.0.tar.gz
-sha256	123ac9c0c7dd71464f58f1b4ee0bbd81285d96cdda8bc3519281b8973e3a461e  uvloop-0.14.0.tar.gz
+md5	c97447b8b386971be5e6f4328563be42  uvloop-0.15.0.tar.gz
+sha256	1a503d5b49da6e3dd5607d6e533a5315b1caedbf629901807c65a23a09cad065  uvloop-0.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256	2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
 sha256	9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 3ee8d299a3..ff98d747b2 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.14.0
+PYTHON_UVLOOP_VERSION = 0.15.0
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/84/2e/462e7a25b787d2b40cf6c9864a9e702f358349fc9cfb77e83c38acb73048
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/df/fb/0e1b479ac5502f3d4531a2fc3f046312616f1ad020c686da353c2ff3bbc6
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.27.0
