Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CA2C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E51084C57;
	Fri, 28 Feb 2025 16:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ladP-KxhQjkk; Fri, 28 Feb 2025 16:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EA0384C23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA0384C23;
	Fri, 28 Feb 2025 16:52:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17E83711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3378A42F56
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJpwooML3wqQ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5268E42CF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5268E42CF3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4176486612; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jan 2025 15:05:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ccd83cef2fa9a4be534fc2ac737812a1b2fd8dce
X-Git-Newrev: 9d3d12b6b5996e2a6f6bb90908613036cf70d6c1
X-Patchwork-Hint: ignore
Message-Id: <20250228163000.4176486612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website: Update for
 2024.02.10
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9d3d12b6b5996e2a6f6bb90908613036cf70d6c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 83b045d9a5..f6b3bfdeb7 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,37 +8,37 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2024.02.9</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2024.02.10</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.02.9.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.02.9.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2024.02.9.tar.gz">buildroot-2024.02.9.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.02.9.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.02.10.tar.gz">buildroot-2024.02.10.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.02.10.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.02.9.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.02.10.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.02.9.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.02.10.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.02.9.tar.xz">buildroot-2024.02.9.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.02.9.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.02.10.tar.xz">buildroot-2024.02.10.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.02.10.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 7324f09126..b0938135ea 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.02.10 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 January 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2024.02.10 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2024.02.9 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02.10/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/8734hsjdak.fsf@dell.be.48ers.dk/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.02.10.tar.xz">2024.02.10 release</a>.</p>
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
