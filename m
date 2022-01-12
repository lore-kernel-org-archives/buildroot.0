Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46C3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 16:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6848284BAC;
	Wed, 12 Jan 2022 16:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JcKLKheQY06j; Wed, 12 Jan 2022 16:00:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A786D84BA9;
	Wed, 12 Jan 2022 16:00:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1B781BF5E6
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 16:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDAD84292A
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 16:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F5WWL5nBOaul for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 16:00:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF04442929
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 16:00:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B3A22FF802;
 Wed, 12 Jan 2022 16:00:44 +0000 (UTC)
Date: Wed, 12 Jan 2022 17:00:43 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20220112170043.03abd8c1@windsurf>
In-Reply-To: <CAJPV9MpjN_fPn04Z6crTsogUL2-UWjgBr2P-A9Uz-QYqYd_aGw@mail.gmail.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-2-jose.pekkarinen@unikie.com>
 <20220105214129.2f5fffae@windsurf>
 <CAJPV9MpzSPFyj-AMO+_iCNZ-PVp+DcKaH1yrMHvO2TawoUPa1g@mail.gmail.com>
 <20220112155103.7e6c11c0@windsurf>
 <CAJPV9MpjN_fPn04Z6crTsogUL2-UWjgBr2P-A9Uz-QYqYd_aGw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/7] package/minijail: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAxMiBKYW4gMjAyMiAxNzowODoyNiArMDIwMApKb3PDqSBQZWtrYXJpbmVuIDxqb3Nl
LnBla2thcmluZW5AdW5pa2llLmNvbT4gd3JvdGU6Cgo+ID4gcHJsaW1pdCgpIGV4aXN0cyBpbiBt
dXNsLiBXYXMgPHN5cy9yZXNvdXJjZS5oPiBpbmNsdWRlZCwgYXMgc3VnZ2VzdGVkCj4gPiBieSB0
aGUgcHJsaW1pdCgpIG1hbiBwYWdlID8gIAo+IAo+ICAgICBJdCBpczoKPiAKPiAkIGNhdCBsaWJt
aW5pamFpbC5jCj4gWy4uLl0KPiAjaW5jbHVkZSA8c3lzL3Jlc291cmNlLmg+Cj4gWy4uLl0KCkFo
LCBpdCdzIHVDbGliYyB0aGF0IGlzIG1pc3NpbmcgcHJsaW1pdCgpLiBDYW4geW91IGNvbmZpcm0g
dGhhdAptaW5pamFpbCBidWlsZHMgZmluZSB3aXRoIGdsaWJjIGFuZCBtdXNsLCBidXQgYnJlYWtz
IG9uIHVDbGliYyBkdWUgdG8KcHJsaW1pdCgpIGJlaW5nIG1pc3Npbmc/CgpJJ20gbm90IHN1cmUg
aXQncyBwb3NzaWJsZSB0byByZXBsYWNlIHBybGltaXQoKSBieSBzZXRybGltaXQoKS4gSW5kZWVk
LApwcmxpbWl0KCkgaGFzIGEgUElEIGFzIHRoZSBmaXJzdCBhcmd1bWVudCwgd2hpY2ggYWxsb3dz
IHRvIHN0ZSByZXNvdXJjZQpsaW1pdHMgb24gb3RoZXIgcHJvY2Vzc2VzLCB3aGlsZSBzZXRybGlt
aXQoKSBvbmx5IHRha2VzIGNhcmUgb2YgdGhlCmN1cnJlbnQgcHJvY2Vzcy4KCkknbSBhZnJhaWQg
aXQgc2VlbXMgd2Ugd2lsbCBoYXZlIHRvIGRpc2FsbG93IHRoZSB1c2Ugb2YgbWluaWphaWwgd2l0
aAp1Q2xpYmMgdG9vbGNoYWlucy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3du
ZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
IGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
