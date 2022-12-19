Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C235C001B2
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 22:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD98760E51;
	Mon, 19 Dec 2022 22:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD98760E51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lm0nSbpmMLso; Mon, 19 Dec 2022 22:13:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 417AA60BF8;
	Mon, 19 Dec 2022 22:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 417AA60BF8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D4F01BF348
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 22:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3812441554
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 22:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3812441554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YRjoPbUpx1W for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 22:13:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 293BE40A02
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 293BE40A02
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 22:13:28 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BC913E0004;
 Mon, 19 Dec 2022 22:13:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p7ONx-008K6d-Rg; Mon, 19 Dec 2022 23:13:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>
References: <20221219133930.231407-1-kory.maincent@bootlin.com>
Date: Mon, 19 Dec 2022 23:13:25 +0100
In-Reply-To: <20221219133930.231407-1-kory.maincent@bootlin.com>
 (=?utf-8?Q?=22K=C3=B6ry?=
 Maincent"'s message of "Mon, 19 Dec 2022 14:39:30 +0100")
Message-ID: <87len3ghyy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/gcnano-binaries: bump version to
 6.4.9
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
Cc: Jens Kleintje <scooby22@web.de>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkvDtnJ5IiA9PSBLw7ZyeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNv
bT4gd3JpdGVzOgoKID4gRnJvbTogS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGlu
LmNvbT4KID4gVXBkYXRlIHRvIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiB0aGUgZ2NuYW5vLWJpbmFy
aWVzIGJsb2JzLCB3aGljaCBhcmUKID4gY29tcGF0aWJsZSB3aXRoIHRoZSBsYXN0IHY1LjE1LXN0
bTMybXAtcjIga2VybmVsIGZyb20gdGhlCiA+IFNUTWljcm9lbGVjdHJvbmljcyBCU1AuCgogPiBU
aGUgbWFuYWdlbWVudCBvZiBsaWJyYXJpZXMgbGlua3MgaGF2ZSBub3cgY2hhbmdlZC4gV2UgbW92
ZWQgb24gZnJvbQogPiBhIHZlcnNpb24gd2l0aCBzZXZlcmFsIGxpbmtzIHByZXNlbnQgYnV0IGZl
dyBvZiB0aGVtIG1pc3NpbmcgdG8gbm8gbGlua3MKID4gYXQgYWxsLiBOb3csIGFsbCB0aGUgbGlu
a3MgYXJlIG1hZGUgYnkgdGhlIGJ1aWxkIHN5c3RlbS4gVGhlIGxvb3AKID4gbWVjaGFuaXNtIHRv
IG1ha2UgdGhlbSBhcmUgaW1wb3J0ZWQgZnJvbSB0aGUgU1QgWW9jdG8gbGF5ZXIuCgogPiBUaGUg
cGFja2FnZWNvbmZpZyBoYXZlIGFsc28gY2hhbmdlZCwgbm8gbmVlZCB0byB1cGRhdGUgcHJlZml4
IGFuZCB2ZXJzaW9uCiA+IHZhbHVlIGFueW1vcmUuCgogPiBTaWduZWQtb2ZmLWJ5OiBLb3J5IE1h
aW5jZW50IDxrb3J5Lm1haW5jZW50QGJvb3RsaW4uY29tPgogPiAtLS0KCiA+IE5vdGVzOgogPiAg
ICAgQ2hhbmdlIG9uIFYyOiB1cGRhdGUgdGhlIGNvbW1taXQgbWVzc2FnZSB0byBleHBsYWluIHRo
ZSBjaGFuZ2VzCgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
