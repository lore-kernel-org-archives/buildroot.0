From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 May 2010 14:35:04 +0200
Subject: [Buildroot] [git commit master] update for 2010.05-rc3
Message-ID: <20100527123601.071A399FED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bbd96dbaa73a8078d876b8882d2f89d271ab3448
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Config.in          |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   13 +++++++++++++
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 07bcb59..202913d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2010.05, Not yet released:
+2010.05-rc3, Released May 27th, 2010:
 
 	Fixes all over the tree.
 
diff --git a/Config.in b/Config.in
index 53aed90..4d4dfc9 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.05-rc2-git"
+	default "2010.05-rc3"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/download.html b/docs/download.html
index d8801cd..f2949c8 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2010.02.tar.bz2">buildroot-2010.02.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2010.05-rc2</b>, which can be
+The latest release candidate is <b>2010.05-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2010.05-rc2.tar.gz">buildroot-2010.05-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2010.05-rc3.tar.gz">buildroot-2010.05-rc3.tar.gz</a>
 or
-<a href="/downloads/buildroot-2010.05-rc2.tar.bz2">buildroot-2010.05-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2010.05-rc3.tar.bz2">buildroot-2010.05-rc3.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index bbebd60..fda53be 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+
+  <li><b>27 May 2010 -- 2010.05-rc3 released</b>
+
+    <p>RC3 is out with more cleanups and bugfixes, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.05_rc3">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2010.05-rc3.tar.bz2">2010.05-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>11 May 2010 -- 2010.05-rc2 released</b>
 
     <p>Another week, another release candidate with a bunch of
-- 
1.6.3.3
