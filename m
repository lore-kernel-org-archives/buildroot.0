From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Aug 2010 11:16:33 +0200
Subject: [Buildroot] [git commit master 1/1] update for 2010.08-rc2
Message-ID: <20100830093151.3343C80839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dc3a7ebc26d461e3b2cbd51367d35ccc97e721b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Config.in          |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   16 ++++++++++++++++
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7e029b5..152ffa5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2010.08, Not released yet:
+2010.08-rc2, Released August 30th, 2010:
 
 	Fixes all over the tree.
 
diff --git a/Config.in b/Config.in
index 4c26078..d541358 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.08-rc1-git"
+	default "2010.08-rc2"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/download.html b/docs/download.html
index 241c48e..832e7d2 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2010.05.tar.bz2">buildroot-2010.05.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2010.08-rc1</b>, which can be
+The latest release candidate is <b>2010.08-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2010.08-rc1.tar.gz">buildroot-2010.08-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2010.08-rc2.tar.gz">buildroot-2010.08-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2010.08-rc1.tar.bz2">buildroot-2010.08-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2010.08-rc2.tar.bz2">buildroot-2010.08-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index f8412a0..3dbf2fd 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -6,6 +6,22 @@
 
 <ul>
 
+  <li><b>30 August 2010 -- 2010.08-rc2 released</b>
+
+    <p>RC2 is out with more cleanups and bugfixes, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08_rc2">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2010.08-rc2.tar.bz2">2010.08-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
+    This is very much expected to be the final release
+    candidate, so give it a good test and expect a final 2010.08
+    release before September unless critical issues are found.</p>
+
   <li><b>30 July 2010 -- 2010.08-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
-- 
1.7.1
