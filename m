From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Oct 2016 23:11:40 +0200
Subject: [Buildroot] [PATCH 20/28] package/python-pathvalidate: bump version
	to 0.7.1
In-Reply-To: <20161003211148.18603-1-bernd.kuhls@t-online.de>
References: <20161003211148.18603-1-bernd.kuhls@t-online.de>
Message-ID: <20161003211148.18603-20-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pathvalidate/python-pathvalidate.hash | 7 +++----
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index 90208f4..3a1bc1d 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/pathvalidate/json
-md5	d3d89abc6c053b4182be29c23beccf26  pathvalidate-0.4.2.tar.gz
-# sha256 calculated locally
-sha256	4316cf5f862b70efd7792b98f46871592b80924840da69a28df1921d7702fcf9  pathvalidate-0.4.2.tar.gz
+# md5 from https://pypi.python.org/pypi/pathvalidate/json, sha256 locally computed
+md5	1ea321c363fb5f55451473071db30d28  pathvalidate-0.7.1.tar.gz
+sha256	4d701cfc8b380ed39252e29ce972a54dd18ce1dbe5cd8758162480d8bd673e5d  pathvalidate-0.7.1.tar.gz
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index 0c7cc76..843b207 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 0.4.2
+PYTHON_PATHVALIDATE_VERSION = 0.7.1
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/fd/b9/726269557d5846f253f7ecec483d801582a27b77852a76e2dc9c61dba2b6
+PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/85/39/94b634c076dc3192455b1c0a8d15061eeeffd65a9d267d2b9de237b159a2
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
-- 
2.9.3
