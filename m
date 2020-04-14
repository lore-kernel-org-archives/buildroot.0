From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 13 Apr 2020 19:43:13 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-engineio: bump to version
 3.12.1
Message-ID: <20200414014313.102217-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-engineio/python-engineio.hash | 6 +++---
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index f10e69af65..ef852cf1ad 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5	bec3b06a112a7f09a0a9c92b627282fe  python-engineio-3.10.0.tar.gz
-sha256	9c9a6035b4b5e5a225f426f846afa14cf627f7571d1ae02167cb703fefd134b7  python-engineio-3.10.0.tar.gz
+md5  e6ea8b3f2f32eeeb02014c46092f2adb  python-engineio-3.12.1.tar.gz
+sha256  2481732d93646998f7372ef0ecf003af7817b82720b881db173c3d50b4887916  python-engineio-3.12.1.tar.gz
 # Locally computed sha256 checksums
-sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
+sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 62036a9c76..36ca326877 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 3.10.0
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/78/8e/c58cf2725fd17d65b9fe818b70aff4ccce4903b47aaee6f4321727a8b8bb
+PYTHON_ENGINEIO_VERSION = 3.12.1
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/71/5d/620b75396ce993001cbccc80dd786ab09a16a8e3f6c4878ad05f051064d6
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.20.1
