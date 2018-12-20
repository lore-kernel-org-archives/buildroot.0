From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Dec 2018 11:23:31 +0100
Subject: [Buildroot] [git commit] docs/website: update for 2018.08.4
Message-ID: <20181220101932.933EB82AA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d9170a1f7a3fe9092256f5247e166ac1c58fcae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index a2ee46df51..f5246cf35a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.08.4 released, 2018.08 series EOL</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 December 2018</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2018.08.4 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2018.08.3 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.08.4">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2018-December/239200.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2018.08.4.tar.bz2">2018.08.4 release</a>.</p>
+        <p>Notice that the 2018.08 series is now end of life, please
+          consider migrating to 2018.11 instead.</p>
+     </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
