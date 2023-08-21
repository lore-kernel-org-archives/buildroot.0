Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E761EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2934B41176;
	Mon, 21 Aug 2023 20:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2934B41176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0P21oj3WCyx; Mon, 21 Aug 2023 20:21:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AA4641500;
	Mon, 21 Aug 2023 20:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA4641500
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BA341BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF99F414EA
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF99F414EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id coEXc3EQEnoA for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9C6E4167E
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9C6E4167E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7A4486023; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 21:36:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bdd80863cf81a5b9034903ee1954d41a7ebbd1e7
X-Git-Newrev: 2423d9f16b26e54e0e40fdcc01cc43a629561340
X-Patchwork-Hint: ignore
Message-Id: <20230821200127.E7A4486023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Merge tag '2023.08-rc2' into
 next
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

commit: https://git.buildroot.net/buildroot/commit/?id=2423d9f16b26e54e0e40fdcc01cc43a629561340
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Conflicts:
  - .checkpackageignore
  - Makefile
  - board/versal/post-image.sh
  - package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch
      => keep version in next

  - Config.in.legacy
      => merge, introduce legacy comment for 2023.11

  - toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
      => regenerate, drop dependency on inexistant BR2_ARCH_NEEDS_GCC_AT_LEAST_14

Patch is too large, so refusing to show it
Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
