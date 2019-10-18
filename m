From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:10 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-secretstorage: bump to
 version 3.1.1
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-13-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License change: copyright year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-secretstorage/python-secretstorage.hash | 9 +++++----
 package/python-secretstorage/python-secretstorage.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-secretstorage/python-secretstorage.hash b/package/python-secretstorage/python-secretstorage.hash
index b45fb5719a..3f096a3965 100644
--- a/package/python-secretstorage/python-secretstorage.hash
+++ b/package/python-secretstorage/python-secretstorage.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/secretstorage/json, sha256 locally computed
-md5	3b9465831b069e2622973afb7deb7bc2  SecretStorage-2.3.1.tar.gz
-sha256	3af65c87765323e6f64c83575b05393f9e003431959c9395d1791d51497f29b6  SecretStorage-2.3.1.tar.gz
-sha256  1debb9ff5d6759fd23cdb40e3ba34b1fa68dd0b19672b6d154599fb0ab704c57  LICENSE
+# md5, sha256 from https://pypi.org/pypi/secretstorage/json
+md5	12ea3fc6640e857331eb80ed46a7da20  SecretStorage-3.1.1.tar.gz
+sha256	20c797ae48a4419f66f8d28fc221623f11fc45b6828f96bdb1ad9990acb59f92  SecretStorage-3.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  70f6bfca77633c35efa218328eda5486d7054c2914d61820980e378797520a25  LICENSE
diff --git a/package/python-secretstorage/python-secretstorage.mk b/package/python-secretstorage/python-secretstorage.mk
index b9776d6644..4a8b6ac903 100644
--- a/package/python-secretstorage/python-secretstorage.mk
+++ b/package/python-secretstorage/python-secretstorage.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SECRETSTORAGE_VERSION = 2.3.1
+PYTHON_SECRETSTORAGE_VERSION = 3.1.1
 PYTHON_SECRETSTORAGE_SOURCE = SecretStorage-$(PYTHON_SECRETSTORAGE_VERSION).tar.gz
-PYTHON_SECRETSTORAGE_SITE = https://pypi.python.org/packages/a5/a5/0830cfe34a4cfd0d1c3c8b614ede1edb2aaf999091ac8548dd19cb352e79
+PYTHON_SECRETSTORAGE_SITE = https://files.pythonhosted.org/packages/a6/89/df343dbc2957a317127e7ff2983230dc5336273be34f2e1911519d85aeb5
 PYTHON_SECRETSTORAGE_SETUP_TYPE = setuptools
 PYTHON_SECRETSTORAGE_LICENSE = BSD-3-Clause
 PYTHON_SECRETSTORAGE_LICENSE_FILES = LICENSE
-- 
2.20.1
