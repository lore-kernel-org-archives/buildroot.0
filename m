From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 13 Apr 2020 20:00:50 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-jinja2: bump to version
 2.11.2
Message-ID: <20200414020050.43764-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jinja2/python-jinja2.hash | 8 ++++----
 package/python-jinja2/python-jinja2.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index e366b9e180..21170a2a99 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5	5d88c7e77aa63fc852a04f65dbfe5594  Jinja2-2.11.1.tar.gz
-sha256	93187ffbc7808079673ef52771baa950426fd664d3aad1d0fa3e95644360e250  Jinja2-2.11.1.tar.gz
-# Locally computed sha256
-sha256	3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
+md5  0362203b22547abca06ed1082bc1e7b4  Jinja2-2.11.2.tar.gz
+sha256  89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0  Jinja2-2.11.2.tar.gz
+# Locally computed sha256 checksums
+sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 64b4c60c9b..5f6492915c 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 2.11.1
+PYTHON_JINJA2_VERSION = 2.11.2
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/d8/03/e491f423379ea14bb3a02a5238507f7d446de639b623187bccc111fbecdf
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/64/a7/45e11eebf2f15bf987c3bc11d37dcc838d9dc81250e67e4c5968f6008b6c
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
-- 
2.20.1
