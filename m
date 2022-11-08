Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD51CC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55FAA42A5E;
	Mon, 20 Feb 2023 21:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55FAA42A5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQy3t2gKaMa0; Mon, 20 Feb 2023 21:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 557C542A73;
	Mon, 20 Feb 2023 21:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 557C542A73
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 137B91BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96134400AF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96134400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpT3qONzK1Zr for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D37E40C31
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D37E40C31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7550F828C8; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 08:40:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9f6c257638cf2598cad123afa8cdbf84437de072
X-Git-Newrev: 6a0759dd02401e681b008c17b18a9669aba4b8f2
X-Patchwork-Hint: ignore
Message-Id: <20230220205149.7550F828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/boost: fix patch
 formatting issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a0759dd02401e681b008c17b18a9669aba4b8f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit ea38acd17d88b9eaf853313398c772b94338ad47 ("package/boost:
backport development branch changes to fix MIPS64 build failure")
introduced a patch formatting issue detected by check-package. This
commit fixes this issue.

Fixes:

  package/boost/0001-Improve-modfunc-performance.patch:4: generate your patches with 'git format-patch -N'

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3287511158

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/0001-Improve-modfunc-performance.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/0001-Improve-modfunc-performance.patch b/package/boost/0001-Improve-modfunc-performance.patch
index 9cf5d8387e..a34d6bb4d5 100644
--- a/package/boost/0001-Improve-modfunc-performance.patch
+++ b/package/boost/0001-Improve-modfunc-performance.patch
@@ -1,7 +1,7 @@
 From 825aedad557b7e3bb27614335b6ced16887103de Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Ion=20Gazta=C3=B1aga?= <igaztanaga@gmail.com>
 Date: Mon, 7 Nov 2022 00:16:44 +0100
-Subject: [PATCH 1/1] Improve "modfunc" performance Fixes #79
+Subject: [PATCH] Improve "modfunc" performance Fixes #79
  ("boost/intrusive/hashtable.hpp: build failure (undeclared indentifier)")
 
 Backport from Boost development branch to fix issues with some architectures
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
