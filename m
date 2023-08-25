Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72FFC71133
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E14661022;
	Fri, 25 Aug 2023 13:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E14661022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 66aidZvjuf0N; Fri, 25 Aug 2023 13:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91B3160FE0;
	Fri, 25 Aug 2023 13:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91B3160FE0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FBFC1BF82F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 061DE82D40
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 061DE82D40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ed7FjWj8eeOv for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:10:20 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED10B8137F
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED10B8137F
Received: by mail.gandi.net (Postfix) with ESMTPSA id F322D6000F;
 Fri, 25 Aug 2023 13:10:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qZWZt-002tcG-2y; Fri, 25 Aug 2023 15:10:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
References: <20230710174542.16516-1-sebastien.szymanski@armadeus.com>
Date: Fri, 25 Aug 2023 15:10:17 +0200
In-Reply-To: <20230710174542.16516-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Mon, 10 Jul 2023
 19:45:42 +0200")
Message-ID: <87v8d3b746.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/yavta: update _SITE URL
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
Cc: Patrick Gerber <kpa_info@yahoo.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlPDqWJhc3RpZW4iID09IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JpdGVzOgoKID4gSXQgbG9va3MgbGlrZSB0aGUgcHJvamVj
dCBtb3ZlZCB0byBodHRwczovL2dpdC5pZGVhc29uYm9hcmQub3JnL3lhdnRhLmdpdC4KID4gVXBk
YXRlIFlBVkFfU0lURSBVUkwgYWNjb3JkaW5nbHkuCgogPiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0
aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgpDb21taXR0
ZWQgdG8gMjAyMy4wMi54IGFuZCAyMDIzLjA1LngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtv
cnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
