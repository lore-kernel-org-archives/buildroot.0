From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:00:48 +0200
Subject: [Buildroot] [git commit] package/python-setuptools-scm: bump to
 version 3.2.0
Message-ID: <20190424195703.9AB368077E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bc94d17e5e2abae2dea1c6066e074334a673ffc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-setuptools-scm v1.15.6 was released in 2017 and is now
obsolete. Multiple versions have been released released to resolve
various issues:
https://github.com/pypa/setuptools_scm/blob/master/CHANGELOG.rst.

While at it, we add the hash for the license file.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 8 +++++---
 package/python-setuptools-scm/python-setuptools-scm.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index e34e8e2b6d..774874bd58 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/setuptools_scm/json, sha256 locally computed
-md5 f17493d53f0d842bb0152f214775640b setuptools_scm-1.15.6.tar.gz
-sha256 49ab4685589986a42da85706b3311a2f74f1af567d39fee6cb1e088d7a75fb5f setuptools_scm-1.15.6.tar.gz
+# sha256 from https://pypi.python.org/pypi/setuptools_scm/json
+sha256 52ab47715fa0fc7d8e6cd15168d1a69ba995feb1505131c3e814eb7087b57358 setuptools_scm-3.2.0.tar.gz
+
+# sha256 locally computed
+sha256 89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index acde2618c3..e296dc6e4b 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 1.15.6
+PYTHON_SETUPTOOLS_SCM_VERSION = 3.2.0
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://pypi.python.org/packages/03/6d/aafdd01edd227ee879b691455bf19895091872af7e48192bea1758c82032
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/54/85/514ba3ca2a022bddd68819f187ae826986051d130ec5b972076e4f58a9f3
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
