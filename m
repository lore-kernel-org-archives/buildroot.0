Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B612C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:36:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 323C560295
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 323C560295
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1184960B08;
	Wed,  4 Aug 2021 00:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apPWu0BxwqPC; Wed,  4 Aug 2021 00:36:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69CCE60E4A;
	Wed,  4 Aug 2021 00:36:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 479111BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E9E040EE1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LbO-PdmwkYxT for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D23040F62
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 750D185445; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:25:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d2069158f3ddf9159c96e25288adc8377390f7ed
X-Git-Newrev: 54edfa0c92eefef14712e6739823ae13d745f709
X-Patchwork-Hint: ignore
Message-Id: <20210803211018.750D185445@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: Add myself as
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

commit: https://git.buildroot.net/buildroot/commit/?id=54edfa0c92eefef14712e6739823ae13d745f709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 596670993a..f722ec9611 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2184,6 +2184,7 @@ F:	package/libtirpc/
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
