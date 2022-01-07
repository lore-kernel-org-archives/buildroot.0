Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAB1C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF0DF404BF;
	Fri,  7 Jan 2022 18:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MzBlkExIssvU; Fri,  7 Jan 2022 18:03:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F16FE40192;
	Fri,  7 Jan 2022 18:03:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83D721BF2FE
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70B2D60AC4
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsG1J_jNswTm for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:03:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E3B660AAA
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:03:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5EA30C0005;
 Fri,  7 Jan 2022 18:03:00 +0000 (UTC)
Date: Fri, 7 Jan 2022 19:02:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20220107190259.5365b6ea@windsurf>
In-Reply-To: <20220107140546.1921-2-sebastien.szymanski@armadeus.com>
References: <20220107140546.1921-1-sebastien.szymanski@armadeus.com>
 <20220107140546.1921-2-sebastien.szymanski@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2]
 package/gstreamer1/gst1-plugins-bayer2rgb-neon: show comment on aarch64
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gU8OpYmFzdGllbiwKCk9uIEZyaSwgIDcgSmFuIDIwMjIgMTU6MDU6NDYgKzAxMDAKU8Op
YmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPiB3cm90
ZToKCj4gT24gYWFyY2g2NCwgdGhlIENvbmZpZy5pbiBjb21tZW50IGZvciBnc3QxLXBsdWdpbnMt
YmF5ZXIycmdiLW5lb24gaXMgbm90Cj4gc2hvd24gd2hlbiBhIGRlcGVuZGVuY3kgaXMgbWlzc2lu
Zy4gRml4IHRoYXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNl
YmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+IC0tLQo+ICBwYWNrYWdlL2dzdHJlYW1l
cjEvZ3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uL0NvbmZpZy5pbiB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpUaGlzIHdhc24ndCBlbnRp
cmVseSBjb3JyZWN0LCBpbmRlZWQgdGhlIHNhbWUgcHJvYmxlbSBleGlzdHMgaW4KYmF5ZXIycmdi
LW5lb24sIHdoaWNoIHRoaXMgcGFja2FnZSBkZXBlbmRzIG9uLiBTbyB0byBhdm9pZCB0aGlzCm1p
c3Rha2UsIEkndmUgaW5zdGVhZCBhZGRlZCBhIEJSMl9QQUNLQUdFX0JBWUVSMlJHQl9ORU9OX0FS
Q0hfU1VQUE9SVFMKYmxpbmQgb3B0aW9uLCBhbmQgdXNlZCBpdCBpbiBib3RoIHBhY2thZ2VzLgoK
RG9uJ3QgaGVzaXRhdGUgdG8gZG91YmxlIGNoZWNrIHRoYXQgd2hhdCBJIGhhdmUgY29tbWl0dGVk
IGlzIGNvcnJlY3QsCm9mIGNvdXJzZSEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RP
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
