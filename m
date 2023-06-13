Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA504C7EE2E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 12:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EF76416D0;
	Tue, 13 Jun 2023 12:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF76416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sc5hXFmNvXT4; Tue, 13 Jun 2023 12:48:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB4AA40BD3;
	Tue, 13 Jun 2023 12:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB4AA40BD3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CE611BF352
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3751740BD3
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3751740BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcZYWI0hCRTE for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 12:48:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27E7C40BA2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27E7C40BA2
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 12:48:02 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1433CC0006;
 Tue, 13 Jun 2023 12:47:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q93RH-004NCa-6k; Tue, 13 Jun 2023 14:47:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
References: <20230420144537.2660650-1-raphael.melotte@mind.be>
Date: Tue, 13 Jun 2023 14:47:59 +0200
In-Reply-To: <20230420144537.2660650-1-raphael.melotte@mind.be>
 (=?utf-8?Q?=22Rapha=C3=ABl=09M=C3=A9lotte=22's?= message of "Thu, 20 Apr
 2023 16:45:35 +0200")
Message-ID: <87mt13wmtc.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymupdf: add missing
 host swig dependency
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

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1p
bmQuYmU+IHdyaXRlczoKCiA+IEl0IGFwcGVhcnMgdGhhdCBweXRob24tcHltdXBkZiBuZWVkcyBz
d2lnIHdoZW4gYnVpbGRpbmcgc2luY2UgbXVwZGYKID4gd2FzIGJ1bXBlZCB0byAxLjE4LjAgaW4g
Y29tbWl0CiA+IGYwMGRhNzE0YTIwYTc4MjZkZGE2N2Q2NmYyYTZiNmVmODU4ZWYzZTMuIFRoaXMg
d2FzIG5vdCBub3RpY2VkIGJlZm9yZQogPiBiZWNhdXNlIHdoZW4gYnVpbGRpbmcgb24gYSBtYWNo
aW5lIHdoZXJlIHN3aWcgaXMgYWxyZWFkeSBhdmFpbGFibGUKID4gb3V0c2lkZSBidWlsZHJvb3Qs
IGl0IGlzIHVzZWQgYW5kIHRoZSBidWlsZCBzdWNjZWVkcy4KCiA+IFRoaXMgZml4ZXMgdGhlIGZv
bGxvd2luZyBidWlsZCBmYWlsdXJlOgoKID4gc3dpZ2dpbmcgZml0ei9maXR6LmkgdG8gZml0ei9m
aXR6X3dyYXAuYwogPiBzd2lnIC1weXRob24gLXc1MDkgLW8gZml0ei9maXR6X3dyYXAuYyBmaXR6
L2ZpdHouaQogPiBlcnJvcjogY29tbWFuZCAnc3dpZycgZmFpbGVkOiBObyBzdWNoIGZpbGUgb3Ig
ZGlyZWN0b3J5CiA+IG1ha2U6ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyOTM6CiA+IC9o
b21lL2J1aWxkcm9vdC9hdXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9idWlsZC9weXRob24t
cHltdXBkZi0xLjIxLjEvLnN0YW1wX2J1aWx0XQogPiBFcnJvciAxCgogPiBGaXhlczoKID4gLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9jNjg5YTM4NWQ5ODRiODdiNjNm
M2YyZmYzMDMzODA0OTc3NGIxYmYyCiA+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
L3Jlc3VsdHMvY2YyNjhkMzYzMTMzMGE4Mjg4ZmI4YWQyYWYwMDlhYmI3ZjFjYTZiMAoKID4gU2ln
bmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoK
Q29tbWl0dGVkIHRvIDIwMjMuMDIueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
