Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17404C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C77A66F4A8;
	Thu, 30 Nov 2023 08:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C77A66F4A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhwvWUGGJprT; Thu, 30 Nov 2023 08:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2929B61B3A;
	Thu, 30 Nov 2023 08:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2929B61B3A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FD321BF3BC
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 075C940490
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 075C940490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOgoHOkdAsIv for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:19:26 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29CE9400D6
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29CE9400D6
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA75C1C0009;
 Thu, 30 Nov 2023 08:19:22 +0000 (UTC)
Message-ID: <8e63addb-5c2e-4452-bed6-02416cd650b8@korsgaard.com>
Date: Thu, 30 Nov 2023 09:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 buildroot@buildroot.org
References: <20231122010408.2410999-1-gael.portay@rtone.fr>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231122010408.2410999-1-gael.portay@rtone.fr>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi/readme.txt: fix typos
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjIvMTEvMjAyMyAwMi4wNCwgR2HDq2wgUE9SVEFZIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+CgpDb21taXR0ZWQgdG8gMjAyMy4w
Mi54IGFuZCAyMDIzLjA4LngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
