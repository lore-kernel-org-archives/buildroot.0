From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 17:11:17 +0100
Subject: [Buildroot] [git commit] docs/website: update for 2020.08.3
Message-ID: <20201227155426.2A0FA82C1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e80f28a35b15840080a9eabad6d5bee83c3a1952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 2be57b5a8c..8b0e37ba89 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.08.3 released, 2020.08.x series EOL</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 December 2020</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2020.08.3 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2020.08.2 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.08.3">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2020-December/299456.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.08.3.tar.bz2">2020.08.3 release</a>.</p>
+
+	  <p>Notice that the 2020.08.x series is now end of life. Please migrate to
+	  the 2020.11 series instead which will be supported until March 2021.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
