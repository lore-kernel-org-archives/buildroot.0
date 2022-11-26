Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171B3C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9A3F812D0;
	Sat, 26 Nov 2022 18:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9A3F812D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Juo6O_L9nglc; Sat, 26 Nov 2022 18:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2C8980FAC;
	Sat, 26 Nov 2022 18:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2C8980FAC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD2D71BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 951E480EC1
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 951E480EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNRlBJF-CM1P for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:53:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FDB680C14
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FDB680C14
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:53:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7A4B9240006;
 Sat, 26 Nov 2022 18:53:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oz0Iq-0003yg-CK; Sat, 26 Nov 2022 19:53:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
References: <20221123102035.2221-1-vincent.stehle@arm.com>
 <20221123102035.2221-2-vincent.stehle@arm.com>
Date: Sat, 26 Nov 2022 19:53:28 +0100
In-Reply-To: <20221123102035.2221-2-vincent.stehle@arm.com> ("Vincent
 =?utf-8?Q?Stehl=C3=A9=22's?= message of "Wed, 23 Nov 2022 11:20:34 +0100")
Message-ID: <87r0xpeedz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/edk2-platforms: refine license
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlZpbmNlbnQiID09IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNv
bT4gd3JpdGVzOgoKID4gVGhlIGVkazItcGxhdGZvcm1zIHByb2plY3QgaXMgbGljZW5zZWQgdW5k
ZXIgdGhlIEJTRC0yLUNsYXVzZSBsaWNlbnNlIHdpdGgKID4gYSBwYXRlbnQgZ3JhbnQsIGFzIHBl
ciBjb21taXQgYWU2MDRlNGZmZThmICgiZWRrMi1wbGF0Zm9ybXM6IENoYW5nZQogPiBMaWNlbnNl
LnR4dCBmcm9tIDItQ2xhdXNlIEJTRCB0byBCU0QrUGF0ZW50IikuCgogPiBUaGVyZSBpcyBhIEJT
RC0yLUNsYXVzZS1QYXRlbnQgU1BEWCBsaWNlbnNlIGlkZW50aWZpZXJbMV0gZm9yIHRoaXMgY2Fz
ZSwKID4gdGhlcmVmb3JlIHJlZmluZSB0aGUgZWRrMi1wbGF0Zm9ybXMgcGFja2FnZSB0byB1c2Ug
dGhpcyBtb3JlIHNwZWNpZmljCiA+IGlkZW50aWZpZXIuCgogPiBbMV06IGh0dHBzOi8vc3BkeC5v
cmcvbGljZW5zZXMvQlNELTItQ2xhdXNlLVBhdGVudC5odG1sCgogPiBTaWduZWQtb2ZmLWJ5OiBW
aW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CiA+IENjOiBEaWNrIE9sc3Nv
biA8aGlAc2VuemlsbGEuaW8+CgpDb21taXR0ZWQgdG8gMjAyMi4wOC54IGFuZCAyMDIyLjAyLngs
IHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
