Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE20CF3962
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 20:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CC6943346;
	Thu, 19 Sep 2024 20:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OqXoO5sj4E9; Thu, 19 Sep 2024 20:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C74843348
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C74843348;
	Thu, 19 Sep 2024 20:01:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 215051BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA02C41877
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vzxd_mkLA2Gq for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F9B04187C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F9B04187C
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C2A483D90; Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:55:54 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 5ce885b30b80b1d532f3f9a0b69e792a295b43cd
X-Git-Newrev: 7cedebe44eaad7d1171d851a917340703eaf7b1a
X-Patchwork-Hint: ignore
Message-Id: <20240919195949.0C2A483D90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/lbreakout2: fix
 typos in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cedebe44eaad7d1171d851a917340703eaf7b1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2e868977128db012764e491b9b7dc4978efacbd0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
