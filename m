Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C4CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:20:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7E5061056
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7E5061056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A80E960B93;
	Sun, 12 Sep 2021 20:20:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kRng_erur9Vo; Sun, 12 Sep 2021 20:20:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8F8560767;
	Sun, 12 Sep 2021 20:20:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC7BB1BF404
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F00E140490
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYodLe86rU-7 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:16:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ED624049C
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6A0408A4CB; Sun, 12 Sep 2021 20:14:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 21:28:27 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 88f215964e90f32756c9c7729ac74e2fc4fd5c81
X-Git-Newrev: 5cb48c2a2c2ca81f866ed5f3372dc95d19bc7de5
X-Patchwork-Hint: ignore
Message-Id: <20210912201458.6A0408A4CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] DEVELOPERS: add myself to
 harfbuzz package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5cb48c2a2c2ca81f866ed5f3372dc95d19bc7de5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Add myself to harfbuzz package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8bea006e6b113de507392dc377df01c881728f73)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 53448dd100..9598b64a4a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1054,6 +1054,7 @@ N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	package/at/
 F:	package/binutils/
 F:	package/gcc/
+F:	package/harfbuzz/
 F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
