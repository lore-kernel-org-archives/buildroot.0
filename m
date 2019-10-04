From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:27 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to version
 1.3.8
In-Reply-To: <20191004183132.15564-1-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
Message-ID: <20191004183132.15564-21-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update the license file hash, since it was adjusted to fit
to the exact MIT formatting.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 9 +++++----
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 7884016321..a07e9228db 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/SQLAlchemy/json, sha256 locally computed
-md5    f1902c174981e363a7fbb9f6c8d932c6  SQLAlchemy-1.3.3.tar.gz
-sha256 91c54ca8345008fceaec987e10924bf07dcab36c442925357e5a467b36a38319  SQLAlchemy-1.3.3.tar.gz
-sha256 5536859eda1f40aa1e96d94d0c027ccd5eb6822f869fb76bca655f4b58742a6a  LICENSE
+# md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
+md5	2eb0a5a3da5054a9f8be4efacc4ffd95  SQLAlchemy-1.3.8.tar.gz
+sha256	2f8ff566a4d3a92246d367f2e9cd6ed3edeef670dcd6dda6dfdc9efed88bcd80  SQLAlchemy-1.3.8.tar.gz
+# Locally computed sha256 checksums
+sha256	0acffa15f3427e94014235e3c44376f6fe5df0ff461a93a9116eebcce74c056e  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index d304db20d3..75826fcb63 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 1.3.3
+PYTHON_SQLALCHEMY_VERSION = 1.3.8
 PYTHON_SQLALCHEMY_SOURCE = SQLAlchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/2b/b2/e6f5c5efc68942edefaa924e8fbea0b32375baa434a511cbf6bb17769cf6
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/fc/49/82d64d705ced344ba458197dadab30cfa745f9650ee22260ac2b275d288c
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.20.1
