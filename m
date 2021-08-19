Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F3CC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:40:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B3896108B
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B3896108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12AFD8169B;
	Thu, 19 Aug 2021 20:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faboIy3t5P8s; Thu, 19 Aug 2021 20:40:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D1AA80EA1;
	Thu, 19 Aug 2021 20:40:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6ABF21BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66EA481A16
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fd1-Kc8Xat9W for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:40:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 744B981819
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:40:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2DCE68D548; Thu, 19 Aug 2021 20:39:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:39:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f591542452f2af2bb333dc24b34e85f6921ece4
X-Git-Newrev: 8d0fcab12831140a409971d7cb4ecf95c874a5f9
X-Patchwork-Hint: ignore
Message-Id: <20210819203915.2DCE68D548@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add myself to toolchain
 topics/packages
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8d0fcab12831140a409971d7cb4ecf95c874a5f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since I've dealt and deal with toolchain bugs and their work-around
very often add myself to toolchain topic(toolchain/) as well as
package/binutils and package/gcc.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index af97de02de..5f90dbfc1f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1052,6 +1052,8 @@ F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	package/at/
+F:	package/binutils/
+F:	package/gcc/
 F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
@@ -1060,6 +1062,7 @@ F:	package/nfs-utils/
 F:	package/sunxi-mali-mainline/
 F:	package/sunxi-mali-mainline-driver/
 F:	package/udisks/
+F:	toolchain/
 
 N:	Gregory Dymarek <gregd72002@gmail.com>
 F:	package/ding-libs/
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
