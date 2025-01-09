Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAE8C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B51B4FECF;
	Fri, 28 Feb 2025 16:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fa_Soyl5QcvR; Fri, 28 Feb 2025 16:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF6E34FFCB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF6E34FFCB;
	Fri, 28 Feb 2025 16:52:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 149D11DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E377C42F51
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhM-OYcTZLaE for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 764EE4250F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 764EE4250F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E99886612; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jan 2025 16:32:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c04ba4b58090ccf5d1e0b62f992c75e9af1fe98f
X-Git-Newrev: d81b579d990a65689c09c6ae416e6f2402481b00
X-Patchwork-Hint: ignore
Message-Id: <20250228163000.6E99886612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website: Update for
 2024.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d81b579d990a65689c09c6ae416e6f2402481b00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index f6b3bfdeb7..3854f052a9 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2024.11</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2024.11.1</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.11.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.11.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2024.11.tar.gz">buildroot-2024.11.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.11.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.11.1.tar.gz">buildroot-2024.11.1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.11.1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.11.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.11.1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.11.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.11.1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.11.tar.xz">buildroot-2024.11.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.11.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.11.1.tar.xz">buildroot-2024.11.1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.11.1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 <!--
diff --git a/docs/website/news.html b/docs/website/news.html
index b0938135ea..190998f931 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.11.1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 January 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2024.11.1 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2024.11 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/87y0zkhumg.fsf@dell.be.48ers.dk/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.11.1.tar.xz">2024.11.1 release</a>.</p>
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
