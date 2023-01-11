Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7731EC46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 07:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2BAC418B1;
	Wed, 11 Jan 2023 07:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2BAC418B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VZUfmawkcNh; Wed, 11 Jan 2023 07:29:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96152418B3;
	Wed, 11 Jan 2023 07:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96152418B3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73B891BF2C4
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 07:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CC94418B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 07:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC94418B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JqYs8Obmv-jv for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 07:29:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AADDE418B1
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AADDE418B1
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 07:29:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (11)
Received: from zm (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id DD9181BBFE0;
 Wed, 11 Jan 2023 08:29:29 +0100 (CET)
References: <20230109054053.2704727-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Jan 2023 08:28:55 +0100
In-reply-to: <20230109054053.2704727-1-james.hilliard1@gmail.com>
Message-ID: <87wn5tmsvt.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pytest-asyncio: bump to
 version 0.20.3
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
IC0tLQo+ICBwYWNrYWdlL3B5dGhvbi1weXRlc3QtYXN5bmNpby9weXRob24tcHl0ZXN0LWFzeW5j
aW8uaGFzaCB8IDQgKystLQo+ICBwYWNrYWdlL3B5dGhvbi1weXRlc3QtYXN5bmNpby9weXRob24t
cHl0ZXN0LWFzeW5jaW8ubWsgICB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1w
eXRlc3QtYXN5bmNpby9weXRob24tcHl0ZXN0LWFzeW5jaW8uaGFzaCBiL3BhY2thZ2UvcHl0aG9u
LXB5dGVzdC1hc3luY2lvL3B5dGhvbi1weXRlc3QtYXN5bmNpby5oYXNoCj4gaW5kZXggYjY4M2M2
MDU1My4uMDUxNjcwYWE1MSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1weXRlc3QtYXN5
bmNpby9weXRob24tcHl0ZXN0LWFzeW5jaW8uaGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXB5
dGVzdC1hc3luY2lvL3B5dGhvbi1weXRlc3QtYXN5bmNpby5oYXNoCj4gQEAgLTEsNSArMSw1IEBA
Cj4gICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvcHl0ZXN0LWFzeW5j
aW8vanNvbgo+IC1tZDUgIDg5NDEwOWQ0NWE3YjZmNDY3MThiYmU0NjExYWE3ODE3ICBweXRlc3Qt
YXN5bmNpby0wLjIwLjEudGFyLmd6Cj4gLXNoYTI1NiAgNjI2Njk5ZGUyYTc0NzYxMWYzZWViNjQx
NjhiMzU3NWY3MDQzOWIwNmMzZDAyMDZlNmNlYWVlYjk1NmU2NTUxOSAgcHl0ZXN0LWFzeW5jaW8t
MC4yMC4xLnRhci5nego+ICttZDUgIGRjZTQzOGM3YjAwODFkN2Y1ODBiNWE3OWQ3MTA1NTcwICBw
eXRlc3QtYXN5bmNpby0wLjIwLjMudGFyLmd6Cj4gK3NoYTI1NiAgODNjYmYwMTE2OWNlM2U4ZWI3
MWM2YzI3OGNjYjA1NzRkMWE3YTNiYjhlYWFmNWU1MGUwYWQzNDJhZmIzM2IzNiAgcHl0ZXN0LWFz
eW5jaW8tMC4yMC4zLnRhci5nego+ICAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vt
cwo+ICBzaGEyNTYgIGE4YWQzMWIxYzNmNDBkY2E1YTg0MTE5MzUxYjhmYThkZGM4NjhlZGQ3N2Zh
ZDhhOGViZjZkOGYyZDE2ZmE0YWUgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRo
b24tcHl0ZXN0LWFzeW5jaW8vcHl0aG9uLXB5dGVzdC1hc3luY2lvLm1rIGIvcGFja2FnZS9weXRo
b24tcHl0ZXN0LWFzeW5jaW8vcHl0aG9uLXB5dGVzdC1hc3luY2lvLm1rCj4gaW5kZXggYjcwZTBh
ZDBmNC4uYzk0YzllYTg3NiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1weXRlc3QtYXN5
bmNpby9weXRob24tcHl0ZXN0LWFzeW5jaW8ubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1weXRl
c3QtYXN5bmNpby9weXRob24tcHl0ZXN0LWFzeW5jaW8ubWsKPiBAQCAtNCw5ICs0LDkgQEAKPiAg
Iwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4gLVBZVEhPTl9QWVRFU1RfQVNZTkNJT19W
RVJTSU9OID0gMC4yMC4xCj4gK1BZVEhPTl9QWVRFU1RfQVNZTkNJT19WRVJTSU9OID0gMC4yMC4z
Cj4gIFBZVEhPTl9QWVRFU1RfQVNZTkNJT19TT1VSQ0UgPSBweXRlc3QtYXN5bmNpby0kKFBZVEhP
Tl9QWVRFU1RfQVNZTkNJT19WRVJTSU9OKS50YXIuZ3oKPiAtUFlUSE9OX1BZVEVTVF9BU1lOQ0lP
X1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvOWUvOGYvNWE5
MThhYzRlMjM2NmI2MTE1NmUxNmZhOWJmYjNiZTUyNDAxZDgxZjUzMDllZmIxZjRlMDRkOTlhYzM5
Cj4gK1BZVEhPTl9QWVRFU1RfQVNZTkNJT19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0
ZWQub3JnL3BhY2thZ2VzLzZlLzA2LzM4YjBjYTVkNTM1ODJiYjQ5Njk3NjI2OTc1YjU1NDA0MzVl
YTA2NDc2MmQ4NTJiNWM2NjY0NmM3MjllOQo+ICBQWVRIT05fUFlURVNUX0FTWU5DSU9fU0VUVVBf
VFlQRSA9IHNldHVwdG9vbHMKPiAgUFlUSE9OX1BZVEVTVF9BU1lOQ0lPX0xJQ0VOU0UgPSBBcGFj
aGUtMi4wCj4gIFBZVEhPTl9QWVRFU1RfQVNZTkNJT19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQoK
UmV2aWV3ZWQtYnk6IE1hcmNpbiBOaWVzdHJvaiA8bS5uaWVzdHJvakBncmlubi1nbG9iYWwuY29t
PgoKLS0KTWFyY2luIE5pZXN0csOzagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
