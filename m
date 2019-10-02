From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:19:43 +0200
Subject: [Buildroot] [git commit] package/python-webob: bump to version 1.8.5
Message-ID: <20191002201427.86C9F80503@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=996e8424adfdaf133d10233c785f0b027047f0f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-webob/python-webob.hash | 6 +++---
 package/python-webob/python-webob.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-webob/python-webob.hash b/package/python-webob/python-webob.hash
index 41e8af34fe..af3c7a0851 100644
--- a/package/python-webob/python-webob.hash
+++ b/package/python-webob/python-webob.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/WebOb/json
-md5	afea95e4f08330a0529ae33137caf4f0  WebOb-1.8.1.tar.gz
-sha256	54f35073d2fdcddd7a98c2a1dedeede49739150737164a787220f30283139ba6  WebOb-1.8.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/webob/json
+md5	1761f416e8cf53f6fb674149cc223bd1  WebOb-1.8.5.tar.gz
+sha256	05aaab7975e0ee8af2026325d656e5ce14a71f1883c52276181821d6d5bf7086  WebOb-1.8.5.tar.gz
 # Locally computed sha256 checksums
 sha256	27bc4919e7e9e6b6cda40644517ca74d32203e32fba89ef832aba1ed93e457b3  docs/license.txt
diff --git a/package/python-webob/python-webob.mk b/package/python-webob/python-webob.mk
index fdf4793898..fd9b2d1b36 100644
--- a/package/python-webob/python-webob.mk
+++ b/package/python-webob/python-webob.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBOB_VERSION = 1.8.1
+PYTHON_WEBOB_VERSION = 1.8.5
 PYTHON_WEBOB_SOURCE = WebOb-$(PYTHON_WEBOB_VERSION).tar.gz
-PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/ea/93/675ec37b631c823877718164b74fc057203c8979fd771bf60f711d64550b
+PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/9d/1a/0c89c070ee2829c934cb6c7082287c822e28236a4fcf90063e6be7c35532
 PYTHON_WEBOB_SETUP_TYPE = setuptools
 PYTHON_WEBOB_LICENSE = MIT
 PYTHON_WEBOB_LICENSE_FILES = docs/license.txt
