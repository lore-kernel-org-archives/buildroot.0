Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED991C02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6C7A8472F;
	Sat, 14 Sep 2024 08:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIjocbqzT_9y; Sat, 14 Sep 2024 08:23:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E95D84721
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E95D84721;
	Sat, 14 Sep 2024 08:23:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A59F1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FD4F4023E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPSV3Fzcc3Xf for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94042403EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94042403EB
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ED6086F5C; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 10:19:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98e1dae3a39c622d755ada474c693e33109a47d5
X-Git-Newrev: 2e868977128db012764e491b9b7dc4978efacbd0
X-Patchwork-Hint: ignore
Message-Id: <20240914082254.7ED6086F5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lbreakout2: fix typos in help text
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2e868977128db012764e491b9b7dc4978efacbd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lbreakout2/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lbreakout2/Config.in b/package/lbreakout2/Config.in
index eeb8a06966..3397df97b9 100644
--- a/package/lbreakout2/Config.in
+++ b/package/lbreakout2/Config.in
@@ -5,9 +5,9 @@ config BR2_PACKAGE_LBREAKOUT2
 	help
 	  LBreakout2 is the successor to LBreakout, a breakout-style
 	  arcade game in the manner of Arkanoid. Requires SDL, libpng,
-	  and optionnally SDL_mixer/SDL_net.
+	  and optionally SDL_mixer/SDL_net.
 	  A display with minimum 640x480 resolution, a keyboard and a
-	  mouse are recommanded.
+	  mouse are recommended.
 
 	  http://lgames.sourceforge.net/index.php?project=LBreakout2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
