Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01F4EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 16:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6902A61470;
	Fri, 14 Jul 2023 16:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6902A61470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0G44oeX9ubLY; Fri, 14 Jul 2023 16:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9A8360BC7;
	Fri, 14 Jul 2023 16:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9A8360BC7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8A391BF369
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE24D42161
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE24D42161
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hve2E52SWhxq for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 16:25:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE5A642157
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE5A642157
 for <buildroot@uclibc.org>; Fri, 14 Jul 2023 16:25:25 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qKLbe-0004ZF-Qy
 for buildroot@uclibc.org; Fri, 14 Jul 2023 18:25:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 14 Jul 2023 18:24:57 +0200
Message-ID: <pan$2bb42$b9659503$d206750d$74bf77a7@ID-313208.user.individual.net>
References: <BE1P281MB166840C4621F6F53B7B1B3FEEC5FA@BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM>
 <87v8fjpoqi.fsf@48ers.dk>
 <d23d2495-f724-98b8-1f09-23a3914f3510__44327.5294079044$1687426363$gmane$org@rotronics.co.uk>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] OpenSSL v3.0
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

Am Thu, 22 Jun 2023 10:24:28 +0100 schrieb Danny Wood:

> Attached is a patch I have made to build v3.0.9 of OpenSSL (LTS until
> 2026).
> 
> Everything in my build tree compiled fine with the new version

Hi Danny,

uploaded your patch so it appears in patchworks:
https://patchwork.ozlabs.org/project/buildroot/patch/
20230714162339.1907504-1-bernd@kuhls.net/

It works fine for me as well.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
