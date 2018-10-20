From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 19:29:18 +0200
Subject: [Buildroot] [git commit] python-click: bump to version 7.0
Message-ID: <20181020172747.8F4A7866BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53a3ef3602e42fb48de421d4e0ee838efec35044
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license hash.
License change: LICENSE renamed to LICENSE.rst, and one parahraph
has moved down (no actual content was added/deleted/modified)

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-click/python-click.hash | 8 +++++---
 package/python-click/python-click.mk   | 8 ++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index cae03c72e2..911f13dfa3 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/click/json, sha256 locally computed
-md5 fc4cc00c4863833230d3af92af48abd4 click-6.7.tar.gz
-sha256 f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b click-6.7.tar.gz
+# md5, sha256 from https://pypi.org/pypi/click/json
+md5 7f53d50f7b7373ebc7963f9ff697450a Click-7.0.tar.gz
+sha256 5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7 Click-7.0.tar.gz
+# Locally computed sha256
+sha256 e212319faefa4f459c8ac937fdc8557040a3cab8af29366ca2a48d239025225c LICENSE.rst
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index e6df636167..12539f557b 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 6.7
-PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://pypi.python.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897
+PYTHON_CLICK_VERSION = 7.0
+PYTHON_CLICK_SOURCE = Click-$(PYTHON_CLICK_VERSION).tar.gz
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/f8/5c/f60e9d8a1e77005f664b76ff8aeaee5bc05d0a91798afd7f53fc998dbc47
 PYTHON_CLICK_LICENSE = BSD-3-Clause
-PYTHON_CLICK_LICENSE_FILES = LICENSE
+PYTHON_CLICK_LICENSE_FILES = LICENSE.rst
 PYTHON_CLICK_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
