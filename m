From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Feb 2010 16:54:30 +0100
Subject: [Buildroot] [git commit master] update for 2010.02-rc1
Message-ID: <20100209160347.E3B967768E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f0bdacdb5b8fe0fbc276ed510fc58e9a219f5cf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |   14 +++++++++++++-
 Config.in          |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9f9aa01..c8ddc6e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,16 @@
-2010.02, Not yet released:
+2010.02-rc1, Released February 9th, 2010:
+
+	Fixes all over the tree and new features.
+
+	Generalized autotools infrastructure to be usable for
+	non-autotools packages, see package/Makefile.package.in for
+	details.
+
+	Cleaned up avr32 toolchain config, external source-based
+	toolchain support is gone.
+
+	Dependency checks: Also check for makeinfo, only print output
+	on errors.
 
 	Toolchain: uClibc 0.9.30.2, gcc 4.4.3
 
diff --git a/Config.in b/Config.in
index e4edaae..1dc49d5 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.02-git"
+	default "2010.02-rc1"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/download.html b/docs/download.html
index c90f4fc..65e64f2 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,15 +13,15 @@ here:<p>
 or
 <a href="/downloads/buildroot-2009.11.tar.bz2">buildroot-2009.11.tar.bz2</a>.
 <p>
-<!--
-The latest release candidate is <b>2009.11-rc2</b>, which can be
+
+The latest release candidate is <b>2010.02-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2009.11-rc2.tar.gz">buildroot-2009.11-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2010.02-rc1.tar.gz">buildroot-2010.02-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2009.11-rc2.tar.bz2">buildroot-2009.11-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2010.02-rc1.tar.bz2">buildroot-2010.02-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 3082c57..250675c 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>9 February 2010 -- 2010.02-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.02_rc1">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2010.02-rc1.tar.bz2">2010.02-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>1 December 2009 -- 2009.11 released</b>
 
     <p>The stable 2009.11 release is out - Thanks to everyone
-- 
1.6.3.3
