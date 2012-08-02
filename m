From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:34 -0000
Subject: [Buildroot] [git commit branch/next] Update for 2012.05-rc2
Message-ID: <20120802195232.C5D9196FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b07ad40c1dc78e61dd71d264b1b30aabfa1033dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |   14 +++++++++++++-
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   13 +++++++++++++
 4 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6b01c04..7d17c26 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,16 @@
-2012.05-rc1, Released May 10th, 2012
+2012.05-rc2, Released May 18th, 2012:
+
+	Fixes all over the tree.
+
+	Toolchain: uClibc: Use 0.9.33.2, Crosstool-ng: fix gperf
+	dependency, disable decimal floats support, Linux 3.2.17 /
+	3.3.6 kernel headers. Fix sysroot copy handling for toolchains
+	without C++ support.
+
+	Updated/fixed packages: apr, apr-util, ccache, dnsmasq,
+	heirloom-mailx, gdb, ndisc6, opencv, openssl, socat, vala
+
+2012.05-rc1, Released May 10th, 2012:
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index 4427c40..c0fc8c2 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.05-rc1
+export BR2_VERSION:=2012.05-rc2
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 7b22569..52d3c18 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2012.02.tar.bz2">buildroot-2012.02.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2012.05-rc1</b>, which can be
+The latest release candidate is <b>2012.05-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2012.05-rc1.tar.gz">buildroot-2012.05-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2012.05-rc2.tar.gz">buildroot-2012.05-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2012.05-rc1.tar.bz2">buildroot-2012.05-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2012.05-rc2.tar.bz2">buildroot-2012.05-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 0032dfa..c7d276e 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>18 May 2012 -- 2012.05-rc2 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05_rc2">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2012.05-rc2.tar.bz2">2012.05-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>10 May 2012 -- 2012.05-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
