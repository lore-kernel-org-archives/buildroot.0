From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 30 Apr 2019 09:19:16 -0400
Subject: [Buildroot] [PATCH 08/11] package/python-jinja2: bump to version
 2.10.1
In-Reply-To: <20190430131919.130128-1-aduskett@gmail.com>
References: <20190430131919.130128-1-aduskett@gmail.com>
Message-ID: <20190430131919.130128-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-jinja2/python-jinja2.hash | 4 ++--
 package/python-jinja2/python-jinja2.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index fe34f73965..21a9c8394f 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5 61ef1117f945486472850819b8d1eb3d Jinja2-2.10.tar.gz
-sha256 f84be1bb0040caca4cea721fcbbbbd61f9be9464ca236387158b0feea01914a4 Jinja2-2.10.tar.gz
+md5 0ae535be40fd215a8114a090c8b68e5a Jinja2-2.10.1.tar.gz
+sha256 065c4f02ebe7f7cf559e49ee5a95fb800a9e4528727aec6f24402a5374c65013 Jinja2-2.10.1.tar.gz
 # Locally computed sha256
 sha256 26fcd436fdc8a39d44896ac03e6f1dfd25e38499c48f20d8bc1dd3bf0aaa8a5b LICENSE
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 9ff36972d6..339ddd7e18 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 2.10
+PYTHON_JINJA2_VERSION = 2.10.1
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/56/e6/332789f295cf22308386cf5bbd1f4e00ed11484299c5d7383378cf48ba47
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/93/ea/d884a06f8c7f9b7afbc8138b762e80479fb17aedbbe2b06515a12de9378d
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE
+
 # In host build, setup.py tries to download markupsafe if it is not installed
 HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 
-- 
2.20.1
