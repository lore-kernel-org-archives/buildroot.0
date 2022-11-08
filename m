Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4DCC4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 07:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BDC2410A0;
	Tue,  8 Nov 2022 07:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BDC2410A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HycZTJ8WJbYX; Tue,  8 Nov 2022 07:42:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51A11409E7;
	Tue,  8 Nov 2022 07:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51A11409E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 159B81BF35E
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 07:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F10A2409C3
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 07:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F10A2409C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPydY5_XWaeK for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 07:42:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3FB140384
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 07:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3FB140384
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0A6688123; Tue,  8 Nov 2022 07:42:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 08:40:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f6c257638cf2598cad123afa8cdbf84437de072
X-Git-Newrev: 6a0759dd02401e681b008c17b18a9669aba4b8f2
X-Patchwork-Hint: ignore
Message-Id: <20221108074200.E0A6688123@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: fix patch formatting issue
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
