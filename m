Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C54AEE49A6
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6321F40B46;
	Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6321F40B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hU-XCngmZVxl; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB79B4063C;
	Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB79B4063C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0C1E1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C78F34063C
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C78F34063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSwtTvaVAEDn for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CE36405B1
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CE36405B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07BFC86023; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 12:29:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bfa4a7c8f243a0325573da6544543ffdd3ec6743
X-Git-Newrev: 7449146f5996b22d6f3db6ab67d5af3ec23b9ecb
X-Patchwork-Hint: ignore
Message-Id: <20230821200123.07BFC86023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pylibfdt: bump
 version to 1.7.0.post1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7449146f5996b22d6f3db6ab67d5af3ec23b9ecb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christian Stewart <christian@aperture.us>
Tested-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pylibfdt/python-pylibfdt.hash | 4 ++--
 package/python-pylibfdt/python-pylibfdt.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
