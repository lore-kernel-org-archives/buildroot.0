Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF998C001DF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C15660E72;
	Sat, 15 Jul 2023 15:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C15660E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z93GwNV_rzAS; Sat, 15 Jul 2023 15:08:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B212F60E2F;
	Sat, 15 Jul 2023 15:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B212F60E2F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 090A61BF408
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4A3440987
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4A3440987
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3qRi2mgnOWw for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:08:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8551640983
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8551640983
 for <buildroot@uclibc.org>; Sat, 15 Jul 2023 15:08:01 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qKgsI-0009mi-HJ
 for buildroot@uclibc.org; Sat, 15 Jul 2023 17:07:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 15 Jul 2023 17:07:36 +0200
Message-ID: <pan$31975$c0808e19$255a19f5$452067ac@ID-313208.user.individual.net>
References: <20230714162339.1907504-1-bernd@kuhls.net>
 <20230714232518.6ed70c07@windsurf>
 <87fs5pfdd4.fsf__37810.1900381566$1689431990$gmane$org@48ers.dk>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: bump version to
 3.0.9
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

Am Sat, 15 Jul 2023 16:39:19 +0200 schrieb Peter Korsgaard:

> I think the best approach is just merging this as soon as possible and
> then fix up any fallout before 2023.08.

Hi Peter,

erlang needs an update for OpenSSL 3.x compatibility:
https://patchwork.ozlabs.org/project/buildroot/list/?series=364044

Besides that I am using OpenSSL 3.0.9 for several weeks now with Kodi & 
Co. and it works fine.

Regards, Bernd


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
