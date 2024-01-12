Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDA2C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 16:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA1B46FAAD;
	Fri, 12 Jan 2024 16:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA1B46FAAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pXFRncPvEb9O; Fri, 12 Jan 2024 16:04:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 044446FA3B;
	Fri, 12 Jan 2024 16:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 044446FA3B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 037E41BF2F3
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D040D83EFF
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D040D83EFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Ix9VUOQyebY for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 16:04:26 +0000 (UTC)
X-Greylist: delayed 546 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 12 Jan 2024 16:04:26 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6989C83EC4
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6989C83EC4
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 16:04:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (20)
Received: from zm (pub-47.182.29.194.multiplay.pl [194.29.182.47])
 by server220076.nazwa.pl (Postfix) with ESMTP id A0CDD1BDCD8;
 Fri, 12 Jan 2024 16:55:17 +0100 (CET)
References: <20240111031649.2684726-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 12 Jan 2024 16:54:22 +0100
In-reply-to: <20240111031649.2684726-1-james.hilliard1@gmail.com>
Message-ID: <87edempmvu.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pytest: bump to version
 7.4.4
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

CkphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cml0ZXM6Cgo+IERy
b3Agbm8gbG9uZ2VyIHJlcXVpcmVkIHB5dGhvbi1weSBydW50aW1lIGRlcGVuZGVuY3kuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4K
PiAtLS0KPiAgcGFja2FnZS9weXRob24tcHl0ZXN0L0NvbmZpZy5pbiAgICAgICAgICB8IDEgLQo+
ICBwYWNrYWdlL3B5dGhvbi1weXRlc3QvcHl0aG9uLXB5dGVzdC5oYXNoIHwgNCArKy0tCj4gIHBh
Y2thZ2UvcHl0aG9uLXB5dGVzdC9weXRob24tcHl0ZXN0Lm1rICAgfCA0ICsrLS0KPiAgMyBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9weXRob24tcHl0ZXN0L0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLXB5dGVz
dC9Db25maWcuaW4KPiBpbmRleCBjOGY5YTZlYjViLi5iNDI0NTdlNjdkIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvcHl0aG9uLXB5dGVzdC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3B5dGhvbi1w
eXRlc3QvQ29uZmlnLmluCj4gQEAgLTQsNyArNCw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRI
T05fUFlURVNUCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0lOSUNPTkZJRyAjIHJ1bnRp
bWUKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fUEFDS0FHSU5HICMgcnVudGltZQo+ICAJ
c2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9QTFVHR1kgIyBydW50aW1lCj4gLQlzZWxlY3QgQlIy
X1BBQ0tBR0VfUFlUSE9OX1BZICMgcnVudGltZQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhP
TjNfUFlFWFBBVCAjIHJ1bnRpbWUKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT04zX1pMSUIg
IyBydW50aW1lCj4gIAloZWxwCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5dGVzdC9w
eXRob24tcHl0ZXN0Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1weXRlc3QvcHl0aG9uLXB5dGVzdC5o
YXNoCj4gaW5kZXggN2Y3OWI5NGQ4ZC4uZTcxMDAwMzUzNSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L3B5dGhvbi1weXRlc3QvcHl0aG9uLXB5dGVzdC5oYXNoCj4gKysrIGIvcGFja2FnZS9weXRob24t
cHl0ZXN0L3B5dGhvbi1weXRlc3QuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIG1kNSwgc2hh
MjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3B5dGVzdC9qc29uCj4gLW1kNSAgODYyMDU1
OGU4OTcxYjExMjA3YjJkNmIwODM5MDZjZjkgIHB5dGVzdC03LjQuMi50YXIuZ3oKPiAtc2hhMjU2
ICBhNzY2MjU5Y2ZhYjU2NGEyYWQ1MmNiMWFhZTFiODgxYTc1YzNlYjdlMzRjYTM3Nzk2OTdjMjNl
ZDQ3YzQ3MDY5ICBweXRlc3QtNy40LjIudGFyLmd6Cj4gK21kNSAgZTJhYzRjNzA4NjFmMjZkNzM1
YjY0ZTU2ODdiYjIxOGUgIHB5dGVzdC03LjQuNC50YXIuZ3oKPiArc2hhMjU2ICAyY2YwMDA1OTIy
YzZhY2U0YTNlMmVjOGI0MDgwZWIwZDk3NTNmZGM5MzEwNzQxNTMzMmY1MGNlOWU3OTk0MjgwICBw
eXRlc3QtNy40LjQudGFyLmd6Cj4gICMgTG9jYWxseSBjb21wdXRlciBzaGEyNTYKPiAgc2hhMjU2
ICBjYTgzNmE1ZjllY2NhM2IyZjM1MDIzMGZhYTIwYTQ4ZmI4YjE0NTY1M2I1NTY4ZDc4NDg2MmRm
ODY0NzA2YjliICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5dGVzdC9w
eXRob24tcHl0ZXN0Lm1rIGIvcGFja2FnZS9weXRob24tcHl0ZXN0L3B5dGhvbi1weXRlc3QubWsK
PiBpbmRleCAzMjZkOTUxYTMyLi4zMTcwYTFhOWRiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0
aG9uLXB5dGVzdC9weXRob24tcHl0ZXN0Lm1rCj4gKysrIGIvcGFja2FnZS9weXRob24tcHl0ZXN0
L3B5dGhvbi1weXRlc3QubWsKPiBAQCAtNCw5ICs0LDkgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+Cj4gLVBZVEhPTl9QWVRFU1RfVkVSU0lPTiA9IDcuNC4yCj4gK1BZVEhPTl9Q
WVRFU1RfVkVSU0lPTiA9IDcuNC40Cj4gIFBZVEhPTl9QWVRFU1RfU09VUkNFID0gcHl0ZXN0LSQo
UFlUSE9OX1BZVEVTVF9WRVJTSU9OKS50YXIuZ3oKPiAtUFlUSE9OX1BZVEVTVF9TSVRFID0gaHR0
cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2U1L2QwLzE4MjA5YmI5NWRiOGVl
NjkzYTlhMDRmZTA1NmFiMDY2M2M2ZDZiMWJhZjY3ZGQ1MDgxOWRkOWNkNGJkNwo+ICtQWVRIT05f
UFlURVNUX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvODAv
MWYvOWQ4ZTk4ZTQxMzNmZmIxNmM5MGYzYjQwNWM0M2UzOGQzYWJiNzE1YmI1ZDdhNjNhNWE2ODRm
N2U0NmEzCj4gIFBZVEhPTl9QWVRFU1RfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiAgUFlUSE9O
X1BZVEVTVF9MSUNFTlNFID0gTUlUCj4gIFBZVEhPTl9QWVRFU1RfTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UKClJldmlld2VkLWJ5OiBNYXJjaW4gTmllc3Ryb2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xv
YmFsLmNvbT4KCi0tCk1hcmNpbiBOaWVzdHLDs2oKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
