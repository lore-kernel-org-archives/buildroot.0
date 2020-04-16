From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 16 Apr 2020 05:22:55 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-secretstorage: bump to
 version 3.1.2
Message-ID: <20200416112255.124329-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-secretstorage/python-secretstorage.hash | 4 ++--
 package/python-secretstorage/python-secretstorage.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-secretstorage/python-secretstorage.hash b/package/python-secretstorage/python-secretstorage.hash
index 3f096a3965..a8e535f892 100644
--- a/package/python-secretstorage/python-secretstorage.hash
+++ b/package/python-secretstorage/python-secretstorage.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/secretstorage/json
-md5	12ea3fc6640e857331eb80ed46a7da20  SecretStorage-3.1.1.tar.gz
-sha256	20c797ae48a4419f66f8d28fc221623f11fc45b6828f96bdb1ad9990acb59f92  SecretStorage-3.1.1.tar.gz
+md5  c2a8c0e08e5da198fc38c379b98c28f1  SecretStorage-3.1.2.tar.gz
+sha256  15da8a989b65498e29be338b3b279965f1b8f09b9668bd8010da183024c8bff6  SecretStorage-3.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  70f6bfca77633c35efa218328eda5486d7054c2914d61820980e378797520a25  LICENSE
diff --git a/package/python-secretstorage/python-secretstorage.mk b/package/python-secretstorage/python-secretstorage.mk
index 4a8b6ac903..4c209bf513 100644
--- a/package/python-secretstorage/python-secretstorage.mk
+++ b/package/python-secretstorage/python-secretstorage.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SECRETSTORAGE_VERSION = 3.1.1
+PYTHON_SECRETSTORAGE_VERSION = 3.1.2
 PYTHON_SECRETSTORAGE_SOURCE = SecretStorage-$(PYTHON_SECRETSTORAGE_VERSION).tar.gz
-PYTHON_SECRETSTORAGE_SITE = https://files.pythonhosted.org/packages/a6/89/df343dbc2957a317127e7ff2983230dc5336273be34f2e1911519d85aeb5
+PYTHON_SECRETSTORAGE_SITE = https://files.pythonhosted.org/packages/fd/9f/36197c75d9a09b1ab63f56cb985af6cd858ca3fc41fd9cd890ce69bae5b9
 PYTHON_SECRETSTORAGE_SETUP_TYPE = setuptools
 PYTHON_SECRETSTORAGE_LICENSE = BSD-3-Clause
 PYTHON_SECRETSTORAGE_LICENSE_FILES = LICENSE
-- 
2.20.1
