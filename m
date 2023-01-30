Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7E0C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3802E8135E;
	Mon, 30 Jan 2023 21:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3802E8135E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZCusv1Z99xU; Mon, 30 Jan 2023 21:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8753181339;
	Mon, 30 Jan 2023 21:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8753181339
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D96A1BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7826441AB9
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7826441AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BAA1DuXXlFFq for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:31:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C892A41ABA
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C892A41ABA
 for <buildroot@uclibc.org>; Mon, 30 Jan 2023 21:31:08 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1pMbk2-0004Dj-Jt
 for buildroot@uclibc.org; Mon, 30 Jan 2023 22:31:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 30 Jan 2023 22:30:19 +0100
Message-ID: <pan$86f7$3b01a6c4$a6498246$160afa18@ID-313208.user.individual.net>
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
> Could you keep the tarball you have locally so that we can compare it to
> the one we get now from Github?

Hi Thomas,

both tarballs contain exactly the same files but the tarballs differ in 
size:

-rw-r--r-- 1 bernd bernd 28517107 Jan 30 22:24 intel-media-23.1.0.tar.gz
-rw-r--r-- 1 bernd bernd 28601938 Jan 18 19:14 intel-media-23.1.0.tar.gz

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
