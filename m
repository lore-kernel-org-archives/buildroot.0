Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F1CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 12:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD882415E3;
	Mon, 23 May 2022 12:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkPSsAtE5Ffo; Mon, 23 May 2022 12:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AFE4415DD;
	Mon, 23 May 2022 12:39:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5F41BF34E
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 12:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C1A7829EE
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 12:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VwLOKHCsP-1x for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 12:39:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00B43829B1
 for <buildroot@buildroot.org>; Mon, 23 May 2022 12:39:13 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0793031E07EA; Mon, 23 May 2022 14:39:11 +0200 (CEST)
Date: Mon, 23 May 2022 14:39:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <YouAb62gXvqaHf2p@waldemar-brodkorb.de>
References: <20220522194732.2962580-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220522194732.2962580-1-peter@korsgaard.com>
X-Operating-System: Linux 5.10.0-10-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] package/ruby: security bump to version 3.1.2
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

SGkgUGV0ZXIsCgpUZXN0ZWQtQnk6IFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+
CgoKVGhlcmUgaXMgYW4gaXNzdWUgd2l0aCBsaWJyZXNzbDoKb3NzbF9wa2V5LmM6IEluIGZ1bmN0
aW9uIOKAmG9zc2xfcGtleV9leHBvcnRfdHJhZGl0aW9uYWzigJk6Cm9zc2xfcGtleS5jOjY4MTo2
MjogZXJyb3I6IGludmFsaWQgdXNlIG9mIGluY29tcGxldGUgdHlwZWRlZgrigJhFVlBfUEtFWeKA
mSB7YWthIOKAmHN0cnVjdCBldnBfcGtleV9zdOKAmX0KICA2ODEgfCAgRVZQX1BLRVlfYXNuMV9n
ZXQwX2luZm8oTlVMTCwgTlVMTCwgTlVMTCwgTlVMTCwgJmFuYW1lLAogIHBrZXktPmFtZXRoKTsK
CkFueSBpZGVhPwoKYmVzdCByZWdhcmRzCiBXYWxkZW1hcgoKUGV0ZXIgS29yc2dhYXJkIHdyb3Rl
LAoKPiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlczoKPiAKPiAtIENWRS0yMDIy
LTI4NzM4OiBEb3VibGUgZnJlZSBpbiBSZWdleHAgY29tcGlsYXRpb24KPiAtIENWRS0yMDIyLTI4
NzM5OiBCdWZmZXIgb3ZlcnJ1biBpbiBTdHJpbmctdG8tRmxvYXQgY29udmVyc2lvbgo+IAo+IEZv
ciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgYW5ub3VuY2VtZW50Ogo+IGh0dHBzOi8vd3d3LnJ1Ynkt
bGFuZy5vcmcvZW4vbmV3cy8yMDIyLzA0LzEyL3J1YnktMy0xLTItcmVsZWFzZWQvCj4gCj4gU2ln
bmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgo+IC0tLQo+
ICBwYWNrYWdlL3J1YnkvcnVieS5oYXNoIHwgNSArKystLQo+ICBwYWNrYWdlL3J1YnkvcnVieS5t
ayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydWJ5L3J1YnkuaGFzaCBiL3BhY2thZ2Uv
cnVieS9ydWJ5Lmhhc2gKPiBpbmRleCA5MGU3NjI3YTk3Li5kYTYyMjFlYzUwIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvcnVieS9ydWJ5Lmhhc2gKPiArKysgYi9wYWNrYWdlL3J1YnkvcnVieS5oYXNo
Cj4gQEAgLTEsNSArMSw2IEBACj4gLSMgaHR0cHM6Ly93d3cucnVieS1sYW5nLm9yZy9lbi9uZXdz
LzIwMjEvMTIvMjUvcnVieS0zLTEtMC1yZWxlYXNlZC8KPiAtc2hhNTEyICBhMmJiNmI1ZTYyZDVm
YTA2ZGQ5YzMwY2Y4NGRkY2IyYzI3Y2I4N2ZiYWFmZmQyMzA5YTQ0MzkxYTZiMTEwZTFkZGU2Yjdi
MGQ4YzY1OWI1NjM4N2VlM2M5YjQyNjQwMDNmMzUzMmQ1YTM3NDEyM2E3YzE4N2ViYmE5MjkzZjMy
MCAgcnVieS0zLjEuMC50YXIueHoKPiArIyBodHRwczovL3d3dy5ydWJ5LWxhbmcub3JnL2VuL25l
d3MvMjAyMi8wNC8xMi9ydWJ5LTMtMS0yLXJlbGVhc2VkLwo+ICtzaGE1MTIgIDRhNzRlOWVmYzZl
YTRiM2VmZjRmZWM3NTM0ZWIxZmZmNDc5NGQwMjE1MzFkZWZjMmU5OTM3ZTUzYzY2NjhkYjhlY2Rj
MGZmZjJiYzIzZDVlNjYwMmQwZGYzNDRhMmNhYTg1YjMxYzU0MTQzMDk1NDFlM2Q1MzEzZWM4MmI2
ZTIxICBydWJ5LTMuMS4yLnRhci54ego+ICsKPiAgIyBMaWNlbnNlIGZpbGVzLCBMb2NhbGx5IGNh
bGN1bGF0ZWQKPiAgc2hhMjU2ICA3OTRjMzg0Zjk0Mzk2YWIwN2UzZTZmNTNhOWY4YmUwOTNmYWNi
N2ViNDE5MzI2NjAyNDMwMmI5M2IyOWUxMmRjICBMRUdBTAo+ICBzaGEyNTYgIDk2NzU4NmQ1Mzhh
Mjg5NTVlYzI1NDE5MTBjZjYzYzVhYzM0NWZjZGVhOTRiZmIxZjE3MDVhMWY2ZWIzNmJjYmIgIENP
UFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydWJ5L3J1YnkubWsgYi9wYWNrYWdlL3J1Ynkv
cnVieS5tawo+IGluZGV4IDRmM2I5NGY4M2IuLmNiZGZhNGI4MjYgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9ydWJ5L3J1YnkubWsKPiArKysgYi9wYWNrYWdlL3J1YnkvcnVieS5tawo+IEBAIC01LDcg
KzUsNyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAgUlVCWV9WRVJTSU9OX01B
Sk9SID0gMy4xCj4gLVJVQllfVkVSU0lPTiA9ICQoUlVCWV9WRVJTSU9OX01BSk9SKS4wCj4gK1JV
QllfVkVSU0lPTiA9ICQoUlVCWV9WRVJTSU9OX01BSk9SKS4yCj4gIFJVQllfVkVSU0lPTl9FWFQg
PSAzLjEuMAo+ICBSVUJZX1NJVEUgPSBodHRwOi8vY2FjaGUucnVieS1sYW5nLm9yZy9wdWIvcnVi
eS8kKFJVQllfVkVSU0lPTl9NQUpPUikKPiAgUlVCWV9TT1VSQ0UgPSBydWJ5LSQoUlVCWV9WRVJT
SU9OKS50YXIueHoKPiAtLSAKPiAyLjMwLjIKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
