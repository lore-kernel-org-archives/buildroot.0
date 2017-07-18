From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 18 Jul 2017 12:13:10 +0200
Subject: [Buildroot] [PATCH 1/2] python-setuptools-scm: bum to version 1.15.6
Message-ID: <20170718101311.30667-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 075e70d5f..e34e8e2b6 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/setuptools_scm/json, sha256 locally computed
-md5 d91e17693598d8ba84c5b4fed48b015d setuptools_scm-1.15.1rc1.tar.gz
-sha256 24007d8a43c4b43c7ad6c8725cbdfb94212c30f6ab849f21f7bb3809333f105a setuptools_scm-1.15.1rc1.tar.gz
+md5 f17493d53f0d842bb0152f214775640b setuptools_scm-1.15.6.tar.gz
+sha256 49ab4685589986a42da85706b3311a2f74f1af567d39fee6cb1e088d7a75fb5f setuptools_scm-1.15.6.tar.gz
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 5fb48fddf..acde2618c 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 1.15.1rc1
+PYTHON_SETUPTOOLS_SCM_VERSION = 1.15.6
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://pypi.python.org/packages/b8/4b/c7370d3c54a74ee8abb3c7e0792c6c95f1e9658e959211b5b86eebe4677a
+PYTHON_SETUPTOOLS_SCM_SITE = https://pypi.python.org/packages/03/6d/aafdd01edd227ee879b691455bf19895091872af7e48192bea1758c82032
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
-- 
2.11.0
