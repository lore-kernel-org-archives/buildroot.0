Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FA7D10380
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 21:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EFC88109E;
	Thu, 24 Oct 2024 21:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-WHquMA-Gox; Thu, 24 Oct 2024 21:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278CB8134D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278CB8134D;
	Thu, 24 Oct 2024 21:04:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FD4859BD
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F10B60D77
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aujteV0QO07i for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 21:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E01460E25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E01460E25
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:04:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C36B83695; Thu, 24 Oct 2024 21:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 23:04:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13813027aee94b4e0a8e2a4a195e96fad9b557ef
X-Git-Newrev: bcd0e6f4c208b1697dd783add6ed5a02181de5d2
X-Patchwork-Hint: ignore
Message-Id: <20241024210439.6C36B83695@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: announce Buildroot
 Developers Meeting 2025
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bcd0e6f4c208b1697dd783add6ed5a02181de5d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/news.html | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 0ba48cd93b..74ea4a2167 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">Buildroot Developers Meeting 2025</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 October 2024</small></p>
+      </div>
+      <div class="timeline-body">
+	The Buildroot community is organizing a 3-day <i>Buildroot
+	Developers Meeting</i> on Feb 3-5, 2025, in Brussels (Belgium)
+	right after the <a href="https://fosdem.org/2025/">FOSDEM</a>
+	conference. Buildroot developers and contributors are invited
+	to join to meet together, review and merge pending patches,
+	learn how to contribute, discuss on-going topics and work on
+	specific ideas or
+	issues. See <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2025">the
+	dedicated event page</a> for more details and registration.
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
