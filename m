Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B9FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 22:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61662403CF;
	Mon,  3 Jan 2022 22:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKQ_03yUoSKy; Mon,  3 Jan 2022 22:03:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 837A740350;
	Mon,  3 Jan 2022 22:03:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF86C1BF285
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF5334049F
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vy9Bm0pUPXEn for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 22:03:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C1D340343
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 22:03:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 85C9B82DEA; Mon,  3 Jan 2022 21:57:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jan 2022 22:19:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c37cf14c4cd8b4a9ede2ab4aaa39f01b2a1a2bff
X-Git-Newrev: a5c58aff5d4ff44b6b923c4a91e9beb27ee536fc
X-Patchwork-Hint: ignore
Message-Id: <20220103215701.85C9B82DEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: renumber remaining patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5c58aff5d4ff44b6b923c4a91e9beb27ee536fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit [1] removed patch 0001.

[1] 85c7bd0602715dc6a148cc79db8910dca27c4e76

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...efault.patch => 0001-tests-fp-disable-fp-bench-build-by-default.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/qemu/0002-tests-fp-disable-fp-bench-build-by-default.patch b/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
similarity index 100%
rename from package/qemu/0002-tests-fp-disable-fp-bench-build-by-default.patch
rename to package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
