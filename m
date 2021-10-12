Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C62C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 06:13:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FDA260ED4
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 06:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FDA260ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AAB6401B2;
	Tue, 12 Oct 2021 06:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9zYgSzoV8ou5; Tue, 12 Oct 2021 06:13:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E4D640257;
	Tue, 12 Oct 2021 06:13:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCF071BF9B9
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 06:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7698607F1
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 06:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oN70X-A_TUEp for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 06:13:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D317960708
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 06:13:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B3F38954A1; Tue, 12 Oct 2021 06:10:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 08:12:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cfba9b0c0d70a20d0201017798f5f26786bba133
X-Git-Newrev: 7f81fc437020e8a9f62ac42fbdc7fe9e66611116
X-Patchwork-Hint: ignore
Message-Id: <20211012061029.B3F38954A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: update for 2021.05.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f81fc437020e8a9f62ac42fbdc7fe9e66611116
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index bf64fee3aa..926e75b400 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.05.3 released, 2021.05.x series EOL</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 October 2021</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2021.05.3 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2021.05.2 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.05.3">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2021-October/625646.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.05.3.tar.bz2">2021.05.3 release</a>.</p>
+
+	  <p>Notice that the 2021.05.x series is now end of life. Please migrate to
+	  the 2021.08 series instead which will be supported until December 2021.</p>
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
