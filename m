Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D5FC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86DC821EF;
	Sat,  4 Nov 2023 21:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D86DC821EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMFtz6wxKtlQ; Sat,  4 Nov 2023 21:38:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B26D821CB;
	Sat,  4 Nov 2023 21:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B26D821CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43B991BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 294654193C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 294654193C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6AsYG8ndQ7q for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:38:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35BFF418FE
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35BFF418FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24B2E8676E; Sat,  4 Nov 2023 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:37:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e934b72044e8a08d777d0691d1321b65645ee73
X-Git-Newrev: da63c87c8a88c8de4a44803611e0ba2685564fec
X-Patchwork-Hint: ignore
Message-Id: <20231104213844.24B2E8676E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-magic-wormhole: update
 versioneer to 0.29
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=da63c87c8a88c8de4a44803611e0ba2685564fec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Versioneer < 0.21 is incompatible with Python 3.12.0. Use the latest version
which is 0.29 as of this commit.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-Update-versioneer-to-0.29.patch           | 2185 ++++++++++++++++++++
 1 file changed, 2185 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
