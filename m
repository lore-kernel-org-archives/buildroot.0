Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D108C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 09:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16D524116B;
	Mon,  6 Nov 2023 09:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16D524116B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPQa2elKG91d; Mon,  6 Nov 2023 09:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8FD7410A7;
	Mon,  6 Nov 2023 09:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8FD7410A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38E2D1BF488
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 09:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F5A161130
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 09:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F5A161130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AqxRsymtP6L3 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 09:30:01 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 06 Nov 2023 09:30:00 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9AB86112C
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9AB86112C
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 09:30:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (19)
Received: from zm (pub-46.182.29.194.multiplay.pl [194.29.182.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id 8B8201BB642;
 Mon,  6 Nov 2023 10:22:50 +0100 (CET)
References: <20231105044303.2816798-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.10.7; emacs 29.1
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 06 Nov 2023 10:22:39 +0100
In-reply-to: <20231105044303.2816798-1-james.hilliard1@gmail.com>
Message-ID: <87jzqvxml2.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to
 version 2.12.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFNp
Z25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+
IC0tLQo+ICBwYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5oYXNoIHwg
NCArKy0tCj4gIHBhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lm1rICAg
fCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZGJ1cy1mYXN0L3B5dGhvbi1kYnVz
LWZhc3QuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lmhh
c2gKPiBpbmRleCA4MzM4MmJmYjI5Li4wOGQyNjc1NDQzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
cHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lmhhc2gKPiArKysgYi9wYWNrYWdlL3B5
dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4g
ICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvZGJ1cy1mYXN0L2pzb24K
PiAtbWQ1ICA4MTBhNWIwOGNjMTRlMjY5MjA3ZWZhOWNiNjUxZTg2YiAgZGJ1c19mYXN0LTIuNy4w
LnRhci5nego+IC1zaGEyNTYgIDkxMTBjNjg5ZmVhNDg2OTY0N2ViYWQzY2Q4MDMxNzU1NGM5Zjc3
ZTM4MjVlZWQyZTM2ZjRjYjlhZWM3NDk3NjEgIGRidXNfZmFzdC0yLjcuMC50YXIuZ3oKPiArbWQ1
ICA3OTFjZTNiMGMwNDA5OTk1OTE2MWExOGFlOTgzYmYyNSAgZGJ1c19mYXN0LTIuMTIuMC50YXIu
Z3oKPiArc2hhMjU2ICA4NDk0NzhlMTFkMjUxZmE0ZWJiOTljZTViZmVlMzMyY2I2MzgzYzYzZWYw
YmM5N2JhZTIzY2VmNGUwYmFkZjljICBkYnVzX2Zhc3QtMi4xMi4wLnRhci5nego+ICAjIExvY2Fs
bHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+ICBzaGEyNTYgIGMzN2U5Yzc1MTEwZTAxZDFm
MGM1MzYwZGM3ZDc3NzZhMzBhYzVmNzBkMjQ0MGRiMjE0NDIzZTRiN2E3N2E2YWYgIExJQ0VOU0UK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZGJ1cy1mYXN0L3B5dGhvbi1kYnVzLWZhc3Qu
bWsgYi9wYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5tawo+IGluZGV4
IDczNzQwNmM5YWIuLmI4OTAxNzdjNzQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tZGJ1
cy1mYXN0L3B5dGhvbi1kYnVzLWZhc3QubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1kYnVzLWZh
c3QvcHl0aG9uLWRidXMtZmFzdC5tawo+IEBAIC00LDkgKzQsOSBAQAo+ICAjCj4gICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCj4KPiAtUFlUSE9OX0RCVVNfRkFTVF9WRVJTSU9OID0gMi43LjAKPiAr
UFlUSE9OX0RCVVNfRkFTVF9WRVJTSU9OID0gMi4xMi4wCj4gIFBZVEhPTl9EQlVTX0ZBU1RfU09V
UkNFID0gZGJ1c19mYXN0LSQoUFlUSE9OX0RCVVNfRkFTVF9WRVJTSU9OKS50YXIuZ3oKPiAtUFlU
SE9OX0RCVVNfRkFTVF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2th
Z2VzL2U1L2JhL2JlZWFmMzY4MjFmMDE2NGEyMDhlOGNiZTlhZGJkYzc1Y2UwYTZlYWZkZWJkNDAx
MTkxMmE4MDZhNDI3NQo+ICtQWVRIT05fREJVU19GQVNUX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZjUvOGMvMjIwZmNiZTQzMzdiODQyZDczMGQ1NzUyZjIw
N2ZjOGVmZDNhMDI0MDVjNzFjMzI5ZTYxMjE4ZTk0N2I4Cj4gIFBZVEhPTl9EQlVTX0ZBU1RfU0VU
VVBfVFlQRSA9IHNldHVwdG9vbHMKPiAgUFlUSE9OX0RCVVNfRkFTVF9MSUNFTlNFID0gTUlUCj4g
IFBZVEhPTl9EQlVTX0ZBU1RfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKClJldmlld2VkLWJ5OiBN
YXJjaW4gTmllc3Ryb2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNvbT4KCi0tCk1hcmNpbiBO
aWVzdHLDs2oKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
