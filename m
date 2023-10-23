Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A24C25B45
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 19:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3811461307;
	Mon, 23 Oct 2023 19:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3811461307
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJEbvlU_TRnA; Mon, 23 Oct 2023 19:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CBA26130A;
	Mon, 23 Oct 2023 19:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CBA26130A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D16FD1BF2BC
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 19:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B6F681F10
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 19:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B6F681F10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NAZJ3qHsTGpT for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 19:30:12 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FAFE80C41
 for <buildroot@uclibc.org>; Mon, 23 Oct 2023 19:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FAFE80C41
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qv0cr-00042h-IV
 for buildroot@uclibc.org; Mon, 23 Oct 2023 21:30:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 23 Oct 2023 21:29:13 +0200
Message-ID: <pan$8116c$14c376a1$11e18b6b$7ba3e986@ID-313208.user.individual.net>
References: <20231016211414.28406-1-fontaine.fabrice__49164.7157048405$1697490885$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: fix configure
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

Am Mon, 16 Oct 2023 23:14:14 +0200 schrieb Fabrice Fontaine:

> Fix the following build failure raised since bump to version 4.19.1 in
> commit a8ff60cff9402dcd04fffb67af15dfe2caab0995 and
> https://gitlab.com/samba-team/samba/-/commit/
fb4bb188acfc3e88887b500a05e9e4db8b08aed3:

Tested-by: Bernd Kuhls <bernd@kuhls.net>
[build-tested]

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
