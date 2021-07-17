Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B5BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:02:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0131160ED6
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0131160ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE5BB40585;
	Tue,  3 Aug 2021 22:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlVEBXBKunlg; Tue,  3 Aug 2021 22:02:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 417BA4057E;
	Tue,  3 Aug 2021 22:02:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FFEF1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97BBB40565
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_a0CZ-qmnT3 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C97C40235
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 578A386A84; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 10:01:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b991962993357092625e5b18d8203acd1e9b8b1f
X-Git-Newrev: bdad2d09e33b06cc8a895c3be5f3a2760b2d4bd9
X-Patchwork-Hint: ignore
Message-Id: <20210803211005.578A386A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libtipc: renumber
 patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdad2d09e33b06cc8a895c3be5f3a2760b2d4bd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 883a33ece55c6ef23c33a41196fddabadf140427 forgot to renumber
remaining patches

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ch => 0001-Automatically-generate-XDR-header-files-from-.x-sour.patch} | 0
 ...ch => 0002-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libtirpc/0003-Automatically-generate-XDR-header-files-from-.x-sour.patch b/package/libtirpc/0001-Automatically-generate-XDR-header-files-from-.x-sour.patch
similarity index 100%
rename from package/libtirpc/0003-Automatically-generate-XDR-header-files-from-.x-sour.patch
rename to package/libtirpc/0001-Automatically-generate-XDR-header-files-from-.x-sour.patch
diff --git a/package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch b/package/libtirpc/0002-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
similarity index 100%
rename from package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
rename to package/libtirpc/0002-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
