Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B11C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 19:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E61B405CD;
	Mon, 14 Mar 2022 19:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UlHrJ2iCXZJP; Mon, 14 Mar 2022 19:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1ED1D4055F;
	Mon, 14 Mar 2022 19:01:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 272DA1BF31B
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 19:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24739410C7
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 19:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yJkp0_G7z5NB for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 19:01:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EDFD410C5
 for <buildroot@uclibc.org>; Mon, 14 Mar 2022 19:01:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1nTpwI-0003yx-HJ
 for buildroot@uclibc.org; Mon, 14 Mar 2022 20:01:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 14 Mar 2022 20:00:33 +0100
Message-ID: <pan$42f3$15c67e5c$d8ecaa9b$b73ab53a@ID-313208.user.individual.net>
References: <20220313130424.3046857-1-bernd.kuhls@t-online.de>
 <877d8xd8nb.fsf__45952.9784087621$1647195156$gmane$org@tarshish>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 7.82.0
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

Am Sun, 13 Mar 2022 20:05:45 +0200 schrieb Baruch Siach via buildroot:

> It looks like NSS crypto back-end support requires --with-nss-deprecated
> now. Maybe just drop deprecated NSS support?

Hi Baruch,

curl will drop nss support in August 2022:
https://github.com/curl/curl/blob/master/docs/DEPRECATE.md

Until then why not change the nss configure option?

Regards, Bernd
 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
