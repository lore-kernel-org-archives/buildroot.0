Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56968C47258
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 17:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D20C8845C4;
	Fri, 12 Jan 2024 17:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D20C8845C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PPAXEL2f2VNb; Fri, 12 Jan 2024 17:32:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D6DB83E6C;
	Fri, 12 Jan 2024 17:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D6DB83E6C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EACF1BF309
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87C042F7F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E87C042F7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRgvl5i2RCAt for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 17:32:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C86F442F78
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 17:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C86F442F78
Received: by mail.gandi.net (Postfix) with ESMTPSA id E380860002;
 Fri, 12 Jan 2024 17:32:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOLOf-00C8sx-13;
 Fri, 12 Jan 2024 18:32:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240104210700.502094-1-fontaine.fabrice@gmail.com>
Date: Fri, 12 Jan 2024 18:32:45 +0100
In-Reply-To: <20240104210700.502094-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 4 Jan 2024 22:07:00 +0100")
Message-ID: <875xzyzcci.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dahdi-linux: bump to version
 3.3.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiAtIERyb3AgYWxsIHBhdGNoZXMgZXhjZXB0IGZpcnN0IG9uZSAo
YWxyZWFkeSBpbiB2ZXJzaW9uKQogPiAtIFRoaXMgYnVtcCB3aWxsIGZpeCB0aGUgZm9sbG93aW5n
IGJ1aWxkIGZhaWx1cmUgd2l0aCBrZXJuZWwgPj0gNi42OgoKID4gL2hvbWUvYXV0b2J1aWxkL2F1
dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2J1aWxkL2RhaGRpLWxpbnV4LTMuMi4wL2RyaXZl
cnMvZGFoZGkvd2N0NHh4cC9iYXNlLmM6IEluIGZ1bmN0aW9uIOKAmGZyZWVfd2PigJk6CiA+IC4v
aW5jbHVkZS9saW51eC93b3JrcXVldWUuaDo2Mzk6OTogZXJyb3I6IGNhbGwgdG8KID4g4oCYX193
YXJuX2ZsdXNoaW5nX3N5c3RlbXdpZGVfd3HigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgd2Fy
bmluZzoKID4gUGxlYXNlIGF2b2lkIGZsdXNoaW5nIHN5c3RlbS13aWRlCiA+IHdvcmtxdWV1ZXMu
IFstV2Vycm9yPWF0dHJpYnV0ZS13YXJuaW5nXQogPiAgIDYzOSB8ICAgICAgICAgX193YXJuX2Zs
dXNoaW5nX3N5c3RlbXdpZGVfd3EoKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
ID4gICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KID4gL2hv
bWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2J1aWxkL2RhaGRpLWxp
bnV4LTMuMi4wL2RyaXZlcnMvZGFoZGkvd2N0NHh4cC9iYXNlLmM6MjAyNTo5OgogPiBub3RlOiBp
biBleHBhbnNpb24gb2YgbWFjcm8g4oCYZmx1c2hfc2NoZWR1bGVkX3dvcmvigJkKID4gIDIwMjUg
fCAgICAgICAgIGZsdXNoX3NjaGVkdWxlZF93b3JrKCk7CiA+ICAgICAgIHwgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fgogPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVy
cm9ycwoKID4gaHR0cHM6Ly9naXRodWIuY29tL2FzdGVyaXNrL2RhaGRpLWxpbnV4L3JlbGVhc2Vz
L3RhZy92My4zLjAKCiA+IEZpeGVzOgogPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5v
cmcvcmVzdWx0cy9lOTc1NWUxZjQ4MTRiNmIwYzE1MWM1OTBiNWMzNGFjZmQ4OTU1NmFkCgogPiBT
aWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4KCkNvbW1pdHRlZCB0byAyMDIzLjExLngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNn
YWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
