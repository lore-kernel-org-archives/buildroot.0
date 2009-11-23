From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 23:20:21 +0100
Subject: [Buildroot] [git commit master] update for 2009.11-rc1
Message-ID: <20091123222201.48665777EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2d04d56ec765bab79724f40bcfb3020814a1e57d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES        |    2 +-
 Config.in      |    2 +-
 docs/news.html |   13 +++++++++++++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index a390c22..4a40b46 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2009.11, Not yet released:
+2009.11-rc1, Released November 23rd, 2009:
 
 	Fixes all over the tree and new features.
 
diff --git a/Config.in b/Config.in
index 6967d25..0a5a7b9 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2009.11-git"
+	default "2009.11-rc1"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/news.html b/docs/news.html
index 840a3c9..ed69884 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>23 November 2009 -- 2009.11-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11_rc1">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2009.11-rc1.tar.bz2">2009.11-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>7 September 2009 -- First Buildroot Developer Day</b>
 
     <p>The first <i>Buildroot Developer Day</i> will take place on
-- 
1.6.3.3
