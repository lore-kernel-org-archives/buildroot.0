Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A61C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:00:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 259B66108E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 259B66108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE7864048A;
	Mon, 18 Oct 2021 20:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKkpKBhpbT11; Mon, 18 Oct 2021 20:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26BF640480;
	Mon, 18 Oct 2021 20:00:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDC031BF97A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDA1660654
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RMhqHEWmKUow for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:00:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DB1B605FB
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:00:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 845D424000B;
 Mon, 18 Oct 2021 20:00:03 +0000 (UTC)
Date: Mon, 18 Oct 2021 22:00:02 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211018220002.4301fda1@windsurf>
In-Reply-To: <20211015162612.1662548-1-bernd.kuhls@t-online.de>
References: <20211015162612.1662548-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.2.4
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVybmQsCgpPbiBGcmksIDE1IE9jdCAyMDIxIDE4OjI2OjEyICswMjAwCkJlcm5kIEt1
aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4gd3JvdGU6Cgo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL21lc2EzZC8wMDA2LWZpeC1jcHAtZGV0ZWN0aW9uLnBhdGNoIGIvcGFja2FnZS9tZXNhM2Qv
MDAwNi1maXgtY3BwLWRldGVjdGlvbi5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uN2U3OGVlZjFkZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdl
L21lc2EzZC8wMDA2LWZpeC1jcHAtZGV0ZWN0aW9uLnBhdGNoCj4gQEAgLTAsMCArMSwyMyBAQAo+
ICtGaXggYysrIGRldGVjdGlvbgo+ICsKPiArRml4ZXMgYnVpbGQgZXJyb3I6Cj4gKwo+ICsuLi9z
cmMvZWdsL21haW4vZWdsZGlzcGxheS5jOiBJbiBmdW5jdGlvbiDigJhfZWdsR2V0TmF0aXZlUGxh
dGZvcm1Gcm9tRW524oCZOgo+ICsuLi9zcmMvZWdsL21haW4vZWdsZGlzcGxheS5jOjkzOjQ6IGVy
cm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbgo+ICsg4oCYc3RhdGljX2Fzc2Vy
dOKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiArICAgOTMgfCAg
ICBzdGF0aWNfYXNzZXJ0KEFSUkFZX1NJWkUoZWdsX3BsYXRmb3JtcykgPT0gX0VHTF9OVU1fUExB
VEZPUk1TLAo+ICsKPiArU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kLmt1aGxzQHQt
b25saW5lLmRlPgoKVGhhbmtzIGEgbG90IGZvciB0aGlzIHVwZGF0ZSwgYnV0IGluIDIwMjEsIHdl
IHJlYWxseSB3YW50IHBhdGNoZXMKYWdhaW5zdCBwYWNrYWdlcyB0aGF0IGFyZSBkZXZlbG9wZWQg
d2l0aCBHaXQgdG8gYmUgZ2VuZXJhdGVkIHdpdGggImdpdApmb3JtYXQtcGF0Y2giLCBhbmQgYWxz
byBpdCBzaG91bGQgaGF2ZSBhbiB1cHN0cmVhbSBzdGF0dXMgKHN1Ym1pdHRlZAp1cHN0cmVhbSwg
YXMgbWVzYTNkIGlzIGFjdGl2ZSkuIEl0IGFsc28gbmVlZHMgYSBkZWNlbnQgZXhwbGFuYXRpb24K
b3RoZXIgdGhhbiBqdXN0ICJyZW1vdmUgY29kZSB0byBmaXggYnVpbGQiLgoKQ291bGQgeW91IGhh
dmUgYSBsb29rIGludG8gdGhpcyA/CgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQ
ZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
