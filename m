Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117CAC7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 16:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 681ED40BD6;
	Fri,  9 Jun 2023 16:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 681ED40BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fiy4N7r_vCQf; Fri,  9 Jun 2023 16:13:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99B52419F4;
	Fri,  9 Jun 2023 16:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B52419F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54BBD1BF2AA
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E7F384265
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E7F384265
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H7TiJ8twkZHH for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 16:13:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D9AD8426A
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 16:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D9AD8426A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 432DD8262B; Fri,  9 Jun 2023 16:13:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 16:48:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35b1ddbe635c11c7c60f51cbe9203a8f68e24857
X-Git-Newrev: e4ac14e09a57667168278187331cdf7238b80324
X-Patchwork-Hint: ignore
Message-Id: <20230609161307.432DD8262B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bootgen: bump to xilinx_v2023.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4ac14e09a57667168278187331cdf7238b80324
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps bootgen to version xilinx_v2023.1.
The patch for build machines with modern flex is no longer needed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   1 -
 ...01-Fix-build-on-machines-with-modern-flex.patch | 133 ---------------------
 package/bootgen/bootgen.hash                       |   2 +-
 package/bootgen/bootgen.mk                         |   2 +-
 4 files changed, 2 insertions(+), 136 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
