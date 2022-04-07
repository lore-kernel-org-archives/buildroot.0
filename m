Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D621CC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 08:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6305440B4A;
	Thu,  7 Apr 2022 08:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YVZiGrZjEN9; Thu,  7 Apr 2022 08:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76D5F40612;
	Thu,  7 Apr 2022 08:37:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 286FB1C115D
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 08:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 168C040282
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 08:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0TDQdp7YltKS for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 08:36:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E308A4022E
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 08:36:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 85DAB836E3; Thu,  7 Apr 2022 08:27:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Apr 2022 10:36:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19e12a006470c41b8ea9d67642fd17f26373c4a1
X-Git-Newrev: e2eb6ed72c54ae88028add934d19d9139ce0ed1e
X-Patchwork-Hint: ignore
Message-Id: <20220407082723.85DAB836E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: update for 2021.02.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2eb6ed72c54ae88028add934d19d9139ce0ed1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 4e153aebb0..8f9f7d7fb3 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.02.12 released, 2021.02.x series EOL</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 April 2022</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2021.02.12 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2021.02.11 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02.12">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2022-April/640389.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.02.12.tar.bz2">2021.02.12 release</a>.</p>
+
+	  <p>Notice that the 2021.02.x series is now end of life. Please migrate to
+	  the 2022.02 series instead which will be supported until April 2023.</p>
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
