Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C24C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A1DD60754;
	Sat,  4 Dec 2021 22:01:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzKgmUcuqTBn; Sat,  4 Dec 2021 22:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2EB26064B;
	Sat,  4 Dec 2021 22:01:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49DA11BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4697B405B3
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6L_n6VeKS3p for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:01:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56F5C40290
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:01:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8BC3D200004;
 Sat,  4 Dec 2021 22:01:24 +0000 (UTC)
Date: Sat, 4 Dec 2021 23:01:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20211204230123.725a8742@windsurf>
In-Reply-To: <20211126191742.22476-1-vincent.stehle@arm.com>
References: <20211126191742.22476-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH next] package/fwts: bump to version 21.11.00
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyNiBOb3YgMjAyMSAyMDoxNzo0MiArMDEwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiBBbHNvLCB1cGRhdGUgdGhlIGhhc2ggb2YgdGhl
IGNvcHlyaWdodCBmaWxlLCB3aGljaCBoYXMgY2hhbmdlZCAoYnkgb25lCj4gY2hhcmFjdGVyKS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5j
b20+Cj4gQ2M6IEVyaWNvIE51bmVzIDxudW5lcy5lcmljb0BnbWFpbC5jb20+Cj4gLS0tCgpBcHBs
aWVkIHRvIG5leHQsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBC
b290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290
bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
