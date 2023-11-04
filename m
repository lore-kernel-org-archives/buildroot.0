Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465BCC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E787D80E60;
	Sat,  4 Nov 2023 21:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E787D80E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3lxy0Yu8VPv; Sat,  4 Nov 2023 21:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A7480D7E;
	Sat,  4 Nov 2023 21:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37A7480D7E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43A181BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07ED441935
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07ED441935
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnLp_8bWbMXX for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:38:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F0B24190C
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F0B24190C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CEB08676E; Sat,  4 Nov 2023 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:37:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96095065c6342f1b622742c4dae82712e192c180
X-Git-Newrev: 0bf73cce2b5c48149b2807354c323ebf6861d07a
X-Patchwork-Hint: ignore
Message-Id: <20231104213844.4CEB08676E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-spake2: update versioneer
 to 0.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bf73cce2b5c48149b2807354c323ebf6861d07a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Versioneer < 0.21 is incompatible with Python 3.12.0. Use the latest version
which is 0.29 as of this commit.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-Update-versioneer-to-0.29.patch           | 2194 ++++++++++++++++++++
 1 file changed, 2194 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
