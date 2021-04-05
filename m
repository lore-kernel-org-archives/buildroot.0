From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 12:16:27 +0200
Subject: [Buildroot] [git commit] docs/website: update for 2020.11.4
Message-ID: <20210405095133.CE98F7FE00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb81c441e30b83e35ed35f069f627c67d8f7d2d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index f842d7310a..c777747116 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.11.4 released, 2020.11.x series EOL</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 April 2021</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2020.11.4 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2020.11.3 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.11.4">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2021-April/307609.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.11.4.tar.bz2">2020.11.4 release</a>.</p>
+
+	  <p>Notice that the 2020.11.x series is now end of life. Please migrate to
+	  the 2021.02 series instead which will be supported until March 2022.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
