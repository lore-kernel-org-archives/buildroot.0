Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9070CC30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B18560EEE;
	Wed,  3 Jul 2024 15:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0xKkW1Ij5vH; Wed,  3 Jul 2024 15:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 036D460EF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 036D460EF3;
	Wed,  3 Jul 2024 15:28:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A94F1BF33A
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5863E60E87
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPHW9-JLIpLZ for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BE0D6082F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BE0D6082F
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 765E083CD0; Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 17:25:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b5ad726619d9c23b07bcf9295efbf1db28a6b0c
X-Git-Newrev: 7f387103d86294c65cbca6eb859df6ff2429b255
X-Patchwork-Hint: ignore
Message-Id: <20240703152759.765E083CD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/sponsors.html: mention LTS
 sponsors
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f387103d86294c65cbca6eb859df6ff2429b255
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the LTS sponsoring program hasn't started yet (it will hopefully
start in September), this is just placeholder text. The first paragraph
will stay however.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 docs/website/sponsors.html | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index a90ca6c8df..bfb83663c6 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -4,6 +4,17 @@
 <div class="row nh"><!-- current sponsor row -->
 <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
 
+    <div class="panel panel-primary">
+    <div class="panel-heading">LTS sponsors</div>
+    <div class="panel-body">
+      <p>The maintenance of the Long Term Support branch of Buildroot is
+         possible thanks to the sponsors of the
+         <a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsoring
+         Program</a>.</p>
+      <p>When the Buildroot LTS Sponsoring program will be operational
+         later in 2024, those sponsors will be mentioned here.</p>
+    </div>
+
     <div class="panel panel-primary">
     <div class="panel-heading">Current sponsors</div>
     <div class="panel-body">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
