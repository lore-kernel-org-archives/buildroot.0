From: Mauro Condarelli <mc5686@mclink.it>
Date: Tue,  2 Feb 2016 01:44:56 +0100
Subject: [Buildroot] [PATCH 16/19] python-msgpack: bump to 0.4.7
In-Reply-To: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454373899-22481-17-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/python-msgpack/Config.in           | 1 -
 package/python-msgpack/python-msgpack.hash | 3 +++
 package/python-msgpack/python-msgpack.mk   | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/python-msgpack/python-msgpack.hash

diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
index ed0b432..e740835 100644
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_MSGPACK
 	bool "python-msgpack"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_MSGPACK
 	depends on BR2_INSTALL_LIBSTDCPP # msgpack
 	depends on BR2_ARCH_HAS_ATOMICS # msgpack
diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
new file mode 100644
index 0000000..636aa90
--- /dev/null
+++ b/package/python-msgpack/python-msgpack.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=eb2aad1081534ef3a9f32a0ecd350b9b, sha356 locally computed.
+md5	eb2aad1081534ef3a9f32a0ecd350b9b  msgpack-python-0.4.7.tar.gz
+sha256	5e001229a54180a02dcdd59db23c9978351af55b1290c27bc549e381f43acd6b  msgpack-python-0.4.7.tar.gz
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index adf78b2..344b7bf 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 0.4.0
+PYTHON_MSGPACK_VERSION = 0.4.7
 PYTHON_MSGPACK_SOURCE = msgpack-python-$(PYTHON_MSGPACK_VERSION).tar.gz
 PYTHON_MSGPACK_SITE = https://pypi.python.org/packages/source/m/msgpack-python
 PYTHON_MSGPACK_LICENSE = Apache-2.0
-- 
2.1.4
