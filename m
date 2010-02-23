From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Feb 2010 23:28:46 +0100
Subject: [Buildroot] [git commit master] Update for 2010.02-rc2
Message-ID: <20100223222919.1781E776FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7bd8125edc2c48aebc94f7e3a64712b4e50d7dab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Config.in          |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   12 ++++++++++++
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2e737fe..d308e93 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2010.02-rc2, Not yet released:
+2010.02-rc2, Released February 23th, 2010:
 
 	Fixes all over the tree and new features.
 
diff --git a/Config.in b/Config.in
index 1dc49d5..21d0ffe 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.02-rc1"
+	default "2010.02-rc2"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/download.html b/docs/download.html
index 65e64f2..f921aa7 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2009.11.tar.bz2">buildroot-2009.11.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2010.02-rc1</b>, which can be
+The latest release candidate is <b>2010.02-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2010.02-rc1.tar.gz">buildroot-2010.02-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2010.02-rc2.tar.gz">buildroot-2010.02-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2010.02-rc1.tar.bz2">buildroot-2010.02-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2010.02-rc2.tar.bz2">buildroot-2010.02-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 250675c..48fa8df 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,18 @@
 <p>
 
 <ul>
+  <li><b>23 February 2010 -- 2010.02-rc2 released</b>
+
+    <p>RC2 is out with more cleanups and bugfixes, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.02_rc2">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2010.02-rc2.tar.bz2">2010.02-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>9 February 2010 -- 2010.02-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
-- 
1.6.3.3
