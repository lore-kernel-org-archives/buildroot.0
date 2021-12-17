Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720E3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 18:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E3AE40C10;
	Fri, 17 Dec 2021 18:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kGSsxb5YsigY; Fri, 17 Dec 2021 18:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D43D140633;
	Fri, 17 Dec 2021 18:06:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB21C1BF28C
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 18:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8A2141F13
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 18:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abFcPTxGPNaL for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 18:06:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 931AC41EF7
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 18:06:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E6F3C200005;
 Fri, 17 Dec 2021 18:06:16 +0000 (UTC)
Date: Fri, 17 Dec 2021 19:06:16 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211217190616.0b919453@windsurf>
In-Reply-To: <20211208232148.3694208-1-giulio.benetti@benettiengineering.com>
References: <20211208232148.3694208-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/postgis: re-enable Microblaze
 architecture
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgOSBEZWMgMjAyMSAwMDoyMTo0OCArMDEwMApHaXVsaW8gQmVuZXR0aSA8Z2l1bGlv
LmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cgo+IFdoaWxlIGFkZGluZyB0
aGlzIHBhY2thZ2Ugd2l0aCBjb21taXRbMV0gTWljcm9ibGF6ZSBhcmNoaXRlY3R1cmUgaGFzIGJl
ZW4KPiBkaXNhYmxlZCBieSBkZWZhdWx0IHBvaW50aW5nIHRoYXQgaXQgc3VmZmVycyBmcm9tIGdj
YyBJQ0UsIGJ1dCB0aGlzIGlzIG5vdAo+IHRydWUsIGluZGVlZCB0aGUgYnVpbGQgZXJyb3IgaXMg
cmVmZXJyZWQgdG8gbGliZ2VvcyB0aGF0IGlzIHBvc3RnaXMKPiBkZXBlbmRlbmN5Ogo+IGBgYAo+
ICAgZHVyaW5nIFJUTCBwYXNzOiByZWxvYWQKPiAgIC4uLi9ib290bGluLW1pY3JvYmxhemVlbC11
Y2xpYmMvYnVpbGQvbGliZ2Vvcy0zLjkuMC9zcmMvZ2VvbS91dGlsL0RlbnNpZmllci5jcHA6IElu
IHN0YXRpYyBtZW1iZXIgZnVuY3Rpb24g4oCYc3RhdGljIHN0ZDo6dW5pcXVlX3B0cjxzdGQ6OnZl
Y3RvcjxnZW9zOjpnZW9tOjpDb29yZGluYXRlPiA+IGdlb3M6Omdlb206OnV0aWw6OkRlbnNpZmll
cjo6ZGVuc2lmeVBvaW50cyhnZW9zOjpnZW9tOjpDb29yZGluYXRlOjpWZWN0LCBkb3VibGUsIGNv
bnN0IGdlb3M6Omdlb206OlByZWNpc2lvbk1vZGVsKinigJk6Cj4gICAuLi4vYm9vdGxpbi1taWNy
b2JsYXplZWwtdWNsaWJjL2J1aWxkL2xpYmdlb3MtMy45LjAvc3JjL2dlb20vdXRpbC9EZW5zaWZp
ZXIuY3BwOjEyODoxOiBpbnRlcm5hbCBjb21waWxlciBlcnJvcjogaW4gZ2VuX3JlZ19ydHgsIGF0
IGVtaXQtcnRsLmM6MTE1NQo+ICAgMTI4IHwgfQo+ICAgICAgIHwgXgo+IGBgYAo+IAo+IFRoaXMg
YnVpbGQgZXJyb3IgaGFzIGJlZW4gd29ya2VkIGFyb3VuZCB3aXRoIHRoaXMgY29tbWl0WzJdIGFu
ZCBJJ3ZlIGp1c3QKPiB0ZXN0ZWQgdGhpcyBidWlsZCB3aXRoIE1pY3JvYmxhemUgZ2NjIDkuMy85
LjQvMTAuMyBhbmQgMTEuMiBhbmQgaXQgYnVpbGRzCj4gc3VjY2VzZnVsbHkgc2luY2UgdGhlIGJ1
ZyBhYm92ZSBpcyBnY2MgYnVnIDkwNjIwWzNdIGFuZCBpdCdzIGJlZW4gaGFuZGxlZAo+IGluIGxp
Ymdlb3MgYWxyZWFkeS4KPiAKPiBTbyBsZXQncyBhbGxvdyBNaWNyb2JsYXplKGVsL2JlKSB0byBi
dWlsZCB0aGlzIHBvc3RnaXMuCj4gCj4gWzFdOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1
aWxkcm9vdC9jb21taXQvP2lkPTliYjEwMzQ0NTVkZTI5OTg3NmRmZDAzYzUwNzRkOGJiOTYyMmY4
NzM5YmIxMDM0NDU1ZGUyOTk4NzZkZmQwM2M1MDc0ZDhiYjk2MjJmODczCj4gWzJdOiBodHRwczov
L2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPTg0N2I0NDFiMWNhMjIzMGM0
ZjI2YTQ5YWFlZGU2OWVjYTVlN2U3YWQKPiBbM106IGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemls
bGEvc2hvd19idWcuY2dpP2lkPTkwNjIwCj4gCj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0
dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gLS0tCj4gIHBhY2th
Z2UvcG9zdGdpcy9Db25maWcuaW4gfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6
em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcK
aHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
