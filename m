Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1228DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 22:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92CD48186B;
	Tue, 14 Dec 2021 22:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07hurQdxUItM; Tue, 14 Dec 2021 22:26:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDC23814B6;
	Tue, 14 Dec 2021 22:26:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B1471BF9B4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2978960D63
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctJ5tA32I7yk for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 22:26:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A68860D5D
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 22:26:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3FCF681FB5; Tue, 14 Dec 2021 22:21:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 23:11:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae48261ff493674a5d71d5a203e60cb38e409889
X-Git-Newrev: d2dc1ca3c75fdda87a68b836a83f05f23446f2d5
X-Patchwork-Hint: ignore
Message-Id: <20211214222117.3FCF681FB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: update for 2021.08.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2dc1ca3c75fdda87a68b836a83f05f23446f2d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 370ded63eb..c3e105832c 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.08.3 released, 2021.08.x series EOL</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 December 2021</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2021.08.3 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2021.08.2 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.08.3">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lists.buildroot.org/pipermail/buildroot/2021-December/630775.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.08.3.tar.bz2">2021.08.3 release</a>.</p>
+
+	  <p>Notice that the 2021.08.x series is now end of life. Please migrate to
+	  the 2021.11 series instead which will be supported until April 2022.</p>
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
