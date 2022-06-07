Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5ECCCA47C
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D561C60B07;
	Tue,  7 Jun 2022 19:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgDt_UM7xV-q; Tue,  7 Jun 2022 19:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2419605DB;
	Tue,  7 Jun 2022 19:43:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2591BF9B4
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B572408C2
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bAHTwhrUuo2s for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:43:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CB2240890
 for <buildroot@uclibc.org>; Tue,  7 Jun 2022 19:43:24 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1nyf6j-000AUp-Im
 for buildroot@uclibc.org; Tue, 07 Jun 2022 21:43:17 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 07 Jun 2022 21:42:36 +0200
Message-ID: <pan$9aa93$cbd14389$60ea0e2f$e0e4c8a8@ID-313208.user.individual.net>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
 <20220514175612.2510884-19-bernd.kuhls@t-online.de>
 <ab57f204-1b69-e99e-6dd1-4d3809740ed2__12424.3190091633$1654548218$gmane$org@mind.be>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 19/19] package/{mesa3d,
 mesa3d-headers}: bump version to 22.0.3
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

Am Mon, 6 Jun 2022 22:43:11 +0200 schrieb Arnout Vandecappelle:

>   This one was marked as Superseded in patchwork, but I couldn't find a
>   newer
> one... Any idea?

Hi Arnout,

yes, I marked the 22.0.3 patch as superseded because mesa3d is already at 
22.1.1 and I did not finish the patch until now:
http://patchwork.ozlabs.org/project/buildroot/patch/
20220607194008.1892449-1-bernd.kuhls@t-online.de/

Run-time tested with iris driver and kodi@gbm.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
