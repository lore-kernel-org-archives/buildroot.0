Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D556C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3618C41DD0;
	Mon,  6 Nov 2023 21:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3618C41DD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6E2LqYZmf9M; Mon,  6 Nov 2023 21:17:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C4F641DB5;
	Mon,  6 Nov 2023 21:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C4F641DB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8EFE1BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C81664193E
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C81664193E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HT_mIVXudjES for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:16:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9F1441B90
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9F1441B90
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6F4B86A70; Mon,  6 Nov 2023 21:16:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:16:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87cbd8bfb703a69ba01b7219c5992f902e10ac8d
X-Git-Newrev: 646482e339bbac902a8284155066003c4176271e
X-Patchwork-Hint: ignore
Message-Id: <20231106211643.C6F4B86A70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: fix typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=646482e339bbac902a8284155066003c4176271e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Badly introduced in
727c041a25e0c7ad992d0b5ca422d20309ddefe4 ("package/openjdk{-bin}: bump
versions to 17.0.9+9 and 21.0.1+12")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e469b55428..fffd9927a5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -993,7 +993,7 @@ package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch Ups
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch Upstream
 package/open2300/0001-fix-makefile.patch Upstream
 package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
-package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
+package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
 package/openldap/0001-fix_cross_strip.patch Upstream
 package/openldap/0002-fix-bignum.patch Upstream
 package/openldap/0003-disable-docs.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
