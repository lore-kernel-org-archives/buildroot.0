Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA44C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 16:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 370B86FAC1;
	Fri, 12 Jan 2024 16:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 370B86FAC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19FrnyXORxow; Fri, 12 Jan 2024 16:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F9A96FA3B;
	Fri, 12 Jan 2024 16:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F9A96FA3B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5314B1BF2F3
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3533442F1E
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3533442F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prQKCo80oKeo for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 16:06:58 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D1FD42EC6
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 16:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D1FD42EC6
X-Virus-Scanned: by amavisd-new using ClamAV (24)
Received: from zm (pub-47.182.29.194.multiplay.pl [194.29.182.47])
 by server220076.nazwa.pl (Postfix) with ESMTP id 5B66E1BD6C6;
 Fri, 12 Jan 2024 16:58:17 +0100 (CET)
References: <20240111030356.2678848-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 12 Jan 2024 16:58:05 +0100
In-reply-to: <20240111030356.2678848-1-james.hilliard1@gmail.com>
Message-ID: <87a5papmqv.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pytest-asyncio: bump to
 version 0.23.3
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

CkphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEFk
ZCBuZXcgaG9zdC1weXRob24tc2V0dXB0b29scy1zY20gYnVpbGQgZGVwZW5kZW5jeS4KPgo+IFNp
Z25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+
IC0tLQo+ICBwYWNrYWdlL3B5dGhvbi1weXRlc3QtYXN5bmNpby9weXRob24tcHl0ZXN0LWFzeW5j
aW8uaGFzaCB8IDQgKystLQo+ICBwYWNrYWdlL3B5dGhvbi1weXRlc3QtYXN5bmNpby9weXRob24t
cHl0ZXN0LWFzeW5jaW8ubWsgICB8IDUgKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24t
cHl0ZXN0LWFzeW5jaW8vcHl0aG9uLXB5dGVzdC1hc3luY2lvLmhhc2ggYi9wYWNrYWdlL3B5dGhv
bi1weXRlc3QtYXN5bmNpby9weXRob24tcHl0ZXN0LWFzeW5jaW8uaGFzaAo+IGluZGV4IGY2Y2Mx
ZDI0MTMuLjI5YTM4YzdkYzcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tcHl0ZXN0LWFz
eW5jaW8vcHl0aG9uLXB5dGVzdC1hc3luY2lvLmhhc2gKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1w
eXRlc3QtYXN5bmNpby9weXRob24tcHl0ZXN0LWFzeW5jaW8uaGFzaAo+IEBAIC0xLDUgKzEsNSBA
QAo+ICAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3B5dGVzdC1hc3lu
Y2lvL2pzb24KPiAtbWQ1ICAxZDEwZjYwNzQ0NGEzNzVjMTQyNWEyYTkwOTYwMDA2ZSAgcHl0ZXN0
LWFzeW5jaW8tMC4yMS4xLnRhci5nego+IC1zaGEyNTYgIDQwYTdlYWU2ZGRlZDIyYzdiNjA0OTg2
ODU1ZWE0ODQwMGFiMTViMDY5YWUzODExNmU4YzAxMjM4ZTllZWI2NGQgIHB5dGVzdC1hc3luY2lv
LTAuMjEuMS50YXIuZ3oKPiArbWQ1ICAwYzgxZjZkZTg1NWU1NDYxODBkZTQyNGMwZGIwNWMyMCAg
cHl0ZXN0LWFzeW5jaW8tMC4yMy4zLnRhci5nego+ICtzaGEyNTYgIGFmMzEzY2U5MDBhNjJmYmUy
YjFhZWQxOGUzN2FkNzU3ZjFlZjk5NDBjNmI2YTg4ZTI5NTRkZTM4ZDZiMWZiOWYgIHB5dGVzdC1h
c3luY2lvLTAuMjMuMy50YXIuZ3oKPiAgIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1
bXMKPiAgc2hhMjU2ICBhOGFkMzFiMWMzZjQwZGNhNWE4NDExOTM1MWI4ZmE4ZGRjODY4ZWRkNzdm
YWQ4YThlYmY2ZDhmMmQxNmZhNGFlICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0
aG9uLXB5dGVzdC1hc3luY2lvL3B5dGhvbi1weXRlc3QtYXN5bmNpby5tayBiL3BhY2thZ2UvcHl0
aG9uLXB5dGVzdC1hc3luY2lvL3B5dGhvbi1weXRlc3QtYXN5bmNpby5tawo+IGluZGV4IDVjNWVm
ZDgxOWMuLjg0NjRjNzBmNWYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tcHl0ZXN0LWFz
eW5jaW8vcHl0aG9uLXB5dGVzdC1hc3luY2lvLm1rCj4gKysrIGIvcGFja2FnZS9weXRob24tcHl0
ZXN0LWFzeW5jaW8vcHl0aG9uLXB5dGVzdC1hc3luY2lvLm1rCj4gQEAgLTQsMTEgKzQsMTIgQEAK
PiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4gLVBZVEhPTl9QWVRFU1RfQVNZTkNJ
T19WRVJTSU9OID0gMC4yMS4xCj4gK1BZVEhPTl9QWVRFU1RfQVNZTkNJT19WRVJTSU9OID0gMC4y
My4zCj4gIFBZVEhPTl9QWVRFU1RfQVNZTkNJT19TT1VSQ0UgPSBweXRlc3QtYXN5bmNpby0kKFBZ
VEhPTl9QWVRFU1RfQVNZTkNJT19WRVJTSU9OKS50YXIuZ3oKPiAtUFlUSE9OX1BZVEVTVF9BU1lO
Q0lPX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNWEvODUv
ZDM5ZWY1ZjY5ZDU1OTdhMjA2ZjIxM2NlMzg3YmNkZmE0NzkyMjQyMzg3NTgyOWY3YTk4YTg3ZDMz
MjgxCj4gK1BZVEhPTl9QWVRFU1RfQVNZTkNJT19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzLzFkLzI3L2YwMzZlYzRiY2JmZDA1NmM1NDU3MmQ3MTY5YmEzZGJi
NTRlNzE4MWYwMmYyMWNhYWRkM2FlY2I5Y2Y1Ygo+ICBQWVRIT05fUFlURVNUX0FTWU5DSU9fU0VU
VVBfVFlQRSA9IHNldHVwdG9vbHMKPiAgUFlUSE9OX1BZVEVTVF9BU1lOQ0lPX0xJQ0VOU0UgPSBB
cGFjaGUtMi4wCj4gIFBZVEhPTl9QWVRFU1RfQVNZTkNJT19MSUNFTlNFX0ZJTEVTID0gTElDRU5T
RQo+ICtQWVRIT05fUFlURVNUX0FTWU5DSU9fREVQRU5ERU5DSUVTID0gaG9zdC1weXRob24tc2V0
dXB0b29scy1zY20KPgo+ICAkKGV2YWwgJChweXRob24tcGFja2FnZSkpCgpSZXZpZXdlZC1ieTog
TWFyY2luIE5pZXN0cm9qIDxtLm5pZXN0cm9qQGdyaW5uLWdsb2JhbC5jb20+CgotLQpNYXJjaW4g
Tmllc3Ryw7NqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
