From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Mar 2017 17:24:32 +0100
Subject: [Buildroot] [PATCH] python-ubjson: bump version to 0.9.0
Message-ID: <20170327162432.44394-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/python-ubjson/python-ubjson.hash | 4 ++--
 package/python-ubjson/python-ubjson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ubjson/python-ubjson.hash b/package/python-ubjson/python-ubjson.hash
index 88c8c62..30f65fe 100644
--- a/package/python-ubjson/python-ubjson.hash
+++ b/package/python-ubjson/python-ubjson.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/py-ubjson/json, sha256 locally computed
-md5	09584b02508451a8133095c3b5f2bf41  py-ubjson-0.8.5.tar.gz
-sha256	e58e99753aaff3ed5d884989a6236bd98a4b0dfdb0e62f9753c20f485691fa9e  py-ubjson-0.8.5.tar.gz
+md5 c78bbe899eeba9604302ad746094e8d1  py-ubjson-0.9.0.tar.gz
+sha256 b405daaa82acdf5989207e1e5ff6865ef7d23bf450513a6d90a1ab64c75bdcf8  py-ubjson-0.9.0.tar.gz
diff --git a/package/python-ubjson/python-ubjson.mk b/package/python-ubjson/python-ubjson.mk
index e42b2dc..a192cfb 100644
--- a/package/python-ubjson/python-ubjson.mk
+++ b/package/python-ubjson/python-ubjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UBJSON_VERSION = 0.8.5
+PYTHON_UBJSON_VERSION = 0.9.0
 PYTHON_UBJSON_SOURCE = py-ubjson-$(PYTHON_UBJSON_VERSION).tar.gz
-PYTHON_UBJSON_SITE = https://pypi.python.org/packages/99/12/173cd417cacdacd158f947365bb17952a93b4e9d08f8a2f4b77d6c17cb4e
+PYTHON_UBJSON_SITE = https://pypi.python.org/packages/d4/40/a80006884ec03a54a5c6c53ae76df9978536862f0683b6e6280e3808d289
 PYTHON_UBJSON_LICENSE = Apache-2.0
 PYTHON_UBJSON_LICENSE_FILES = LICENSE
 PYTHON_UBJSON_SETUP_TYPE = setuptools
-- 
2.10.2
