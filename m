Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF85CC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 18:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 287674148F;
	Sun,  3 Dec 2023 18:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 287674148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d0GGQHZqr9lK; Sun,  3 Dec 2023 18:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C5C440994;
	Sun,  3 Dec 2023 18:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C5C440994
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D2BD1BF408
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E925840467
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E925840467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ykioLrq7VEOS for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 18:06:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55CC440438
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 18:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55CC440438
Received: by mail.gandi.net (Postfix) with ESMTPSA id 286841BF203;
 Sun,  3 Dec 2023 18:06:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9qrk-009Aqv-0i;
 Sun, 03 Dec 2023 19:06:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
References: <20231107131627.424088-1-sairon@sairon.cz>
Date: Sun, 03 Dec 2023 19:06:52 +0100
In-Reply-To: <20231107131627.424088-1-sairon@sairon.cz> ("Jan
 =?utf-8?B?xIxlcm3DoWsiJ3M=?=
 message of "Tue, 7 Nov 2023 14:16:26 +0100")
Message-ID: <87sf4jxirn.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/linux-firmware: add
 RTL8851/RTL8852 firmware
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkphbiIgPT0gSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PiB3cml0ZXM6Cgog
PiBBZGQgZmlybXdhcmUgZmlsZXMgZm9yIFJUTDg4NTEgYW5kIFJUTDg4NTIgY2FyZHMgdXNlZCBi
eSB0aGUgcnRsYnQgZHJpdmVyLgogPiBTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJv
bkBzYWlyb24uY3o+CgpDb21taXR0ZWQgdG8gbmV4dCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIg
S29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
