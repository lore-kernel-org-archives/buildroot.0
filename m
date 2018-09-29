From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 29 Sep 2018 11:14:52 +0300
Subject: [Buildroot] [PATCH 1/1] python-msgpack: bump to version 0.5.6
Message-ID: <20180929081452.25464-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-msgpack/python-msgpack.hash | 8 +++++---
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 48313ff547..74785837d8 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/msgpack-python/json, sha256 locally computed.
-md5	dcd854fb41ee7584ebbf35e049e6be98  msgpack-python-0.4.8.tar.gz
-sha256	1a2b19df0f03519ec7f19f826afb935b202d8979b0856c6fb3dc28955799f886  msgpack-python-0.4.8.tar.gz
+# md5, sha256 from https://pypi.org/pypi/msgpack-python/json
+md5	6d644c06a87a5a111bbbf5b34b4be440  msgpack-python-0.5.6.tar.gz
+sha256	378cc8a6d3545b532dfd149da715abae4fda2a3adb6d74e525d0d5e51f46909b  msgpack-python-0.5.6.tar.gz
+# Locally computed sha256
+sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 5be2b14bdf..e0544f5d33 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 0.4.8
+PYTHON_MSGPACK_VERSION = 0.5.6
 PYTHON_MSGPACK_SOURCE = msgpack-python-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://pypi.python.org/packages/21/27/8a1d82041c7a2a51fcc73675875a5f9ea06c2663e02fcfeb708be1d081a0
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/8a/20/6eca772d1a5830336f84aca1d8198e5a3f4715cd1c7fc36d3cc7f7185091
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-- 
2.17.1
