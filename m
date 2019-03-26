From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 26 Mar 2019 22:08:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-uvloop: bump to version
 0.12.2
In-Reply-To: <20190326200844.15409-1-asafka7@gmail.com>
References: <20190326200844.15409-1-asafka7@gmail.com>
Message-ID: <20190326200844.15409-2-asafka7@gmail.com>
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
index 2eaa92d6db..8cf4a2c9d4 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5	9584c5e372755f752e47c2ff8419efe1  uvloop-0.11.3.tar.gz
-sha256	fd5042d0a2ea07b92d0e2190f7711feb91cde31cf2bf1829e2e8c4c0fdd1f1aa  uvloop-0.11.3.tar.gz
+md5	43d7986ac163267ab4d61eac950d34de  uvloop-0.12.2.tar.gz
+sha256	c48692bf4587ce281d641087658eca275a5ad3b63c78297bbded96570ae9ce8f  uvloop-0.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256	2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
 sha256	9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 037cca388b..58d6e4bb66 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.11.3
+PYTHON_UVLOOP_VERSION = 0.12.2
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/46/60/8e46188acba22369848d5e9bcbee3ca04b68a12d0598bd625c1a3994f5df
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/75/99/7a470e4950d8ecb1b561e8483716c414cd51b8ee193de8eb23506275f5a7
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.19.1
