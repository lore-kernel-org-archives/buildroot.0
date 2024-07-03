Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2955DC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8F4760E87;
	Wed,  3 Jul 2024 15:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcBHa5iKPJZK; Wed,  3 Jul 2024 15:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE65060ED3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE65060ED3;
	Wed,  3 Jul 2024 15:28:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F1361BF33A
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25D63844A5
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTjzVJjBGlqZ for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5381E8448B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5381E8448B
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49B0B83CE6; Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 17:16:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99b4d8e5db37580f88cd89323868ae3948e22d55
X-Git-Newrev: 62d03fe0d7a5920612caf49da0213366a5efc229
X-Patchwork-Hint: ignore
Message-Id: <20240703152759.49B0B83CE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/contribute.html: mention
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

commit: https://git.buildroot.net/buildroot/commit/?id=62d03fe0d7a5920612caf49da0213366a5efc229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Include sponsoring the Buildroot Association, sponsoring in kind, and
sponsoring Buildroot LTS (through Mind).

This may create a somewhat muddled image so we may need to revisit in
the future how this is formulated.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 docs/website/contribute.html | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index 95028ee788..52c30d60d3 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -7,9 +7,9 @@
   <div class="panel panel-primary">
     <div class="panel-heading">Contribute</div>
     <div class="panel-body">
-      <p>Buildroot is an open source project and you are very welcome to contribute to
-	it.<br />
-	There are many different ways to contribute:</p>
+      <p>Buildroot is an open source project and we warmly welcome your
+        contributions.<br />
+	There are different ways you can get involved:</p>
 
       <ul>
 	<li>Reproducing, analyzing and fixing bugs from our
@@ -37,6 +37,30 @@
     </div>
   </div>
 
+  <div class="panel panel-primary">
+    <div class="panel-heading">Sponsor</div>
+    <div class="panel-body">
+      <p>Besides technical contributions, you can also support the project
+        financially.<br />
+	There are various ways make a financial contribution:</p>
+
+      <ul>
+	<li>Sponsor the <a href="./association.html">Buildroot Association</a>.
+	  The association helps Buildroot with infrastructure (servers, domain
+	  name, ...) and organising meetings. It relies on money from sponsors
+	  to organise those.</li>
+	<li>Practical help: providing a meeting room for developer meetings,
+	  providing autobuilder instances, etc.</li>
+	<li><a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsoring</a>,
+	  a specific effort to finance the maintenance of the Long Term Support
+	  branch of Buildroot.</li>
+      </ul>
+
+      <p>All of these sponsors are thanked by listing them on the <a
+        href="./sponsors.html">sponsors page</a>.</p>
+    </div>
+  </div>
+
 </div><!--/.col-sm-10 -->
 </div><!--/.row -->
 </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
