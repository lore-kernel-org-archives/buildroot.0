Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FC3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 271674014B;
	Thu, 16 Dec 2021 18:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TAE1ebhNCUj7; Thu, 16 Dec 2021 18:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52875401AD;
	Thu, 16 Dec 2021 18:13:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A07B81BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D856401AD
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLr0C6h00ny5 for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:13:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F53B4014B
 for <buildroot@uclibc.org>; Thu, 16 Dec 2021 18:13:13 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1mxvFf-0007Po-6g
 for buildroot@uclibc.org; Thu, 16 Dec 2021 19:13:11 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 16 Dec 2021 19:12:53 +0100
Message-ID: <pan$6da85$57c98f32$8301c983$a5945ee7@ID-313208.user.individual.net>
References: <bug-14451-163@https.bugs.busybox.net/>
 <bug-14451-163-aEqUC9bjBs@https.bugs.busybox.net/>
 <5e9075fc-3083-b8d2-2358-cc5281b306ac@arachnodroid.de>
 <aafcded5-c0f4-4745-a226-da57d0e7a805__41403.4441857197$1639675757$gmane$org@mind.be>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: don't disable DRI3 for
 some Gallium drivers
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

Am Thu, 16 Dec 2021 18:28:56 +0100 schrieb Arnout Vandecappelle:

>   Bernd, can you comment?

Hi Arnout,

no, because I do not use buildroot on rbpi hardware.

But the topic was already discussed this summer, with no solution afaics:
https://patchwork.ozlabs.org/project/buildroot/list/?
series=248555&submitter=&state=*&q=&archive=&delegate=

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
