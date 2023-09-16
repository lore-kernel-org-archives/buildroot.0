Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAC4CD37B1
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 05:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC5ED83D12;
	Sat, 16 Sep 2023 05:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC5ED83D12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55lYqpbVHGXe; Sat, 16 Sep 2023 05:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2163E83D0F;
	Sat, 16 Sep 2023 05:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2163E83D0F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A01D61BF352
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 05:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79ABE83D0F
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 05:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79ABE83D0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDWXQxsKURUB for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 05:03:14 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8292A83CEA
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 05:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8292A83CEA
X-Virus-Scanned: by amavisd-new using ClamAV (14)
Received: from zm (pub-46.182.29.194.multiplay.pl [194.29.182.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id 3B6061BBF03;
 Sat, 16 Sep 2023 07:03:12 +0200 (CEST)
References: <20230916045910.1363154-1-m.niestroj@grinn-global.com>
User-agent: mu4e 1.10.5; emacs 29.1
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Sat, 16 Sep 2023 07:02:20 +0200
In-reply-to: <20230916045910.1363154-1-m.niestroj@grinn-global.com>
Message-ID: <87led6yak0.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/dbus-next: bump to version 2.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGxlYXNlIGlnbm9yZS4gV3JvbmcgY29tbWl0IHRpdGxlIHVzZWQuIEFscmVhZHkgcmVzZW50IGNv
cnJlY3Qgb25lCigncGFja2FnZS9weXRob24tZGJ1cy1uZXh0OiAuLi4pLgoKTWFyY2luIE5pZXN0
cm9qIDxtLm5pZXN0cm9qQGdyaW5uLWdsb2JhbC5jb20+IHdyaXRlczoKCj4gU2lnbmVkLW9mZi1i
eTogTWFyY2luIE5pZXN0cm9qIDxtLm5pZXN0cm9qQGdyaW5uLWdsb2JhbC5jb20+Cj4gLS0tCj4g
IHBhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lmhhc2ggfCA0ICsrLS0K
PiAgcGFja2FnZS9weXRob24tZGJ1cy1mYXN0L3B5dGhvbi1kYnVzLWZhc3QubWsgICB8IDQgKyst
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5o
YXNoIGIvcGFja2FnZS9weXRob24tZGJ1cy1mYXN0L3B5dGhvbi1kYnVzLWZhc3QuaGFzaAo+IGlu
ZGV4IGRjZTI1OGMwZjkuLjgzMzgyYmZiMjkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24t
ZGJ1cy1mYXN0L3B5dGhvbi1kYnVzLWZhc3QuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWRi
dXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgIyBtZDUs
IHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9kYnVzLWZhc3QvanNvbgo+IC1tZDUg
IDFmYzYxYmEyOWVkNzkxNjJjNjUxYmU0YmFlNGE5ZGVlICBkYnVzX2Zhc3QtMS44Ni4wLnRhci5n
ego+IC1zaGEyNTYgIGNhMzc2YTM2MGYxYmMyYzNkNTllOWVkZmI1ZTRkZTViZTM4OWNjYTM3ZThj
OTJmNDUzOTE3NmRkZjc1NTM0MWUgIGRidXNfZmFzdC0xLjg2LjAudGFyLmd6Cj4gK21kNSAgODEw
YTViMDhjYzE0ZTI2OTIwN2VmYTljYjY1MWU4NmIgIGRidXNfZmFzdC0yLjcuMC50YXIuZ3oKPiAr
c2hhMjU2ICA5MTEwYzY4OWZlYTQ4Njk2NDdlYmFkM2NkODAzMTc1NTRjOWY3N2UzODI1ZWVkMmUz
NmY0Y2I5YWVjNzQ5NzYxICBkYnVzX2Zhc3QtMi43LjAudGFyLmd6Cj4gICMgTG9jYWxseSBjb21w
dXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gIHNoYTI1NiAgYzM3ZTljNzUxMTBlMDFkMWYwYzUzNjBk
YzdkNzc3NmEzMGFjNWY3MGQyNDQwZGIyMTQ0MjNlNGI3YTc3YTZhZiAgTElDRU5TRQo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5tayBiL3Bh
Y2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lm1rCj4gaW5kZXggMTQ1NmQ1
NjAwZC4uNzM3NDA2YzlhYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3Qv
cHl0aG9uLWRidXMtZmFzdC5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRo
b24tZGJ1cy1mYXN0Lm1rCj4gQEAgLTQsOSArNCw5IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPgo+IC1QWVRIT05fREJVU19GQVNUX1ZFUlNJT04gPSAxLjg2LjAKPiArUFlUSE9O
X0RCVVNfRkFTVF9WRVJTSU9OID0gMi43LjAKPiAgUFlUSE9OX0RCVVNfRkFTVF9TT1VSQ0UgPSBk
YnVzX2Zhc3QtJChQWVRIT05fREJVU19GQVNUX1ZFUlNJT04pLnRhci5nego+IC1QWVRIT05fREJV
U19GQVNUX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMDgv
OWQvYWQyN2Y0NTExOTg3MjRkNmU1YjRmMDQzNWExM2YyYjJmODM5NzE2YmJjZGVkZTJjY2Y2ZDk5
NzQzZWM1Cj4gK1BZVEhPTl9EQlVTX0ZBU1RfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9z
dGVkLm9yZy9wYWNrYWdlcy9lNS9iYS9iZWVhZjM2ODIxZjAxNjRhMjA4ZThjYmU5YWRiZGM3NWNl
MGE2ZWFmZGViZDQwMTE5MTJhODA2YTQyNzUKPiAgUFlUSE9OX0RCVVNfRkFTVF9TRVRVUF9UWVBF
ID0gc2V0dXB0b29scwo+ICBQWVRIT05fREJVU19GQVNUX0xJQ0VOU0UgPSBNSVQKPiAgUFlUSE9O
X0RCVVNfRkFTVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQoKCi0tCk1hcmNpbiBOaWVzdHLDs2oK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
