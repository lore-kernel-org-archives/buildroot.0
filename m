From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:13 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-scm: bump to
 version 3.3.3
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-16-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 6 +++---
 package/python-setuptools-scm/python-setuptools-scm.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 774874bd58..8208a9dc13 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
-# sha256 from https://pypi.python.org/pypi/setuptools_scm/json
-sha256 52ab47715fa0fc7d8e6cd15168d1a69ba995feb1505131c3e814eb7087b57358 setuptools_scm-3.2.0.tar.gz
-
+# md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
+md5	50b2199082fe808d032ec1710c9d7415  setuptools_scm-3.3.3.tar.gz
+sha256	bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5 setuptools_scm-3.3.3.tar.gz
 # sha256 locally computed
 sha256 89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index e296dc6e4b..dc9d28059f 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 3.2.0
+PYTHON_SETUPTOOLS_SCM_VERSION = 3.3.3
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/54/85/514ba3ca2a022bddd68819f187ae826986051d130ec5b972076e4f58a9f3
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/83/44/53cad68ce686585d12222e6769682c4bdb9686808d2739671f9175e2938b
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
-- 
2.20.1
