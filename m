From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2020 16:58:59 +0200
Subject: [Buildroot] [git commit] docs/website/news.html: correct left/right
 ordering of 2020.08-rc2 entry
Message-ID: <20200824145303.05A1B83DB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1861514be311beec600dd440a6afe2c2a367b031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop the confusing class="timeline" tag from the 2020.08-rc1 entry.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index af4bd6c86e..6269c7b60f 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,7 +9,7 @@
 <h2>News</h2>
 <ul class="timeline">
 
-  <li>
+  <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
       <div class="timeline-heading">
@@ -30,7 +30,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
       <div class="timeline-heading">
