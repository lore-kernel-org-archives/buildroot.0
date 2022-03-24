Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72905C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 22:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1927C61047;
	Thu, 24 Mar 2022 22:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZ-CBtI67A2c; Thu, 24 Mar 2022 22:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33B1260A93;
	Thu, 24 Mar 2022 22:32:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63E291BF36A
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5251E842DF
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEnRk4-IQigc for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 22:32:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F53E84283
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 22:32:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3328785CB8; Thu, 24 Mar 2022 22:23:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 23:31:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c6b750201e27cfdf3e0ce23f0bd45b1c62f18c2
X-Git-Newrev: 2a7a2c761745357379d42ee907bd738ed2309db3
X-Patchwork-Hint: ignore
Message-Id: <20220324222320.3328785CB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: update for 2021.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a7a2c761745357379d42ee907bd738ed2309db3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 3b7234b307..146a64d034 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.11.3 released, 2021.11.x series EOL</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 March 2022</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2021.11.3 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2021.11.2 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.11.3">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2022-March/639529.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.11.3.tar.xz">2021.11.3 release</a>.</p>
+
+	  <p>Notice that the 2021.11.x series is now end of life. Please migrate to
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
