Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA2BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 06:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 918CF408F5;
	Mon,  3 Oct 2022 06:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 918CF408F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KgWPD_CQVuV; Mon,  3 Oct 2022 06:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C59D401E5;
	Mon,  3 Oct 2022 06:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C59D401E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDC281BF275
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 06:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A810840200
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 06:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A810840200
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAQTqDbe-J0i for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 06:53:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77EC5401E5
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 06:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77EC5401E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 653F1867B5; Mon,  3 Oct 2022 06:53:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Oct 2022 08:52:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1648c2ec369b00c3beae353a1053961fe7d0e42d
X-Git-Newrev: 84b29a39416012e316da70dc0ad18b5887521422
X-Patchwork-Hint: ignore
Message-Id: <20221003065325.653F1867B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: update for 2022.08.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=84b29a39416012e316da70dc0ad18b5887521422
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index b28c3a54d7..d1eeaba5ee 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2022.08</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2022.08.1</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.08.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.08.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2022.08.tar.gz">buildroot-2022.08.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.08.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.08.1.tar.gz">buildroot-2022.08.1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.08.1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.08.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.08.1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.08.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.08.1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.08.tar.xz">buildroot-2022.08.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.08.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.08.1.tar.xz">buildroot-2022.08.1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.08.1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 <!--
diff --git a/docs/website/news.html b/docs/website/news.html
index 07ca3c0ac1..ecd578fd6f 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.05.1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 October 2022</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2022.08.1 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2022.08 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.08.1">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2022-October/652816.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.08.1.tar.xz">2022.08.1 release</a>.</p>
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
