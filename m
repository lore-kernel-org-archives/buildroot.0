From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 20:27:05 +0200
Subject: [Buildroot] [git commit] doc: minor documentation fixes after
	package infrastructure changes
Message-ID: <20120717183720.660A296A73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8141ccf380377e48edf596135306c8daa76a68ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-autotools.txt |    4 ++--
 docs/manual/adding-packages-cmake.txt     |    4 ++--
 docs/manual/adding-packages-generic.txt   |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index a9653ce..9fb0918 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -4,7 +4,7 @@ Infrastructure for autotools-based packages
 [[autotools-package-tutorial]]
 
 +autotools-package+ tutorial
-~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 First, let's see how to write a +.mk+ file for an autotools-based
 package, with an example :
@@ -64,7 +64,7 @@ package to be built.
 [[autotools-package-reference]]
 
 +autotools-package+ reference
-~~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The main macro of the autotools package infrastructure is
 +autotools-package+. It is similar to the +generic-package+ macro. The ability to
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index d1489bd..e29ca0f 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -4,7 +4,7 @@ Infrastructure for CMake-based packages
 [[cmake-package-tutorial]]
 
 +cmake-package+ tutorial
-~~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~
 
 First, let's see how to write a +.mk+ file for a CMake-based package,
 with an example :
@@ -63,7 +63,7 @@ package to be built.
 [[cmake-package-reference]]
 
 +cmake-package+ reference
-~~~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The main macro of the CMake package infrastructure is
 +cmake-package+. It is similar to the +generic-package+ macro. The ability to
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index a7cceb7..d264f40 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -9,7 +9,7 @@ system is based on hand-written Makefiles or shell scripts.
 [[generic-package-tutorial]]
 
 +generic-package+ Tutorial
-~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 ------------------------------
 01: #############################################################
@@ -90,7 +90,7 @@ Makefile code necessary to make your package working.
 [[generic-package-reference]]
 
 +generic-package+ Reference
-~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 There are two variants of the generic target. The +generic-package+ macro is
 used for packages to be cross-compiled for the target.  The
