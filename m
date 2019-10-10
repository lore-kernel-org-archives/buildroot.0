From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 10 Oct 2019 22:51:34 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-traitlets: bump to version
 4.3.3
Message-ID: <20191010195134.12282-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-traitlets/python-traitlets.hash | 8 +++++---
 package/python-traitlets/python-traitlets.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 23aa1591c3..068db553c3 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/traitlets/json, sha256 locally computed
-md5 3068663f2f38fd939a9eb3a500ccc154 traitlets-4.3.2.tar.gz
-sha256 9c4bd2d267b7153df9152698efb1050a5d84982d3384a37b2c1f7723ba3e7835 traitlets-4.3.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/traitlets/json
+md5	3a4f263af65d3d79f1c279f0247077ef  traitlets-4.3.3.tar.gz
+sha256	d023ee369ddd2763310e4c3eae1ff649689440d4ae59d7485eb4cfbbe3e359f7  traitlets-4.3.3.tar.gz
+# Locally computed sha256 checksums
+sha256	71c89129039b870cc92309466c4fbe8f285a82fa0ea36f0e840fa83979cbe31f  COPYING.md
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index 779f5936da..5973caf3bb 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 4.3.2
+PYTHON_TRAITLETS_VERSION = 4.3.3
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://pypi.python.org/packages/a5/98/7f5ef2fe9e9e071813aaf9cb91d1a732e0a68b6c44a32b38cb8e14c3f069
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/75/b0/43deb021bc943f18f07cbe3dac1d681626a48997b7ffa1e7fb14ef922b21
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
 PYTHON_TRAITLETS_SETUP_TYPE = distutils
-- 
2.20.1
