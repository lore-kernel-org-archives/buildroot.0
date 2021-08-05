Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B443C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:43:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5CAB60F02
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5CAB60F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EBAA4035F;
	Thu,  5 Aug 2021 19:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRW1EKeSPdLT; Thu,  5 Aug 2021 19:43:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9587C40287;
	Thu,  5 Aug 2021 19:43:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E089C1BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D063483B7A
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aziUV4TC8xz7 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:43:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1829383B5A
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:43:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C6A138B8E4; Thu,  5 Aug 2021 19:43:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 20:52:08 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: f57f74c0b923cd021e367ae48692ed232fdd8939
X-Git-Newrev: 15b1a0b6572263740f74d15161fcda6223755931
X-Patchwork-Hint: ignore
Message-Id: <20210805194318.C6A138B8E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] DEVELOPERS: Add myself as
 rpcbind maintainer
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

commit: https://git.buildroot.net/buildroot/commit/?id=15b1a0b6572263740f74d15161fcda6223755931
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 54edfa0c92eefef14712e6739823ae13d745f709)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 51750927fc..b84015216e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2150,6 +2150,7 @@ F:	package/libtirpc/
 F:	package/linux-backports/
 F:	package/ltp-testsuite/
 F:	package/nfs-utils/
+F:	package/rpcbind/
 F:	support/kconfig/
 
 N:	Phil Eichinger <phil.eichinger@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
