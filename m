From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Aug 2009 07:14:05 +0200
Subject: [Buildroot] [git commit] docs/: announce 2009.08-rc1
Message-ID: <20090803051436.0FE29777E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=efc3aed18132586ad90b0e2bd91dd215633a9b16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/download.html |    8 ++++++++
 docs/news.html     |   13 +++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/docs/download.html b/docs/download.html
index 349a7cd..0c34f4a 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,6 +14,14 @@ or
 <a href="/downloads/buildroot-2009.05.tar.bz2">buildroot-2009.05.tar.bz2</a>.
 <p>
 
+The latest release candidate is <b>2009.08-rc1</b>, which can be
+downloaded here:<p>
+
+<a href="/downloads/buildroot-2009.08-rc1.tar.gz">buildroot-2009.08-rc1.tar.gz</a>
+or
+<a href="/downloads/buildroot-2009.08-rc1.tar.bz2">buildroot-2009.08-rc1.tar.bz2</a>.
+<p>
+
 This and earlier releases can always be dowloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index 65fd892..bb6e2e2 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>2 August 2009 -- 2009.08-rc1 released</b>
+
+    <p>We have a new release candidate! Lots of changes all over the
+    tree, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08_rc1">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2009.08-rc1.tar.bz2">2009.08-rc1
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>1 June 2009 -- 2009.05 released</b>
 
     <p>The stable 2009.05 release is out - Thanks to everyone
-- 
1.6.3.3
