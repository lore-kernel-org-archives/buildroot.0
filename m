Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2777C433FE
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:57:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 892C660230
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 892C660230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 636E640479;
	Mon, 25 Oct 2021 18:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8X9SpnPzRe-g; Mon, 25 Oct 2021 18:57:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A965A40247;
	Mon, 25 Oct 2021 18:57:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 198991BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 440C96088B
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OApKZS_jdVg9 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 338FE60890
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AB21A887A9; Mon, 25 Oct 2021 18:53:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 20:53:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df857f6e0fd9d0815c12519ca239de0b0fd2b96b
X-Git-Newrev: 2a884aad2059a622c6aae161af0b61df402098fc
X-Patchwork-Hint: ignore
Message-Id: <20211025185305.AB21A887A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti to
 amarula_rk3288_defconfig and asus_rk3288_defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a884aad2059a622c6aae161af0b61df402098fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Giulio Benetti to amarula_rk3288_defconfig and asus_rk3288_defconfig.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f864f7ef47..0afd0a5d12 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1050,6 +1050,8 @@ F:	package/webp/
 F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
+F:	configs/amarula_vyasa_rk3288_defconfig
+F:	configs/asus_tinker_rk3288_defconfig
 F:	package/at/
 F:	package/binutils/
 F:	package/gcc/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
