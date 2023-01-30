Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E535FC54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 22:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C4A6133B;
	Mon, 30 Jan 2023 22:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82C4A6133B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zh4wJCg4umzn; Mon, 30 Jan 2023 22:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD6576132F;
	Mon, 30 Jan 2023 22:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD6576132F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4FF1BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 22:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15541821FF
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 22:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15541821FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yekBdrmQlpr for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 22:01:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2325B821FE
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2325B821FE
 for <buildroot@uclibc.org>; Mon, 30 Jan 2023 22:01:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1pMcD4-0002XA-7J
 for buildroot@uclibc.org; Mon, 30 Jan 2023 23:01:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 30 Jan 2023 23:00:15 +0100
Message-ID: <pan$f3553$692b21af$5c871432$524c2ffc@ID-313208.user.individual.net>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
 <20230130174339.36794-4-bernd.kuhls@t-online.de>
 <20230130221514.2d58df14__31334.1615417571$1675113344$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 4/5] package/intel-mediadriver: bump version
 to 23.1.0
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

Am Mon, 30 Jan 2023 22:15:14 +0100 schrieb Thomas Petazzoni via buildroot:

> Here as well, I'm getting a different hash. Did github change something?

Hi Thomas,

see https://github.com/keybase/client/issues/10800#issuecomment-375831096
and the following discussion :(

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
