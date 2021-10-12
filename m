Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5717EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 06:18:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D11D760ED4
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 06:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D11D760ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AF6E401B2;
	Tue, 12 Oct 2021 06:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxe4xZsY9wVy; Tue, 12 Oct 2021 06:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 941A340257;
	Tue, 12 Oct 2021 06:18:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C82601BF9B9
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 06:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87D59400CD
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 06:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XuSvblj18Bxn for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 06:18:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A94F7405C9
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 06:18:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 838DA954AA; Tue, 12 Oct 2021 06:15:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 08:17:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28af41c3d9df892d8ff5579c916450c9dfab0b4b
X-Git-Newrev: 99d5bee4c9ab191465e04ff361c7ebc12bd89b7c
X-Patchwork-Hint: ignore
Message-Id: <20211012061542.838DA954AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: update for 2021.02.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=99d5bee4c9ab191465e04ff361c7ebc12bd89b7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index e46b3ab18c..c966ac8f4f 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,37 +8,37 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2021.02.5</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2021.02.6</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.02.5.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02.6.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.02.5.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02.6.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2021.02.5.tar.gz">buildroot-2021.02.5.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.02.5.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.02.6.tar.gz">buildroot-2021.02.6.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.02.6.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.02.5.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02.6.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.02.5.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.02.6.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.02.5.tar.bz2">buildroot-2021.02.5.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.02.5.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.02.6.tar.bz2">buildroot-2021.02.6.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.02.6.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 926e75b400..eeff335a6a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.02.6 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 October 2021</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2021.02.6 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2021.02.5 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02.6">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2021-October/625654.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.02.6.tar.bz2">2021.02.6 release</a>.</p>
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
