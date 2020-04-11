From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Apr 2020 08:42:34 +0200
Subject: [Buildroot] [git commit] docs/website: update for 2019.11.3
Message-ID: <20200411063447.6F0B58E2F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ceb89051d8d8ca9d9601d153aa74ecd600947c1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index f08c89acff..21dbc66550 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.11.3 released, 2019.11.x series EOL</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 April 2020</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2019.11.3 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2019.11.2 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.11.3">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2020-April/279539.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.11.3.tar.bz2">2019.11.3 release</a>.</p>
+
+	  <p>Notice that the 2019.11.x series is now end of life. Please migrate to
+	  the 2020.02 series instead which will be supported until April 2021.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
