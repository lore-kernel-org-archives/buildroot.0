Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79CBCD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 06:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF1EA4148F;
	Mon, 18 Sep 2023 06:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF1EA4148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zj2ttHMOYVDr; Mon, 18 Sep 2023 06:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75F3B414BD;
	Mon, 18 Sep 2023 06:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75F3B414BD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA9601BF40F
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BA4041497
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BA4041497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCBWM7DediSy for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 06:53:54 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1B1041486
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 06:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1B1041486
X-Virus-Scanned: by amavisd-new using ClamAV (3)
Received: from zm (pub-46.182.29.194.multiplay.pl [194.29.182.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id D73E41BC984;
 Mon, 18 Sep 2023 08:53:50 +0200 (CEST)
References: <20230916104655.1855916-1-m.niestroj@grinn-global.com>
 <670e8d23-a7d8-e993-adae-5ea1935a1a41@gmail.com>
User-agent: mu4e 1.10.7; emacs 29.1
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Date: Mon, 18 Sep 2023 08:51:46 +0200
In-reply-to: <670e8d23-a7d8-e993-adae-5ea1935a1a41@gmail.com>
Message-ID: <87r0mwhszl.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] board: add Orangepi Zero3 support
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

SGkgU2VyZ2V5LAoKU2VyZ2V5IEt1em1pbm92IDxrdXptaW5vdi5zZXJnZXk4MUBnbWFpbC5jb20+
IHdyaXRlczoKCj4gSGVsbG8sIE1hcmNpbiBOaWVzdHJvai4KPiBOZXR3b3JraW5nIGRvZXMgbm90
IHdvcmsgd2l0aCB0aGlzIGtlcm5lbCBjb25maWd1cmF0aW9uLiBJIHN1Z2dlc3QgdXNpbmcgdGhl
Cj4gImxpbnV4X3N1bnhpNjQiIGNvbmZpZ3VyYXRpb24uCj4KPiAxNi4wOS4yMDIzIDEzOjQ2LCBN
YXJjaW4gTmllc3Ryb2og0L/QuNGI0LXRgjoKPj4gQWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgT3Jh
bmdlcGkgWmVybzMgYm9hcmQ6Cj4+IC0gVS1Cb290IDIwMjEuMDcgZm9yayBieSBPcmFuZ2VwaQo+
PiAtIExpbnV4IDYuMS4zMSBmb3JrIGJ5IE9yYW5nZXBpCj4+IC0gRGVmYXVsdCBwYWNrYWdlcyBm
cm9tIGJ1aWxkcm9vdAo+PiBFbmFibGUgQ09ORklHX01GRF9BQzIwMCBhcyBpdCBpcyB1c2VkIGRp
cmVjdGx5IGJ5IG90aGVyIG1vZHVsZSwKPj4gcmVzdWx0aW5nIGluIGJ1aWxkIGZhaWx1cmUgd2hl
biBkaXNhYmxlZC4KPj4gU2lnbmVkLW9mZi1ieTogTWFyY2luIE5pZXN0cm9qIDxtLm5pZXN0cm9q
QGdyaW5uLWdsb2JhbC5jb20+Cj4+IC0tLQo+PiAgIGJvYXJkL29yYW5nZXBpL29yYW5nZXBpLXpl
cm8zL2xpbnV4LmNvbmZpZyB8ICAxICsKPj4gICBib2FyZC9vcmFuZ2VwaS9vcmFuZ2VwaS16ZXJv
My9yZWFkbWUudHh0ICAgfCAzNCArKysrKysrKysrKysrCj4+ICAgY29uZmlncy9vcmFuZ2VwaV96
ZXJvM19kZWZjb25maWcgICAgICAgICAgIHwgNTYgKysrKysrKysrKysrKysrKysrKysrKwo+PiAg
IDMgZmlsZXMgY2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBib2FyZC9vcmFuZ2VwaS9vcmFuZ2VwaS16ZXJvMy9saW51eC5jb25maWcKPj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgYm9hcmQvb3JhbmdlcGkvb3JhbmdlcGktemVybzMvcmVhZG1lLnR4dAo+PiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL29yYW5nZXBpX3plcm8zX2RlZmNvbmZpZwo+PiBb
Li4uc25pcC4uLl0KPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvb3JhbmdlcGlfemVybzNfZGVmY29u
ZmlnIGIvY29uZmlncy9vcmFuZ2VwaV96ZXJvM19kZWZjb25maWcKPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uZTg4ZTRhOWZkOAo+PiAtLS0gL2Rldi9udWxsCj4+
ICsrKyBiL2NvbmZpZ3Mvb3JhbmdlcGlfemVybzNfZGVmY29uZmlnCj4+IEBAIC0wLDAgKzEsNTYg
QEAKPj4gWy4uLnNuaXAuLi5dCj4+ICsKPj4gKyMgS2VybmVsCj4+ICtCUjJfTElOVVhfS0VSTkVM
PXkKPj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTEw9eQo+PiArQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVEFSQkFMTF9MT0NBVElPTj0iJChjYWxsIGdpdGh1YixvcmFuZ2VwaS14dW5s
b25nLGxpbnV4LW9yYW5nZXBpLDM0OTViNWVlMDU5NDU2NmM5ZmVkOTMwYjk2YjFjYWU5MDYwMDQx
MmUpL2xpbnV4LW9yYW5nZXBpLTM0OTViNWVlMDU5NDU2NmM5ZmVkOTMwYjk2YjFjYWU5MDYwMDQx
MmUudGFyLmd6Igo+Cj4gWW91IG5lZWQgdG8gcmVwbGFjZSB0aGUgbGluZToKPj4gK0JSMl9MSU5V
WF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+IEJSMl9MSU5VWF9LRVJORUxfREVG
Q09ORklHPSJsaW51eF9zdW54aTY0Igo+Cj4+ICtCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JU
PXkKPj4gK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJhbGx3aW5uZXIvc3VuNTBp
LWg2MTYtb3JhbmdlcGktemVybzMiCj4+ICtCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BF
TlNTTD15Cj4+ICtCUjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUPXkKPj4gK0JSMl9MSU5V
WF9LRVJORUxfRFRCX0tFRVBfRElSTkFNRT15Cj4+ICtCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19G
UkFHTUVOVF9GSUxFUz0iYm9hcmQvb3JhbmdlcGkvb3JhbmdlcGktemVybzMvbGludXguY29uZmln
Igo+PiArCj4+ICsjIEZpbGVzeXN0ZW0KPj4gK0JSMl9UQVJHRVRfR0VORVJJQ19JU1NVRT0iV2Vs
Y29tZSB0byBPcmFuZ2VwaSBaZXJvMyIKPj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQo+PiAr
QlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKPgo+IEl0IGlzIG5lY2Vzc2FyeSB0byBpbmNyZWFz
ZSB0aGUgc2l6ZSBvZiB0aGUgcm9vdGZzLCBiZWNhdXNlIHRoZSBrZXJuZWwgc2l6ZSBoYXMKPiBi
ZWNvbWUgbGFyZ2VyOgo+PiArQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIxMjBNIgo+IEJS
Ml9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMjAwTSIKPgo+IFlvdSBuZWVkIHRvIGFkZCB0aGlz
IGxpbmUgdG8gYXZvaWQgY3JlYXRpbmcgYSB0YXIgYXJjaGl2ZToKPiAjIEJSMl9UQVJHRVRfUk9P
VEZTX1RBUiBpcyBub3Qgc2V0Cj4KPj4gKwo+PiArIyBob3N0IHRvb2xzCj4+ICtCUjJfUEFDS0FH
RV9IT1NUX0dFTklNQUdFPXkKPj4gK0JSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFM9eQo+PiAr
Cj4+ICsjIGltYWdlIHNjcmlwdHMKPj4gK0JSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJv
YXJkL29yYW5nZXBpL2NvbW1vbi9wb3N0LWJ1aWxkLnNoIgo+PiArQlIyX1JPT1RGU19QT1NUX0lN
QUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+PiArQlIyX1JPT1RGU19Q
T1NUX1NDUklQVF9BUkdTPSItYyAkKEJJTkFSSUVTX0RJUikvZ2VuaW1hZ2UuY2ZnIgoKVGhhbmtz
IGZvciBzdWdnZXN0aW9ucyEgQXBwbGllZCB0aGVtIGFuZCBhbHJlYWR5IHNlbnQgdjIgb2YgdGhp
cyBwYXRjaC4KCi0tCk1hcmNpbiBOaWVzdHLDs2oKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
