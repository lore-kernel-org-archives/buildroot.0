From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 May 2011 15:02:23 +0200
Subject: [Buildroot] [git commit] Update for 2011.05-rc2
Message-ID: <20110524130311.03609835FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=effcc9a2a2a6678dbc04d3c5b6957df3987dccc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |   11 +++++++++++
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   12 ++++++++++++
 4 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index b0ac653..eb41128 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,14 @@
+2011.05-rc2, Released May 24th, 2011:
+
+	Fixes all over the tree.
+
+	Toolchain: Code sourcery ARM 2009q1 download URL fixed /
+	2009q3 external toolchains added. Crosstool-NG bumped to
+	1.11.3, eglic/glibc configuration fixes. Linux kernel 2.6.38.x
+	bumped to 2.6.38.7.
+
+	Updated/fixed packages: bind, fakeroot, kbd, psmisc, qt
+
 2011.05-rc1, Released May 18th, 2011:
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index d803a5c..9be7f1c 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.05-rc1
+export BR2_VERSION:=2011.05-rc2
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index 6d0a2ec..ec0685b 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2011.02.tar.bz2">buildroot-2011.02.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2011.05-rc1</b>, which can be
+The latest release candidate is <b>2011.05-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2011.05-rc1.tar.gz">buildroot-2011.05-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2011.05-rc2.tar.gz">buildroot-2011.05-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2011.05-rc1.tar.bz2">buildroot-2011.05-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2011.05-rc2.tar.bz2">buildroot-2011.05-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index acec32a..99e9aa3 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,18 @@
 <p>
 
 <ul>
+  <li><b>24 May 2011 -- 2011.05-rc2 released</b>
+
+    <p>RC2 is out with more bugfixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05_rc2">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2011.05-rc2.tar.bz2">2011.05-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>18 May 2011 -- 2011.05-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
-- 
1.7.3.4
