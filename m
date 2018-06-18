From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jun 2018 10:38:50 +0200
Subject: [Buildroot] [PATCH] python-decorator: add license file and hash
Message-ID: <20180618083850.12114-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-decorator/python-decorator.hash | 2 ++
 package/python-decorator/python-decorator.mk   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/python-decorator/python-decorator.hash b/package/python-decorator/python-decorator.hash
index 293f1ca685..ca7fb88e7b 100644
--- a/package/python-decorator/python-decorator.hash
+++ b/package/python-decorator/python-decorator.hash
@@ -1,3 +1,5 @@
 # md5 from https://pypi.python.org/pypi/decorator/json, sha256 locally calculated
 md5 73644c8f0bd4983d1b6a34b49adec0ae decorator-4.0.11.tar.gz
 sha256 953d6bf082b100f43229cf547f4f97f97e970f5ad645ee7601d55ff87afdfe76 decorator-4.0.11.tar.gz
+# Locally computed sha256 checksums
+sha256 c9fbbd46d5af040b2b26db2f693034c95de8e9faaaf1cd68af358b092a56d454  LICENSE.txt
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index 3802f3dc16..67d9b8e719 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -8,6 +8,7 @@ PYTHON_DECORATOR_VERSION = 4.0.11
 PYTHON_DECORATOR_SITE = https://pypi.python.org/packages/cc/ac/5a16f1fc0506ff72fcc8fd4e858e3a1c231f224ab79bb7c4c9b2094cc570
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
+PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.11.0
