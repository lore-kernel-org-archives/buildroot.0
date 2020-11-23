From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2020 20:24:41 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-janus: bump to version 0.6.1
Message-ID: <20201123032441.2065584-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-janus/python-janus.hash | 4 ++--
 package/python-janus/python-janus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-janus/python-janus.hash b/package/python-janus/python-janus.hash
index 9108db6325..7d914389d2 100644
--- a/package/python-janus/python-janus.hash
+++ b/package/python-janus/python-janus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/janus/json
-md5  577c3c8939ef945c5dc00319bd59484f  janus-0.5.0.tar.gz
-sha256  0700f5537d076521851d19b7625545c5e76f6d5792ab17984f28230adcc3b34c  janus-0.5.0.tar.gz
+md5  dad6a03e7664cb800ce45ef8bcf12439  janus-0.6.1.tar.gz
+sha256  4712e0ef75711fe5947c2db855bc96221a9a03641b52e5ae8e25c2b705dd1d0c  janus-0.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8b177cccb6ddec12a9fc97bd49e7e2bbcd92464625624bd8bdbfad799ae606e9  LICENSE
diff --git a/package/python-janus/python-janus.mk b/package/python-janus/python-janus.mk
index b5fa44f727..2b08733c18 100644
--- a/package/python-janus/python-janus.mk
+++ b/package/python-janus/python-janus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JANUS_VERSION = 0.5.0
+PYTHON_JANUS_VERSION = 0.6.1
 PYTHON_JANUS_SOURCE = janus-$(PYTHON_JANUS_VERSION).tar.gz
-PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/9a/76/fbb89aa5d3cb5f3fec6ce74d34cf980ccd475b015d1a59cb5a14fe4cd2c5
+PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/7c/1b/8769c2dca84dd8ca92e48b14750c7106ff4313df4fee651dbc3cd9e345a9
 PYTHON_JANUS_SETUP_TYPE = setuptools
 PYTHON_JANUS_LICENSE = Apache-2.0
 PYTHON_JANUS_LICENSE_FILES = LICENSE
-- 
2.25.1
