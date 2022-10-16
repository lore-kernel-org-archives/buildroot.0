Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FAEC4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 15:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6664640906;
	Sun, 16 Oct 2022 15:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6664640906
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1AaXbfsl_-I; Sun, 16 Oct 2022 15:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EF20408F3;
	Sun, 16 Oct 2022 15:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EF20408F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80AEF1BF2FA
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B195408F3
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B195408F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sxm3mynjNEox for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 15:22:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B5C040905
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B5C040905
 for <buildroot@uclibc.org>; Sun, 16 Oct 2022 15:22:31 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1ok5TA-0008Ot-L4
 for buildroot@uclibc.org; Sun, 16 Oct 2022 17:22:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Oct 2022 17:21:52 +0200
Message-ID: <pan$890fa$74f2a20d$db15513a$c5d0dcdd@ID-313208.user.individual.net>
References: <20221016080629.3354482-1-clabbe__38958.9544081659$1665907620$gmane$org@baylibre.com>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH] package/ffmpeg: handle new SDL2 version
 scheme
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

Am Sun, 16 Oct 2022 08:06:29 +0000 schrieb Corentin Labbe:

> Current ffmpeg package does not install ffplay.
> The root cause is that ffmpeg configure does not detect SDL2 due to
> version mismatch.
> The patch fixing that is taken from gentoo portage tree.

Hi,

this patch is also included in the new version:
http://patchwork.ozlabs.org/project/buildroot/patch/
20221016152034.1161161-1-bernd.kuhls@t-online.de/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
