From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 30 Apr 2019 09:19:18 -0400
Subject: [Buildroot] [PATCH 10/11] package/python-sqlalchemy: bump to
 version .3.3
In-Reply-To: <20190430131919.130128-1-aduskett@gmail.com>
References: <20190430131919.130128-1-aduskett@gmail.com>
Message-ID: <20190430131919.130128-11-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also update hash for license file due to copyright year bump.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 6 +++---
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 9e13a2f20f..7884016321 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/SQLAlchemy/json, sha256 locally computed
-md5    968e07dc0aa92f9205bb3877f33f498f  SQLAlchemy-1.2.2.tar.gz
-sha256 64b4720f0a8e033db0154d3824f5bf677cf2797e11d44743cf0aebd2a0499d9d  SQLAlchemy-1.2.2.tar.gz
-sha256 73bda3d7d6c568f494c1d12520a97d41a38b7ce91d88c21f1b469b747b17f7fd  LICENSE
+md5    f1902c174981e363a7fbb9f6c8d932c6  SQLAlchemy-1.3.3.tar.gz
+sha256 91c54ca8345008fceaec987e10924bf07dcab36c442925357e5a467b36a38319  SQLAlchemy-1.3.3.tar.gz
+sha256 5536859eda1f40aa1e96d94d0c027ccd5eb6822f869fb76bca655f4b58742a6a  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index c0023712a2..d304db20d3 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 1.2.2
+PYTHON_SQLALCHEMY_VERSION = 1.3.3
 PYTHON_SQLALCHEMY_SOURCE = SQLAlchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://pypi.python.org/packages/b9/fb/a56d2fc0ce3571328fa872734ad124cae25a4cea422088987f865fb71787
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/2b/b2/e6f5c5efc68942edefaa924e8fbea0b32375baa434a511cbf6bb17769cf6
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.20.1
