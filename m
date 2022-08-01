Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AECAC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C241404BF;
	Mon,  1 Aug 2022 20:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C241404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jceg_h9EY6i5; Mon,  1 Aug 2022 20:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E53FB402B7;
	Mon,  1 Aug 2022 20:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E53FB402B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97B701BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FDEF60AA3
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FDEF60AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NYssqlvRmC9 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:33:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF1660A82
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EF1660A82
 for <buildroot@uclibc.org>; Mon,  1 Aug 2022 20:33:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1oIc66-0002l1-QQ
 for buildroot@uclibc.org; Mon, 01 Aug 2022 22:33:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 01 Aug 2022 22:32:11 +0200
Message-ID: <pan$82feb$a52ad6a7$d6812199$af085ade@ID-313208.user.individual.net>
References: <20210810120134.3972324-1-fontaine.fabrice@gmail.com>
 <20210812234247.3618da82__12747.8516822279$1628804602$gmane$org@windsurf>
 <pan$781e4$7f830434$f8b8178c$4f096736@ID-313208.user.individual.net>
 <7bf9f809-a7cd-653c-4948-b3c9ea5f7488@mind.be>
 <pan$e5707$29931ad5$956a380b$791006aa@ID-313208.user.individual.net>
 <a6d37212-4112-fd83-43f6-9e9d0011799b@mind.be>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/flatbuffers: fix locale
 independent on musl
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mon, 1 Aug 2022 20:13:52 +0200 schrieb Arnout Vandecappelle:

>   But then, shouldn't the patch in flatbuffers be extended with even
>   more
> ifdefferey to exclude uClibc?

Hi Arnout,

I tried that and failed due to my limited coding skills.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
