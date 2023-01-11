Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C04C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 07:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFB1B81F15;
	Wed, 11 Jan 2023 07:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFB1B81F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWESLfEoDJTX; Wed, 11 Jan 2023 07:30:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A2DF81F02;
	Wed, 11 Jan 2023 07:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A2DF81F02
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFA961BF2C4
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 07:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B96A26059C
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 07:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B96A26059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8ASFVv9btFu for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 07:30:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF75960585
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF75960585
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 07:30:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (21)
Received: from zm (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id AAA251BC0F4;
 Wed, 11 Jan 2023 08:30:37 +0100 (CET)
References: <20230109042314.2326173-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Jan 2023 08:30:30 +0100
In-reply-to: <20230109042314.2326173-1-james.hilliard1@gmail.com>
Message-ID: <87sfghmste.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-iniconfig: bump to
 version 2.0.0
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

CkphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cml0ZXM6Cgo+IE1p
Z3JhdGUgZnJvbSBzZXR1cHRvb2xzIHRvIGhhdGNobGluZyBwZXA1MTcgYnVpbGQgYmFja2VuZC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPgo+IC0tLQo+ICBwYWNrYWdlL3B5dGhvbi1pbmljb25maWcvcHl0aG9uLWluaWNvbmZpZy5o
YXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvcHl0aG9uLWluaWNvbmZpZy9weXRob24taW5pY29uZmln
Lm1rICAgfCA3ICsrKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24taW5pY29uZmlnL3B5
dGhvbi1pbmljb25maWcuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWluaWNvbmZpZy9weXRob24taW5p
Y29uZmlnLmhhc2gKPiBpbmRleCBiMjQ2OWRiOTliLi41NDFhZTNlM2YzIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvcHl0aG9uLWluaWNvbmZpZy9weXRob24taW5pY29uZmlnLmhhc2gKPiArKysgYi9w
YWNrYWdlL3B5dGhvbi1pbmljb25maWcvcHl0aG9uLWluaWNvbmZpZy5oYXNoCj4gQEAgLTEsNSAr
MSw1IEBACj4gICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvaW5pY29u
ZmlnL2pzb24KPiAtbWQ1ICAwYjdmM2JlODc0ODEyMTFjMTgzZWFlMDk1YmNlYTZmMSAgaW5pY29u
ZmlnLTEuMS4xLnRhci5nego+IC1zaGEyNTYgIGJjM2FmMDUxZDdkMTRiMmVlNWVmOTk2OTY2NmRl
ZjBjZDFhMDAwZTEyMWVhZWE1ODBkNGEzMTNkZjRiMzdmMzIgIGluaWNvbmZpZy0xLjEuMS50YXIu
Z3oKPiArbWQ1ICAzYzAzMGIzZjUxZGNjM2FjYTU4NWRlMDU2MzU2MDBlNCAgaW5pY29uZmlnLTIu
MC4wLnRhci5nego+ICtzaGEyNTYgIDJkOTFlMTM1YmY3MmQzMWE0MTBiMTdjMTZkYTYxMGE4MmNi
NTVmNmIwNDc3ZDFhOTAyMTM0YjI0YTQ1NWI4YjMgIGluaWNvbmZpZy0yLjAuMC50YXIuZ3oKPiAg
IyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAgc2hhMjU2ICAyYWY2ODBjMzll
ZjQ5M2ZiODI4MzAzNTZkMWQzZGYxYWNiNWEwNjAzM2NiYTJkZWM3YTE5ZTIxY2FhNzdhODY2ICBM
SUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWluaWNvbmZpZy9weXRob24taW5p
Y29uZmlnLm1rIGIvcGFja2FnZS9weXRob24taW5pY29uZmlnL3B5dGhvbi1pbmljb25maWcubWsK
PiBpbmRleCA1YzMxYzY5OTU3Li45OWU5NDZmMGFiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0
aG9uLWluaWNvbmZpZy9weXRob24taW5pY29uZmlnLm1rCj4gKysrIGIvcGFja2FnZS9weXRob24t
aW5pY29uZmlnL3B5dGhvbi1pbmljb25maWcubWsKPiBAQCAtNCwxMSArNCwxMiBAQAo+ICAjCj4g
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4KPiAtUFlUSE9OX0lOSUNPTkZJR19WRVJTSU9OID0g
MS4xLjEKPiArUFlUSE9OX0lOSUNPTkZJR19WRVJTSU9OID0gMi4wLjAKPiAgUFlUSE9OX0lOSUNP
TkZJR19TT1VSQ0UgPSBpbmljb25maWctJChQWVRIT05fSU5JQ09ORklHX1ZFUlNJT04pLnRhci5n
ego+IC1QWVRIT05fSU5JQ09ORklHX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5v
cmcvcGFja2FnZXMvMjMvYTIvOTc4OTlmNmJkMGU4NzNmZWQzYTdlNjdhZThkM2EwOGIyMTc5OTQz
MGZiNGRhMTVjZmVkZjEwZDZlMmMyCj4gLVBZVEhPTl9JTklDT05GSUdfU0VUVVBfVFlQRSA9IHNl
dHVwdG9vbHMKPiArUFlUSE9OX0lOSUNPTkZJR19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzL2Q3LzRiL2NiZDhlNjk5ZTY0YTZmMTZjYTNhODIyMDY2MWI1Zjgz
NzkyYjMwMTdkMGY3OTgwN2NiODcwOGQzMzkxMwo+ICtQWVRIT05fSU5JQ09ORklHX1NFVFVQX1RZ
UEUgPSBwZXA1MTcKPiAgUFlUSE9OX0lOSUNPTkZJR19MSUNFTlNFID0gTUlUCj4gIFBZVEhPTl9J
TklDT05GSUdfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiArUFlUSE9OX0lOSUNPTkZJR19ERVBF
TkRFTkNJRVMgPSBob3N0LXB5dGhvbi1oYXRjaGxpbmcgaG9zdC1weXRob24taGF0Y2gtdmNzCj4K
PiAgJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQoKUmV2aWV3ZWQtYnk6IE1hcmNpbiBOaWVzdHJv
aiA8bS5uaWVzdHJvakBncmlubi1nbG9iYWwuY29tPgoKLS0KTWFyY2luIE5pZXN0csOzagpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
