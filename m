Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E592FEC11A
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 22:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A7608382D;
	Tue, 24 Mar 2026 22:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7miR3r9bWwLs; Tue, 24 Mar 2026 22:00:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F80683834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774389617;
	bh=Bwvn3I2IwXtOl28CZt+ikmjks28/s1IUzo9+tyACTLI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XJ2VIfMI7mXX080VIbq1XToxSnUZ6gCfdYUzYZ9JGydHIGbzTctlNy/jhTZQOQD53
	 vmQrphUn9+Ydqh4+EA7uRoI5hclHENjDXT/WuAg+FmsxXvi1HKFcP4bwtILa5cnZYt
	 EkaNglL36ST2VD0amDOXIJXapwZyIuZnBLguU1nYL4XxLNQmfhC3n/GBO4P/btxREb
	 ya0IvD8QH4aoMQ/DPHDxCRtHc4O1CTIZvH16RkOn6H3ZZ+ytLVwRjuXgzcpy/jvJlO
	 bCSePyPb4ITXvS/X69llE0KPv7ZUhGos6XncvJwpd1INLMkLKRCawwwRI71JTzj/8M
	 fe/q1Tv3GCOqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F80683834;
	Tue, 24 Mar 2026 22:00:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3B58353
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 22:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E14BE61003
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 22:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00fWG259YnUG for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 22:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E54E260748
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E54E260748
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 22:00:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EADA84BD0; Tue, 24 Mar 2026 21:22:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Mar 2026 22:14:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e28b94d00820474588c286e09e44e7e706135341
X-Git-Newrev: 50eca46e3571dda2921d0a2a7d2ee9737f2e82eb
X-Patchwork-Hint: ignore
Message-Id: <20260324212247.4EADA84BD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/lts: fix typos
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50eca46e3571dda2921d0a2a7d2ee9737f2e82eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/lts.html | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/website/lts.html b/docs/website/lts.html
index fd684ab3a9..3bfd2a4374 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -29,7 +29,7 @@
                 3-year LTS support
             </h2>
             <p class="br-lts-item-text">
-            Starting with version <code>2025.02</code> the LTS support has been extended to
+            Starting with version <code>2025.02</code>, the LTS support has been extended to
             <strong>3 years</strong>, replacing the previous 1-year cycle.
             </p>
         </div>
@@ -65,7 +65,7 @@
             <p class="br-lts-item-text">
             To ensure a consistent release cadence and maintenance
             workflow, paid LTS stewards are assigned to the weekly LTS
-            maintainance tasks.
+            maintenance tasks.
             </p>
         </div>
     </div>
@@ -96,7 +96,7 @@
     The Buildroot LTS sponsorship initiative has evolved from a more
     comprehensive understanding of the needs of our user base.
     <br/>
-    To address these requirements the release model evolves into the following.
+    To address these requirements, the release model evolves into the following.
     <br/>
     The LTS releases are now extended for a 3-year period. An LTS release
     is started every 2 years.
@@ -177,12 +177,12 @@
     </div>
 
     <p>
-    Each week the LTS stewards defines the set of commits to
-    analyze based on the previous week commits to the master branch. The
+    Each week, the LTS stewards define the set of commits to
+    analyze based on the previous week's commits to the master branch. The
     commits are then annotated to define a list of candidates for the LTS
     branches.
     <br><br>
-    On Thursday the candidates are cherry-picked to a staging branch to be
+    On Thursday, the candidates are cherry-picked to a staging branch to be
     reviewed by the other maintainers. On Thursday evening the branch is
     synced with upstream and contributors are notified. Feedback from
     users, sponsors and autobuilders are then collected and vulnerability
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
