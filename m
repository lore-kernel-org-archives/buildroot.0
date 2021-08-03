Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06322C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1CFB600D4
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1CFB600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99B43607AF;
	Tue,  3 Aug 2021 14:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQW228U3G57m; Tue,  3 Aug 2021 14:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFE3A607DA;
	Tue,  3 Aug 2021 14:37:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 507591BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D303401BD
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LyEGJCmZyfo9 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D657402E1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7EE14835CD; Tue,  3 Aug 2021 14:35:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 16:32:35 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 63f326f860a721eac5bf23924db1463da4d6afbd
X-Git-Newrev: f2263ab187379d5852af88a37f52fb1a5ae6dcac
X-Patchwork-Hint: ignore
Message-Id: <20210803143528.7EE14835CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libtipc: renumber
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2263ab187379d5852af88a37f52fb1a5ae6dcac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Commit 883a33ece55c6ef23c33a41196fddabadf140427 forgot to renumber
remaining patches

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bdad2d09e33b06cc8a895c3be5f3a2760b2d4bd9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
