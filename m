Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EEAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 20:13:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E178A60C4A
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 20:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E178A60C4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 921BB40206;
	Thu, 28 Oct 2021 20:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_cxjl3n_eCw; Thu, 28 Oct 2021 20:13:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCAA4401F1;
	Thu, 28 Oct 2021 20:13:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9143F1BF3A8
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 20:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80EF460805
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 20:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-Ssv5lK9wm8 for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 20:13:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC58F60664
 for <buildroot@uclibc.org>; Thu, 28 Oct 2021 20:13:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1mgBlt-0001bh-Ha
 for buildroot@uclibc.org; Thu, 28 Oct 2021 22:13:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 28 Oct 2021 22:12:47 +0200
Message-ID: <vqcr4ixq67.ln2@ID-313208.user.individual.net>
References: <20211015162612.1662548-1-bernd.kuhls@t-online.de>
 <20211018220002.4301fda1__48889.7956720152$1634587229$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.147 (Sweet Solitude; afc1447)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.2.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mon, 18 Oct 2021 22:00:02 +0200 schrieb Thomas Petazzoni:

> Thanks a lot for this update, but in 2021, we really want patches
> against packages that are developed with Git to be generated with "git
> format-patch", and also it should have an upstream status (submitted
> upstream, as mesa3d is active). It also needs a decent explanation other
> than just "remove code to fix build".

Hi Thomas,

sent v2: http://patchwork.ozlabs.org/project/buildroot/patch/
20211028194921.1263869-1-bernd.kuhls@t-online.de/

Regarding the patch I am unsure whether I found the correct description 
as I do not understand the problem, for example where is __STDC_VERSION__ 
defined? Shall I sent the upstream in its current state?

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
