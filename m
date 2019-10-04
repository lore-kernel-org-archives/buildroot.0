From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2019 08:57:28 +0200
Subject: [Buildroot] [git commit] docs/website: update for 2019.05.3
Message-ID: <20191004065211.BB95981917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be8d42bc5296974c8bcf45ddbcf936b72347d6c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 2faa56f637..34c122c7ef 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.05.3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 October 2019</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2019.05.3 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2019.05.2 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.05.3">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2019-October/261556.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.05.3.tar.bz2">2019.05.3 release</a>.</p>
+
+	  <p>Notice that the 2019.05.x series is now end of life. Please migrate to
+	  the 2019.02 or 2019.08 series instead.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
