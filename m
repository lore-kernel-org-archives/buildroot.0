From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Mar 2020 10:03:51 +0100
Subject: [Buildroot] [git commit] package/python-setuptools-scm: bump to
 version 3.5.0
Message-ID: <20200327085224.95636810FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=803b63de56c7b115562d131270660367eefafeca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 6 +++---
 package/python-setuptools-scm/python-setuptools-scm.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 8208a9dc13..82dbf14356 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5	50b2199082fe808d032ec1710c9d7415  setuptools_scm-3.3.3.tar.gz
-sha256	bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5 setuptools_scm-3.3.3.tar.gz
+md5  86ec1eb9ec02ba018b097787e98897c5  setuptools_scm-3.5.0.tar.gz
+sha256  5bdf21a05792903cafe7ae0c9501182ab52497614fa6b1750d9dbae7b60c1a87  setuptools_scm-3.5.0.tar.gz
 # sha256 locally computed
-sha256 89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e LICENSE
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index dc9d28059f..c6d30e99e7 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 3.3.3
+PYTHON_SETUPTOOLS_SCM_VERSION = 3.5.0
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/83/44/53cad68ce686585d12222e6769682c4bdb9686808d2739671f9175e2938b
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/b2/f7/60a645aae001a2e06cf4b8db2fba9d9f36b8fd378f10647e3e218b61b74b
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
