Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C04C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 06:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1635541987;
	Wed, 17 Aug 2022 06:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1635541987
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mc3cP584nEPW; Wed, 17 Aug 2022 06:41:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D57A4197D;
	Wed, 17 Aug 2022 06:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D57A4197D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E20051BF9C6
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDB624051D
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDB624051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_hEYrNZW4oo for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 06:41:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A7D4404E2
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 06:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A7D4404E2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CAE0E87944; Wed, 17 Aug 2022 06:26:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 08:41:02 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 37a853accc702892da6a5871bffebe29052c9be1
X-Git-Newrev: 3d01735b5ae5444dc5c0f21c6c6ff6cf081c4991
X-Patchwork-Hint: ignore
Message-Id: <20220817062648.CAE0E87944@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/glibc: really
 move microblaze patch to the correct location for 2022.02.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d01735b5ae5444dc5c0f21c6c6ff6cf081c4991
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The patch was moved locally, but the commit not amended. Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch b/package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch
similarity index 100%
rename from package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch
rename to package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
