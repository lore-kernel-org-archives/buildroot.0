Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1D3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 08:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A3AD401AE;
	Sat,  8 Jan 2022 08:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XkmgbN90sXfu; Sat,  8 Jan 2022 08:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5616B40124;
	Sat,  8 Jan 2022 08:17:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 978FB1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 08:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B15B4023F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 08:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id naYx6tU5ngTd for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 08:17:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C81D640124
 for <buildroot@uclibc.org>; Sat,  8 Jan 2022 08:17:08 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1n66uQ-0000YO-ED
 for buildroot@uclibc.org; Sat, 08 Jan 2022 09:17:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 08 Jan 2022 09:16:45 +0100
Message-ID: <pan$ad6f$72209134$4bca0ad5$259acad9@ID-313208.user.individual.net>
References: <20211106111145.1648068-1-bernd.kuhls@t-online.de>
 <20211106111145.1648068-3-bernd.kuhls@t-online.de>
 <87bl0njfg0.fsf__32796.2444674753$1641597992$gmane$org@dell.be.48ers.dk>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH v2 3/3] package/freeswitch: bump version to
 1.10.7
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

Am Sat, 08 Jan 2022 00:26:07 +0100 schrieb Peter Korsgaard:

> This series was marked as superseeded in patchwork, but I applied it
> anyway as freeswitch 1.10.7 fixes a number of fairly serious security
> issues. Was there any specific reason why this was marked as
> superseeded?

Hi Peter,

when posting the series I had not conducted a thorough runtime test. In 
expectation of more backported patches needed from upstream I marked the 
series as superseeded and lost track of the topic in the meantime.

But do not worry, the current package is fine, no other backported 
patches are needed for my usecase.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
