Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75526C46CD2
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3EC64013F;
	Fri,  5 Jan 2024 12:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3EC64013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ucBBl76ZyQJ3; Fri,  5 Jan 2024 12:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99B36401ED;
	Fri,  5 Jan 2024 12:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B36401ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 454721BF30B
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EDCF4017F
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EDCF4017F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DpPx9aNvg0U for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:22:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3BC340105
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3BC340105
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65CD0FF80A;
 Fri,  5 Jan 2024 12:22:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rLjDw-005mZ4-2F;
 Fri, 05 Jan 2024 13:22:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
References: <20231212134955.32728-1-sebastien.szymanski@armadeus.com>
Date: Fri, 05 Jan 2024 13:22:52 +0100
In-Reply-To: <20231212134955.32728-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Tue, 12 Dec 2023
 14:49:55 +0100")
Message-ID: <87mstk2cmb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tree: update _SITE URL
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlPDqWJhc3RpZW4iID09IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JpdGVzOgoKID4gVGhlIGN1cnJlbnQgVFJFRV9TSVRFIFVS
TCBkb2Vzbid0IHdvcmsgYW55bW9yZS4KID4gTW9yZW92ZXIgdGhlIFJFQURNRSBzdGF0ZXM6CiA+
ICIKID4gVGhlIG1haW4gZGlzdHJpYnV0aW9uIHNpdGUgZm9yIHRyZWUgaXMgaGVyZToKID4gaHR0
cDovL29sZG1hbnByb2dyYW1tZXIubmV0L3NvdXJjZS5waHA/ZGlyPXByb2plY3RzL3RyZWUKCiA+
IEJhY2t1cCBHSVQgc2l0ZXMgYXJlOgogPiBodHRwczovL2dpdGxhYi5jb20vT2xkTWFuUHJvZ3Jh
bW1lci91bml4LXRyZWUKID4gaHR0cHM6Ly9naXRodWIuY29tL09sZC1NYW4tUHJvZ3JhbW1lci90
cmVlCgogPiBPbGQgc2l0ZSBmb3IgYXMgbG9uZyBhcyBpdCBsYXN0czoKID4gaHR0cDovL21hbWEu
aW5kc3RhdGUuZWR1L3VzZXJzL2ljZS90cmVlLwogPiBmdHA6Ly9tYW1hLmluZHN0YXRlLmVkdS9s
aW51eC90cmVlLwogPiAiCgogPiBVc2UgaHR0cDovL29sZG1hbnByb2dyYW1tZXIubmV0L3Rhci90
cmVlLyBmb3IgVFJFRV9TSVRFCgogPiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNr
aSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgpDb21taXR0ZWQgdG8gMjAyMy4w
Mi54IGFuZCAyMDIzLjExLngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
