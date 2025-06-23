Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4995CC77B7C
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 16:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1532810AC;
	Mon, 23 Jun 2025 16:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHYOvQF03mQx; Mon, 23 Jun 2025 16:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 193FC810CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 193FC810CA;
	Mon, 23 Jun 2025 16:55:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAF72154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA76A4058F
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FC8hWcRlHXCE for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 16:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00E3B4054F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00E3B4054F
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:55:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F147880277; Mon, 23 Jun 2025 16:55:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Jun 2025 18:54:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f30bf62f5340e231a6f3245b06856eda062f9346
X-Git-Newrev: 6b41e499cdd364368563332975485ed46eb7c47c
X-Patchwork-Hint: ignore
Message-Id: <20250623165520.F147880277@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/{download,
 news}.html: update for 2025.02.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6b41e499cdd364368563332975485ed46eb7c47c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index efabe51a31..df06bf33d4 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,37 +8,37 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2025.02.3</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2025.02.4</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.02.3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.02.4.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.02.3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.02.4.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2025.02.3.tar.gz">buildroot-2025.02.3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.02.3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.02.4.tar.gz">buildroot-2025.02.4.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.02.4.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.02.3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.02.4.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.02.3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.02.4.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.02.3.tar.xz">buildroot-2025.02.3.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.02.3.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.02.4.tar.xz">buildroot-2025.02.4.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.02.4.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index ac4d43aed5..fd8a270651 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.4 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 May 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.4 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.03 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.4/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/b8864d40-6037-4d7e-878a-6674b266c74c@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.4.tar.xz">2025.02.4 release</a>.</p>
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
