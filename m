From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:46 -0500
Subject: [Buildroot] [PATCH 49/58] python-setuptools-scm: bump to version
	1.15.1rc1
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-50-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 734fc5a..075e70d 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/setuptools_scm/json, sha256 locally computed
-md5	b6916c78ed6253d6602444fad4279c5b  setuptools_scm-1.15.0.tar.gz
-sha256	daf12d05aa2155a46aa357453757ffdc47d87f839e62114f042bceac6a619e2f  setuptools_scm-1.15.0.tar.gz
+md5 d91e17693598d8ba84c5b4fed48b015d setuptools_scm-1.15.1rc1.tar.gz
+sha256 24007d8a43c4b43c7ad6c8725cbdfb94212c30f6ab849f21f7bb3809333f105a setuptools_scm-1.15.1rc1.tar.gz
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 993fbb9..5fb48fd 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 1.15.0
+PYTHON_SETUPTOOLS_SCM_VERSION = 1.15.1rc1
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://pypi.python.org/packages/80/b7/31b6ae5fcb188e37f7e31abe75f9be90490a5456a72860fa6e643f8a3cbc
+PYTHON_SETUPTOOLS_SCM_SITE = https://pypi.python.org/packages/b8/4b/c7370d3c54a74ee8abb3c7e0792c6c95f1e9658e959211b5b86eebe4677a
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
-- 
2.9.3
