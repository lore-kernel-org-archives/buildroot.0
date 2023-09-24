Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10581CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 17:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BB4941753;
	Sun, 24 Sep 2023 17:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BB4941753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hg9FUfxqjr5r; Sun, 24 Sep 2023 17:21:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C15B41750;
	Sun, 24 Sep 2023 17:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C15B41750
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8BC91BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 17:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D23E41750
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 17:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D23E41750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rfZT4mDLubv for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 17:21:11 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5304A4174F
 for <buildroot@uclibc.org>; Sun, 24 Sep 2023 17:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5304A4174F
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qkSn6-0009di-6a
 for buildroot@uclibc.org; Sun, 24 Sep 2023 19:21:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 24 Sep 2023 19:20:53 +0200
Message-ID: <pan$86ec1$f0965aa5$21c4e56d$f81dbe7e@ID-313208.user.individual.net>
References: <20230924162909.1019467-1-fontaine.fabrice__40740.243210324$1695572981$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: drop
 PPPD_DROP_INTERNAL_IF_PPOL2TP_H
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

Am Sun, 24 Sep 2023 18:29:09 +0200 schrieb Fabrice Fontaine:

> PPPD_DROP_INTERNAL_IF_PPOL2TP_H is not needed since bump to version
> 2.4.6 in commit 49b239ab20e632792a6c61173ba830cdc2128ebf and
> https://github.com/ppp-project/ppp/commit/
c41092dd4c49267f232f6cba3d31c6c68bfdf68d

Hi Fabrice,

your patch is part of my patch bumping pppd to 2.5.0:
https://patchwork.ozlabs.org/project/buildroot/patch/
20230726060041.4434-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
