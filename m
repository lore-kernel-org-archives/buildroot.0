From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 21:48:07 +0100
Subject: [Buildroot] [git commit] package/python-bluezero: Bump to version
 0.4.0
Message-ID: <20210119203252.984C68850F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63cc2577c1a5ee52fcf6669ed8ad3ea6a008a394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bluezero/python-bluezero.hash | 6 ++++--
 package/python-bluezero/python-bluezero.mk   | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
index 738688d7a9..d21fefe6e4 100644
--- a/package/python-bluezero/python-bluezero.hash
+++ b/package/python-bluezero/python-bluezero.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bluezero/json
-md5	eeb444ecaf7c6bd2613d8ff0eb92d0ac  bluezero-0.3.0.tar.gz
-sha256	7ebe7243169b5c7600941cb6aa31bc3f8b475c22f5ac32a94d2b0200d5faf684  bluezero-0.3.0.tar.gz
+md5  342718365dbb0df9aa1fb7ea5e405320  bluezero-0.4.0.tar.gz
+sha256  38bc608d26b4381ac3bb2a1d1cf039f1a9891f933b45cf296dbd606557332fad  bluezero-0.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256  59319e80b4caa94ace4817c9f84aa16abc9d4d2b5f7866251b5fda92e87ccdef  LICENSE
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
index 97b1aeb78d..cce45b6bdc 100644
--- a/package/python-bluezero/python-bluezero.mk
+++ b/package/python-bluezero/python-bluezero.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_BLUEZERO_VERSION = 0.3.0
+PYTHON_BLUEZERO_VERSION = 0.4.0
 PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
-PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/e4/d8/c5451133c0773a0378cadb6c014d7f03b5786da1d39af2f9eaa8028e6662
+PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/14/ee/ac038391cf41838ff724e8a11d939e86329043724a7cfd03152f13688bd7
 PYTHON_BLUEZERO_SETUP_TYPE = setuptools
 PYTHON_BLUEZERO_LICENSE = MIT
+PYTHON_BLUEZERO_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
