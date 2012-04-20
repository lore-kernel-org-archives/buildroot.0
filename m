From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Apr 2012 16:36:18 +0200
Subject: [Buildroot] [git commit] website: announce autobuild.buildroot.org
Message-ID: <20120420143742.64B9396B2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5854d2e6f947761302f91de6bcded54fe4f185e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add a link to it in the menu.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/header.html |    1 +
 docs/news.html   |   15 +++++++++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/docs/header.html b/docs/header.html
index c9dcf31..a20f235 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -54,6 +54,7 @@
     <br><a href="https://bugs.uclibc.org/">Bug Tracking</a>
     <br><a href="/docs.html">Documentation</a>
     <br><a href="/lists.html">Mailing Lists</a>
+    <br><a href="http://autobuild.buildroot.org">Autobuilder</a>
 
     <p><b>Related Sites</b>
     <br><a href="http://busybox.net/">BusyBox</a>
diff --git a/docs/news.html b/docs/news.html
index 26a8ccb..151ad9b 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,21 @@
 <p>
 
 <ul>
+  <li><b>20 April 2012 -- Autobuilder Results Online</b>
+
+    <p>The status of the autobuilders, which do repeated
+    <code>randpackageconfig</code> builds for continuous integration
+    testing, is now online at <a
+    href='http://autobuild.buildroot.org'>autobuild.buildroot.org</a>. The
+    code behind it can be found in <a
+    href='http://git.buildroot.net/buildroot-test/'>git</a>.</p>
+
+    <p>Thanks to Thomas Pettazoni for running the web interface, and
+    to <a href='http://gcc.gnu.org/wiki/CompileFarm'>The GCC Compile
+    Farm</a> and <a href='http://free-electrons.com/'>Free
+    Electrons</a> for hosting builders. Thomas also sends out a daily
+    summary of the build status to the mailing list.</p>
+
   <li><b>29 February 2012 -- 2012.02 released</b>
 
     <p>The stable 2012.02 release is out - Thanks to everyone
