Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADAEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7E9C6FB51;
	Thu, 13 Jan 2022 19:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7mt8-8chK0m5; Thu, 13 Jan 2022 19:54:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E848B60776;
	Thu, 13 Jan 2022 19:54:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DF201BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25B2484C57
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUl2qtEbzv2W for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:54:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BF5583F4E
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:54:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id C77A040039;
 Thu, 13 Jan 2022 19:54:38 +0000 (UTC)
Date: Thu, 13 Jan 2022 20:54:37 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20220113205437.47e82728@windsurf>
In-Reply-To: <20220113114951.549960-1-jose.pekkarinen@unikie.com>
References: <20220113114951.549960-1-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/opensc: new package
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

SGVsbG8gSm9zw6ksCgpPbiBUaHUsIDEzIEphbiAyMDIyIDEzOjQ5OjUxICswMjAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvb3BlbnNjL0NvbmZpZy5pbiBiL3BhY2thZ2Uvb3BlbnNjL0NvbmZpZy5pbgo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNWVlNTJkMWRlNgo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL29wZW5zYy9Db25maWcuaW4KPiBAQCAtMCwwICsx
LDE1IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9PUEVOU0MKPiArCWJvb2wgIm9wZW5zYyIKPiAr
CWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGRsb3BlbigpCj4gKwlkZXBlbmRzIG9uICFC
UjJfVE9PTENIQUlOX0VYVEVSTkFMX0NPREVTT1VSQ0VSWV9BUk0KClVuZm9ydHVuYXRlbHksIHRo
aXMgaXMgbm90IGFjY2VwdGFibGUuIElmIGl0IGJyZWFrcyB3aXRoIHRoaXMKcGFydGljdWxhciB0
b29sY2hhaW4sIGl0J3MgYWxzbyBsaWtlbHkgdG8gYnJlYWsgd2l0aCBvdGhlciB0b29sY2hhaW5z
CnRoYXQgc2hhcmUgc2ltaWxhciBjaGFyYWN0ZXJpc3RpY3MgKGdjYyB2ZXJzaW9uLCBldGMuKS4K
Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUENTQ19MSVRFCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
T1BFTlNTTAo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0xfRk9SQ0VfTElCT1BFTlNTTAoK
V2h5IGRvIHlvdSBmb3JjZSBPcGVuU1NMIGhlcmU/IElzIExpYnJlU1NMIGNvbmZpcm1lZCB0byBu
b3Qgd29yayB3aXRoCm9wZW5zYz8gSWYgc28sIHBsZWFzZSBhZGQgYSBjb21tZW50IGFib3ZlIHRo
aXMgc2VsZWN0IHRoYXQgZXhwbGFpbnMKd2hhdCBleHBsYWluIGlzIGJyb2tlbi4KCklmIHlvdSBz
ZWxlY3QgQlIyX1BBQ0tBR0VfUENTQ19MSVRFLCB5b3UgYWxzbyBuZWVkIHRvIGluaGVyaXQgaXRz
CmRlcGVuZGVuY2llcywgaS5lOgoKICAgICAgICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFT
X1RIUkVBRFMKICAgICAgICBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZm9yaygpCiAgICAgICAg
ZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTCgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQ
ZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
