From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 15:09:44 +0100
Subject: [Buildroot] [git commit] docs/website: update for 2018.11.4
Message-ID: <20190329140626.E8C2E890C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf8e36cf2f36d4740889af6b264e19d973b10904
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 20be2e77bd..7680f91c46 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2018.11.4 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 March 2019</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2018.11.4 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2018.11.3 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.11.4">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2019-March/246388.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2018.11.4.tar.bz2">2018.11.4 release</a>.</p>
+
+	  <p>Notice that the 2018.11.x series is now end of life. Please migrate to
+	  the 2019.02 series instead which will be supported until March 2020.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
