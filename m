Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6E5C7EE29
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 15:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA5258434F;
	Sat, 10 Jun 2023 15:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA5258434F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Zz-M3EgrH0g; Sat, 10 Jun 2023 15:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D75184345;
	Sat, 10 Jun 2023 15:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D75184345
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAE7D1BF38C
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 15:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B40942128
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 15:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B40942128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2sLEaU4TELqL for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 15:56:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5491C42099
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5491C42099
 for <buildroot@uclibc.org>; Sat, 10 Jun 2023 15:56:44 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1q80xF-0001dW-1x
 for buildroot@uclibc.org; Sat, 10 Jun 2023 17:56:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2023 17:56:22 +0200
Message-ID: <pan$2a7e9$6f38f77b$73afc9f5$bd7b79c@ID-313208.user.individual.net>
References: <20230610135318.1721136-1-francois.perrad__10174.8896575131$1686405233$gmane$org@gadz.org>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH] package/libgcrypt: bump to version 1.10.2
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

Am Sat, 10 Jun 2023 15:53:18 +0200 schrieb Francois Perrad:

> Signed-off-by: Francois Perrad
> <francois.perrad@gadz.org>

Hi Francois,

your patch is a duplicate of https://patchwork.ozlabs.org/project/
buildroot/patch/20230608185255.3505647-2-bernd.kuhls@t-online.de/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
