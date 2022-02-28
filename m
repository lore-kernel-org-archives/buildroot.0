Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4DAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 21:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A72D5405F2;
	Mon, 28 Feb 2022 21:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AS2vpQIJcxah; Mon, 28 Feb 2022 21:17:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66814405E3;
	Mon, 28 Feb 2022 21:17:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 497D81BF2FF
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6AFB81498
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcz6Xc--eLRw for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 21:17:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0C4A81751
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 21:17:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1BBB88386C; Mon, 28 Feb 2022 21:09:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 22:17:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 526da6145f81e3ac0753d550ec8f3afee66a6c2a
X-Git-Newrev: 0c4d496bf10675bacfdc1c0901c755e79f157699
X-Patchwork-Hint: ignore
Message-Id: <20220228210935.1BBB88386C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: update for 2021.02.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0c4d496bf10675bacfdc1c0901c755e79f157699
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index b4f7ecc3ce..a1b2bc9632 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,37 +8,37 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2021.02.9</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2021.02.10</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.02.9.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.02.9.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2021.02.9.tar.gz">buildroot-2021.02.9.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.02.9.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.02.10.tar.gz">buildroot-2021.02.10.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.02.10.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.02.9.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02.10.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.02.9.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02.10.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.02.9.tar.bz2">buildroot-2021.02.9.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.02.9.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.02.10.tar.bz2">buildroot-2021.02.10.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.02.10.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index ed37d0a898..3d979877e0 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.02.10 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2022</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2021.02.10 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2021.02.9 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02.10">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2022-February/637878.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.02.10.tar.bz2">2021.02.10 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
