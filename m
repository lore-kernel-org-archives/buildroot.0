From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Jul 2010 12:35:45 +0200
Subject: [Buildroot] [git commit master 1/1] update for 2010.08-rc1
Message-ID: <20100730105054.C5F0183685@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2ef83b42b97e7a098c9bef34109c5a8896a17b76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Config.in          |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index a39a2fb..8308673 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2010.08, Not released yet:
+2010.08-rc1, Released July 30th, 2010:
 
 	Fixes all over the tree and new features.
 
diff --git a/Config.in b/Config.in
index 6adfe49..bcf9feb 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.08-git"
+	default "2010.08-rc1"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/download.html b/docs/download.html
index ff6dd2d..241c48e 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,15 +13,15 @@ here:<p>
 or
 <a href="/downloads/buildroot-2010.05.tar.bz2">buildroot-2010.05.tar.bz2</a>.
 <p>
-<!--
-The latest release candidate is <b>2010.05-rc3</b>, which can be
+
+The latest release candidate is <b>2010.08-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2010.05-rc3.tar.gz">buildroot-2010.05-rc3.tar.gz</a>
+<a href="/downloads/buildroot-2010.08-rc1.tar.gz">buildroot-2010.08-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2010.05-rc3.tar.bz2">buildroot-2010.05-rc3.tar.bz2</a>.
+<a href="/downloads/buildroot-2010.08-rc1.tar.bz2">buildroot-2010.08-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index afab7be..f8412a0 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -6,6 +6,19 @@
 
 <ul>
 
+  <li><b>30 July 2010 -- 2010.08-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08_rc1">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2010.08-rc1.tar.bz2">2010.08-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>30 May 2010 -- 2010.05 released</b>
 
     <p>The stable 2010.05 release is out - Thanks to everyone
-- 
1.7.1
