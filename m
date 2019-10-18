From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:15 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to version
 1.3.10
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-18-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index a07e9228db..991293b5a9 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5	2eb0a5a3da5054a9f8be4efacc4ffd95  SQLAlchemy-1.3.8.tar.gz
-sha256	2f8ff566a4d3a92246d367f2e9cd6ed3edeef670dcd6dda6dfdc9efed88bcd80  SQLAlchemy-1.3.8.tar.gz
+md5	af9722657ba51131703dbe75f24b054a  SQLAlchemy-1.3.10.tar.gz
+sha256	0f0768b5db594517e1f5e1572c73d14cf295140756431270d89496dc13d5e46c  SQLAlchemy-1.3.10.tar.gz
 # Locally computed sha256 checksums
 sha256	0acffa15f3427e94014235e3c44376f6fe5df0ff461a93a9116eebcce74c056e  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 75826fcb63..3886e49765 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 1.3.8
+PYTHON_SQLALCHEMY_VERSION = 1.3.10
 PYTHON_SQLALCHEMY_SOURCE = SQLAlchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/fc/49/82d64d705ced344ba458197dadab30cfa745f9650ee22260ac2b275d288c
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/14/0e/487f7fc1e432cec50d2678f94e4133f2b9e9356e35bacc30d73e8cb831fc
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.20.1
