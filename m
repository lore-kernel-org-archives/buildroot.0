From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  9 Jun 2020 15:31:16 +0200
Subject: [Buildroot] [PATCH] python-webob: bump version to 1.8.6
Message-ID: <20200609133117.3553-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And adjust the .hash spacing for the new agreements.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-webob/python-webob.hash | 6 +++---
 package/python-webob/python-webob.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-webob/python-webob.hash b/package/python-webob/python-webob.hash
index af3c7a0851..aab2f1d9e4 100644
--- a/package/python-webob/python-webob.hash
+++ b/package/python-webob/python-webob.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webob/json
-md5	1761f416e8cf53f6fb674149cc223bd1  WebOb-1.8.5.tar.gz
-sha256	05aaab7975e0ee8af2026325d656e5ce14a71f1883c52276181821d6d5bf7086  WebOb-1.8.5.tar.gz
+md5  dc3cc8c317d4acd03a6fd97cb0a9121a  WebOb-1.8.6.tar.gz
+sha256  aa3a917ed752ba3e0b242234b2a373f9c4e2a75d35291dcbe977649bd21fd108  WebOb-1.8.6.tar.gz
 # Locally computed sha256 checksums
-sha256	27bc4919e7e9e6b6cda40644517ca74d32203e32fba89ef832aba1ed93e457b3  docs/license.txt
+sha256  27bc4919e7e9e6b6cda40644517ca74d32203e32fba89ef832aba1ed93e457b3  docs/license.txt
diff --git a/package/python-webob/python-webob.mk b/package/python-webob/python-webob.mk
index fd9b2d1b36..051c117538 100644
--- a/package/python-webob/python-webob.mk
+++ b/package/python-webob/python-webob.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBOB_VERSION = 1.8.5
+PYTHON_WEBOB_VERSION = 1.8.6
 PYTHON_WEBOB_SOURCE = WebOb-$(PYTHON_WEBOB_VERSION).tar.gz
-PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/9d/1a/0c89c070ee2829c934cb6c7082287c822e28236a4fcf90063e6be7c35532
+PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/2a/32/5f3f43d0784bdd9392db0cb98434d7cd23a0d8a420c4d243ad4cb8517f2a
 PYTHON_WEBOB_SETUP_TYPE = setuptools
 PYTHON_WEBOB_LICENSE = MIT
 PYTHON_WEBOB_LICENSE_FILES = docs/license.txt
-- 
2.20.1
