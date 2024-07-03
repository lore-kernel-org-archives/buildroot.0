Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6C7C3271F
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1328D60F61;
	Wed,  3 Jul 2024 15:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CI-wu0IEfHVN; Wed,  3 Jul 2024 15:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB8B260FEB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB8B260FEB;
	Wed,  3 Jul 2024 15:28:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9CD1BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7896F4180F
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQxIJoLyZ3nl for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F4541803
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69F4541803
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6179483CEA; Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 17:17:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62d03fe0d7a5920612caf49da0213366a5efc229
X-Git-Newrev: 9b5ad726619d9c23b07bcf9295efbf1db28a6b0c
X-Patchwork-Hint: ignore
Message-Id: <20240703152759.6179483CEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/support.html: mention
 sponsoring opportunities
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b5ad726619d9c23b07bcf9295efbf1db28a6b0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an entry for the sponsored LTS.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 docs/website/support.html | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/docs/website/support.html b/docs/website/support.html
index 0bcf365332..a94e5ef780 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -94,6 +94,29 @@
     </div>
   </div>
 
+  <div class="panel panel-primary">
+    <div class="panel-heading">Buildroot LTS</div>
+    <div class="panel-body">
+      <p>Buildroot's Long Term Support (LTS) branch is maintained thanks to the
+	<a href="https://mind.be/buildroot-lts">LTS Sponsoring program</a>. Its
+	goal is	to provide three or more years of stable support for your
+	Buildroot deployments. The success of this venture depends on the
+	generosity of sponsors like you, willing to make a change and ensuring
+	the longevity of Buildroot's reliability.</p>
+      <p>Prior to this initiative, LTS maintenance was handled by volunteers.
+        As a result, it was limited to just one year. In addition, it diverted
+        maintainer time away from mainline development, slowing  down the overall
+        progress of the project.</p>
+      <p>Thanks to LTS sponsoring, the entire community gets access to a better
+        and longer maintained LTS branch. The sponsors get access to some
+        additional perks, such as selecting which packages to focus on, reports
+        with information that is relevant for you, and direct contact with the
+        LTS maintainers.</p>
+      <p style="text-align: center;"><a href="https://mind.be/buildroot-lts">Ready
+        to sponsor?</a></p>
+    </div>
+  </div>
+
   <div class="panel panel-primary">
     <div class="panel-heading">Commercial support</div>
     <div class="panel-body">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
