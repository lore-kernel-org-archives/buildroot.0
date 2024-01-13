Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91327C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3523E418C9;
	Sat, 13 Jan 2024 13:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3523E418C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTOxZ2JP0RB4; Sat, 13 Jan 2024 13:52:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B9841822;
	Sat, 13 Jan 2024 13:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82B9841822
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A34B1BF2EB
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 042DD826BB
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 042DD826BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QmoCd2S6Cgx7 for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CBA58272A
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CBA58272A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B3BE85FD1; Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 14:19:19 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 9127d414894fb59da31a0c6f6cf951ff6df53961
X-Git-Newrev: d0d3df43224e9127901ec1e412698bfb15db2603
X-Patchwork-Hint: ignore
Message-Id: <20240113135200.4B3BE85FD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/rng-tools: update
 help text website reference
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0d3df43224e9127901ec1e412698bfb15db2603
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

We switched to new upstream since commit f9e9c6349afe0
("package/rng-tools: bump to 6.7"). Update the website URL as well.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 717fe9dc396b3982a02306e8685d8338ae2ebbf6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rng-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index be3f078a0b..7f08fa25fb 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_RNG_TOOLS
 	help
 	  Daemon to use hardware random number generators.
 
-	  http://sourceforge.net/projects/gkernel/
+	  https://github.com/nhorman/rng-tools
 
 if BR2_PACKAGE_RNG_TOOLS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
