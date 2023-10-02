Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DA8E784BA
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 19:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 749F5418DA;
	Mon,  2 Oct 2023 19:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 749F5418DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCSia6ElM6Fo; Mon,  2 Oct 2023 19:54:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40EFA418C9;
	Mon,  2 Oct 2023 19:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40EFA418C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39E1D1BF336
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 19:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 138F481F17
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 19:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 138F481F17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJ0DpER8ZCib for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 19:54:15 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C064A81EEA
 for <buildroot@busybox.net>; Mon,  2 Oct 2023 19:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C064A81EEA
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1qnOzb-0008Gb-3v
 for buildroot@busybox.net; Mon, 02 Oct 2023 21:54:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 02 Oct 2023 21:53:36 +0200
Message-ID: <pan$af18$5a3989d1$cb86ef85$e701272@ID-313208.user.individual.net>
References: <20230911210917.1114974-1-romain.naour@gmail.com>
 <87edigg4hb.fsf__32334.269203578$1696015980$gmane$org@48ers.dk>
 <pan$74e20$83ce0131$1cf2374f$6f20e2d8@ID-313208.user.individual.net>
 <87r0mf74yf.fsf@48ers.dk>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/2] package/{glibc,
 localedef}: bump to version
 2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sat, 30 Sep 2023 22:59:20 +0200 schrieb Peter Korsgaard:

> So gen is presumably built for the target, but the build system for some
> reason tries to execute it on the host - E.G. it was already a problem,
> but it only happened to work before as the glibc version on your build
> host matched better (was >=) than the 2.38.x version we use now.

Hi Peter,

sent https://patchwork.ozlabs.org/project/buildroot/patch/
20231002195159.3053254-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
