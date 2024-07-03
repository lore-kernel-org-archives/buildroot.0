Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84096C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52E7461002;
	Wed,  3 Jul 2024 15:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTl0YMcoM1Hq; Wed,  3 Jul 2024 15:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 986CC61009
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 986CC61009;
	Wed,  3 Jul 2024 15:28:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 768431BF33A
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 609A08448B
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-2myKVbUgWt for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D9678449F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D9678449F
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8826C83CE6; Wed,  3 Jul 2024 15:27:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 17:27:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f387103d86294c65cbca6eb859df6ff2429b255
X-Git-Newrev: b1dcf1dbfdc2f95e1763892b947b4eab6d9f4da8
X-Patchwork-Hint: ignore
Message-Id: <20240703152759.8826C83CE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: update link to mind support
 website
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1dcf1dbfdc2f95e1763892b947b4eab6d9f4da8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Mind website changed more than a year ago, and the link on the
support page no longer works. Link to a different page instead.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 docs/website/support.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index a94e5ef780..96b9a60b18 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -130,7 +130,7 @@
 	    <a href="https://bootlin.com/engineering/">
 	      <img src="images/bootlin-logo.png" style="max-width:200px; margin-right:40px;"/>
 	    </a>
-	    <a href="https://mind.be/services/buildroot.html">
+	    <a href="https://mind.be/about-us/#anchor-open-source">
 	      <img src="images/mind-logo.png" style="max-width:200px; margin-right:40px;"/>
 	    </a>
 	    <a href="https://www.smile.eu/en/offers/embedded-iot">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
