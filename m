From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Jun 2013 21:40:18 +0200
Subject: [Buildroot] [git commit] Add documentation for the header style
Message-ID: <20130616194240.C38D79AD51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07278078a65559400458d7ad07f18f93f5e20ebf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-autotools.txt |    4 ++--
 docs/manual/adding-packages-cmake.txt     |    4 ++--
 docs/manual/adding-packages-generic.txt   |    4 ++--
 docs/manual/writing-rules.txt             |   12 ++++++++++++
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 1d5f30b..1e7b058 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -13,11 +13,11 @@ First, let's see how to write a +.mk+ file for an autotools-based
 package, with an example :
 
 ------------------------
-01: #############################################################
+01: ################################################################################
 02: #
 03: # libfoo
 04: #
-05: #############################################################
+05: ################################################################################
 06:
 07: LIBFOO_VERSION = 1.0
 08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 6ac073c..b7388c8 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -13,11 +13,11 @@ First, let's see how to write a +.mk+ file for a CMake-based package,
 with an example :
 
 ------------------------
-01: #############################################################
+01: ################################################################################
 02: #
 03: # libfoo
 04: #
-05: #############################################################
+05: ################################################################################
 06:
 07: LIBFOO_VERSION = 1.0
 08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 0d75042..faf70b1 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -15,11 +15,11 @@ system is based on hand-written Makefiles or shell scripts.
 ^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 ------------------------------
-01: #############################################################
+01: ################################################################################
 02: #
 03: # libfoo
 04: #
-05: #############################################################
+05: ################################################################################
 06:
 07: LIBFOO_VERSION = 1.0
 08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index c9816a4..b649c9f 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -52,6 +52,18 @@ http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[].
 The +.mk+ file
 ~~~~~~~~~~~~~~
 
+* Header: The file starts with a header. It contains the module name,
+preferably in lowercase, enclosed between separators made of 80 hashes. A
+blank line is mandatory after the header:
++
+---------------------
+################################################################################
+#
+# libfoo
+#
+################################################################################
+---------------------
++
 * Assignment: use +=+ preceded and followed by one space:
 +
 ---------------------
