Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757C1C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6595160EFD;
	Wed,  3 Jul 2024 15:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kGeVeOGdRSf; Wed,  3 Jul 2024 15:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EA8360F19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EA8360F19;
	Wed,  3 Jul 2024 15:28:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73BF51BF980
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60A584044F
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8Edn-NqNUFr for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 531464011B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 531464011B
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3900C83CD0; Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 17:16:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dbfae96b9232eb5aae8d9ce9cc583b02607246d
X-Git-Newrev: 99b4d8e5db37580f88cd89323868ae3948e22d55
X-Patchwork-Hint: ignore
Message-Id: <20240703152759.3900C83CD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: announce LTS
 Sponsoring
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99b4d8e5db37580f88cd89323868ae3948e22d55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although the next commits will also add more information about the LTS
sponsoring in other places on the website, link directly to the landing
page on the Mind website.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 docs/website/news.html | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 9abdf8f720..7e66d02331 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-euro"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">LTS Sponsoring announced</h4>
+      </div>
+      <div class="timeline-body">
+	<p>We are excited to share that we have launched the Buildroot Long
+	  Term Support (LTS) Sponsoring Project!</p>
+	<p>This initiative comes from a place where we understand the critical
+	  need for extended support which is beyond volunteering. That's why
+	  we are calling all Buildroot users and enthusiasts to come together
+	  and join this initiative that's shaping the future of Buildroot.</p>
+	<p>
+	<p>Find more information on the
+	  <a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsoring
+	  page</a>.</p>
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
