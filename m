From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 16:12:45 +0200
Subject: [Buildroot] [git commit master] update for 2010.05-rc1
Message-ID: <20100503141309.55C018A52D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aac61fdcc3688e494f9bd31cbc5c3c16191c2d93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Config.in          |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   13 +++++++++++++
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index f8e42b4..7ef6d81 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2010.05, Not yet released
+2010.05-rc1, Released May 3rd, 2010:
 
 	Cleaned up / restructured package menu.
 
diff --git a/Config.in b/Config.in
index b051a37..3a690d6 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.05-git"
+	default "2010.05-rc1"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/download.html b/docs/download.html
index 1666827..63a5b33 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,15 +13,15 @@ here:<p>
 or
 <a href="/downloads/buildroot-2010.02.tar.bz2">buildroot-2010.02.tar.bz2</a>.
 <p>
-<!--
-The latest release candidate is <b>2010.02-rc2</b>, which can be
+
+The latest release candidate is <b>2010.05-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2010.02-rc2.tar.gz">buildroot-2010.02-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2010.05-rc1.tar.gz">buildroot-2010.05-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2010.02-rc2.tar.bz2">buildroot-2010.02-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2010.05-rc1.tar.bz2">buildroot-2010.05-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index b56bb65..59373cd 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>3 May 2010 -- 2010.05-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.05_rc1">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2010.05-rc1.tar.bz2">2010.05-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>2 May 2010 - FOSDEM slides online</b>
 
     <p>The slides from the <a
-- 
1.6.3.3
