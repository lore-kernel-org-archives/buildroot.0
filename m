Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C1FC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 14:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B2D1410AC;
	Sun, 19 Mar 2023 14:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B2D1410AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYyERYJFD4sT; Sun, 19 Mar 2023 14:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8544410B0;
	Sun, 19 Mar 2023 14:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8544410B0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0C9B1BF86D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 14:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87940410AC
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 14:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87940410AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfXfO4sYdF6l for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 14:00:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98198410A5
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 14:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98198410A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 856EE8734F; Sun, 19 Mar 2023 14:00:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 14:58:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ad6d0dea57cdc0099399c67f68ccf5e693c9da6
X-Git-Newrev: 48781ec9604834a8e5f0acbe2d71a0c469b54fed
X-Patchwork-Hint: ignore
Message-Id: <20230319140059.856EE8734F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: update for 2022.02.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=48781ec9604834a8e5f0acbe2d71a0c469b54fed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 05d06c6d96..257678465a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.02.11 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 March 2023</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2022.02.11 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2022.02.10 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.02.11">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/874jqhxbnr.fsf@dell.be.48ers.dk/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.02.11.tar.xz">2022.02.11 release</a>.</p>
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
