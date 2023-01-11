Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ABBC46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 07:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43F84191C;
	Wed, 11 Jan 2023 07:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D43F84191C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7bJ1vm_5tWz; Wed, 11 Jan 2023 07:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B445E418FD;
	Wed, 11 Jan 2023 07:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B445E418FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 009A41BF2C4
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 07:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D083981F15
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 07:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D083981F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k50-Q8-8WJJX for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 07:31:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB0CC81F02
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB0CC81F02
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 07:31:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (15)
Received: from zm (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id 080A81BC1BE;
 Wed, 11 Jan 2023 08:31:36 +0100 (CET)
References: <20230109034218.2150414-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Jan 2023 08:31:26 +0100
In-reply-to: <20230109034218.2150414-1-james.hilliard1@gmail.com>
Message-ID: <87o7r5msrs.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to
 version 1.84.0
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
c2gKPiBpbmRleCBmMGRjZWViNDNkLi5lOWEzOTkyZjhlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
cHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lmhhc2gKPiArKysgYi9wYWNrYWdlL3B5
dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4g
ICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvZGJ1cy1mYXN0L2pzb24K
PiAtbWQ1ICBlZWJmMmM1NThkZDFhZjBmOGYzMmIzNjFlOTFmMmZhMyAgZGJ1c19mYXN0LTEuNjEu
MS50YXIuZ3oKPiAtc2hhMjU2ICBiZGE0YTdkNTU5MDQ3Yjc0ZjQwOWVkYTI3OGY2OGY2MTBhNDE4
ZTg2YWQzZWZhMDM2OGZhMmVkMjQwZGFhNmI2ICBkYnVzX2Zhc3QtMS42MS4xLnRhci5nego+ICtt
ZDUgIDIxZTM2NzUxNjhlM2RiZTgwN2M2YzhhMjkyNjcyNDFmICBkYnVzX2Zhc3QtMS44NC4wLnRh
ci5nego+ICtzaGEyNTYgIGQ2NGYxYjY4YzFjODEyNjhlODQ2NDcxY2FlYjkyNjRhOTMwNmE2YzZh
ZDM1NmMzMGQ1Y2RmN2QxZWNjMjUxYTEgIGRidXNfZmFzdC0xLjg0LjAudGFyLmd6Cj4gICMgTG9j
YWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gIHNoYTI1NiAgYzM3ZTljNzUxMTBlMDFk
MWYwYzUzNjBkYzdkNzc3NmEzMGFjNWY3MGQyNDQwZGIyMTQ0MjNlNGI3YTc3YTZhZiAgTElDRU5T
RQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFz
dC5tayBiL3BhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lm1rCj4gaW5k
ZXggZGU3MDQ5YmEyMi4uOWRkODhmNjEzZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1k
YnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWRidXMt
ZmFzdC9weXRob24tZGJ1cy1mYXN0Lm1rCj4gQEAgLTQsOSArNCw5IEBACj4gICMKPiAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPgo+IC1QWVRIT05fREJVU19GQVNUX1ZFUlNJT04gPSAxLjYxLjEK
PiArUFlUSE9OX0RCVVNfRkFTVF9WRVJTSU9OID0gMS44NC4wCj4gIFBZVEhPTl9EQlVTX0ZBU1Rf
U09VUkNFID0gZGJ1c19mYXN0LSQoUFlUSE9OX0RCVVNfRkFTVF9WRVJTSU9OKS50YXIuZ3oKPiAt
UFlUSE9OX0RCVVNfRkFTVF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3Bh
Y2thZ2VzL2RkL2Y0L2EyODBkNDZiMTE5ZDU5ZjZhM2Q4NGFiZjQ3NDQ1MmFlNzY2NTE1NThiMDk2
M2FiOGM0OGFlMTNiNWE0NAo+ICtQWVRIT05fREJVU19GQVNUX1NJVEUgPSBodHRwczovL2ZpbGVz
LnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvODEvNjcvYTgzNTIyZDY2OTJhNzI5MTFjMzU4NmUy
ZmNkMjM2M2NlMjJkMTUyMmE3ZTE3ZTEwMTJmMjU1YTYwODNiCj4gIFBZVEhPTl9EQlVTX0ZBU1Rf
U0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiAgUFlUSE9OX0RCVVNfRkFTVF9MSUNFTlNFID0gTUlU
Cj4gIFBZVEhPTl9EQlVTX0ZBU1RfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKClJldmlld2VkLWJ5
OiBNYXJjaW4gTmllc3Ryb2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNvbT4KCi0tCk1hcmNp
biBOaWVzdHLDs2oKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
