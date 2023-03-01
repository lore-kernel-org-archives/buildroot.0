Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6827C678D4
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 21:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 561A3401D0;
	Wed,  1 Mar 2023 21:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 561A3401D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5TETjXbVXUS; Wed,  1 Mar 2023 21:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42BD2401E3;
	Wed,  1 Mar 2023 21:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42BD2401E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5058B1BF357
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 21:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 384DA4060E
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 21:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 384DA4060E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1QsmaG7Z3SRQ for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 21:44:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 536FB40602
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 21:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 536FB40602
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F95786E65; Wed,  1 Mar 2023 21:44:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Mar 2023 22:44:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5f9cbd91a4fc4491587bfc097c6d89f1782c1d5
X-Git-Newrev: 61f1601536f86dc90dcd1efc0eb13f58f4a3dbe5
X-Patchwork-Hint: ignore
Message-Id: <20230301214429.3F95786E65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: update for 2022.02.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=61f1601536f86dc90dcd1efc0eb13f58f4a3dbe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index d39222e694..fa9276a86c 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,37 +8,37 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2022.02.9</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2022.02.10</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.02.9.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.02.9.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2022.02.9.tar.gz">buildroot-2022.02.9.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.02.9.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.02.10.tar.gz">buildroot-2022.02.10.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.02.10.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.02.9.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02.10.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.02.9.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02.10.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.02.9.tar.xz">buildroot-2022.02.9.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.02.9.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.02.10.tar.xz">buildroot-2022.02.10.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.02.10.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 9a76b82505..7486002581 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.02.10 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 January 2023</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2022.02.10 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2022.02.9 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.02.10">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/87cz5sf8v7.fsf@dell.be.48ers.dk/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.02.10.tar.xz">2022.02.10 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
