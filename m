From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 24 Feb 2014 09:58:04 +0100
Subject: [Buildroot] [PATCH] docs/manual: fix minor spelling/grammar mistakes
Message-ID: <27360bc99d81b33c591e.1393232284@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes a few minor spelling or grammar mistakes since the recent
additions to the manual (commits 0b100de2cf36d81910ab53978b8a379214a683ea to
7cbb476661b0cfa213d8885f3fe5d58823e84286).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/common-usage.txt                |  8 ++++----
 docs/manual/rebuilding-packages.txt         |  4 ++--
 docs/manual/using-buildroot-development.txt |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -211,7 +211,7 @@ When the build of a system takes a long 
 to be able to understand which packages are the longest to build, to
 see if anything can be done to speed up the build. In order to help
 such build time analysis, Buildroot collects the build time of each
-step of each package, and allows to generate graphs from these data.
+step of each package, and allows to generate graphs from this data.
 
 To generate the build time graph after a build, run:
 
@@ -221,13 +221,13 @@ make graph-build
 
 This will generate a set of files in +output/graphs+ :
 
-* +build.hist-build.pdf+, an histogram of the build time for each
+* +build.hist-build.pdf+, a histogram of the build time for each
   package, ordered in the build order.
 
-* +build.hist-duration.pdf+, an histogram of the build time for each
+* +build.hist-duration.pdf+, a histogram of the build time for each
   package, ordered by duration (longest first)
 
-* +build.hist-name.pdf+, an histogram of the build time for each
+* +build.hist-name.pdf+, a histogram of the build time for each
   package, order by package name.
 
 * +build.pie-packages.pdf+, a pie chart of the build time per package
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -62,7 +62,7 @@ can help you understand how to work with
 
  * When a change to the root filesystem skeleton is made, a full
    rebuild is needed. However, when changes to the root filesystem
-   overlay, to a post-build script or a post-image script are made,
+   overlay, a post-build script or a post-image script are made,
    there is no need for a full rebuild: a simple +make+ invocation
    will take the changes into account.
 
@@ -104,7 +104,7 @@ On the other hand, if you only want to r
 package from its compilation step, you can run +make
 <package>-rebuild+, followed by +make+ or +make <package>+. It will
 restart the compilation and installation of the package, but not from
-scratch: it basically simply re-executes +make+ and +make install+
+scratch: it basically re-executes +make+ and +make install+
 inside the package, so it will only rebuild files that changed.
 
 If you want to restart the build process of a package from its
diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
--- a/docs/manual/using-buildroot-development.txt
+++ b/docs/manual/using-buildroot-development.txt
@@ -23,7 +23,7 @@ source code of one package, and be able 
 with Buildroot.
 
 Making changes directly in +output/build/<package>-<version>+ is not
-appropriate solution, because this directory is removed on +make
+an appropriate solution, because this directory is removed on +make
 clean+.
 
 Therefore, Buildroot provides a specific mechanism for this use case:
