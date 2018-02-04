From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sun,  4 Feb 2018 18:24:09 +0100
Subject: [Buildroot] [PATCH] python-remi: fix trailing whitespace and line
 size
Message-ID: <20180204172409.26044-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Fixes line size in Config.in, trailing whitespace after # and empty line

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/50971692

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-remi/Config.in      | 9 +++++----
 package/python-remi/python-remi.mk | 3 +--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-remi/Config.in b/package/python-remi/Config.in
index 68d0a92b11..2f4216b324 100644
--- a/package/python-remi/Config.in
+++ b/package/python-remi/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_REMI
 	bool "python-remi"
 	help
-	  Remi is a GUI library for Python applications which transpiles an
-	  application's interface into HTML to be rendered in a web browser.
-	  This removes platform-specific dependencies and lets you easily
-	  develop cross-platform applications in Python!
+	  Remi is a GUI library for Python applications which
+	  transpiles an application's interface into HTML to be
+	  rendered in a web browser. This removes platform-specific
+	  dependencies and lets you easily develop cross-platform
+	  applications in Python!
 
 	  https://github.com/dddomodossola/remi/tree/master
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 6514118192..3356430ddb 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -1,5 +1,5 @@
 ################################################################################
-# 
+#
 # python-remi
 #
 ################################################################################
@@ -11,4 +11,3 @@ PYTHON_REMI_LICENSE_FILES = LICENSE
 PYTHON_REMI_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-
-- 
2.13.6
