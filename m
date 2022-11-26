Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9230DC4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 304078130D;
	Sat, 26 Nov 2022 18:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 304078130D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JfOjbqE5dghm; Sat, 26 Nov 2022 18:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69EAA81378;
	Sat, 26 Nov 2022 18:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69EAA81378
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5421BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0719E80FAC
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0719E80FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dzgAYx8UfuK1 for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:53:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BD86812CA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BD86812CA
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:53:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B2DC61C000A;
 Sat, 26 Nov 2022 18:53:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oz0Ix-0003zO-OM; Sat, 26 Nov 2022 19:53:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
References: <20221123102035.2221-1-vincent.stehle@arm.com>
 <20221123102035.2221-3-vincent.stehle@arm.com>
Date: Sat, 26 Nov 2022 19:53:35 +0100
In-Reply-To: <20221123102035.2221-3-vincent.stehle@arm.com> ("Vincent
 =?utf-8?Q?Stehl=C3=A9=22's?= message of "Wed, 23 Nov 2022 11:20:35 +0100")
Message-ID: <87mt8deeds.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] boot/edk2: refine license
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
bT4gd3JpdGVzOgoKID4gVGhlIGVkazIgcHJvamVjdCBpcyBsaWNlbnNlZCB1bmRlciB0aGUgQlNE
LTItQ2xhdXNlIGxpY2Vuc2Ugd2l0aCBhIHBhdGVudAogPiBncmFudCwgYXMgcGVyIGNvbW1pdCAz
MDRiZmY3MjIzYTggKCJlZGsyOiBDaGFuZ2UgTGljZW5zZS50eHQgZnJvbSAyLUNsYXVzZQogPiBC
U0QgdG8gQlNEK1BhdGVudCIpLgoKID4gVGhlcmUgaXMgYSBCU0QtMi1DbGF1c2UtUGF0ZW50IFNQ
RFggbGljZW5zZSBpZGVudGlmaWVyWzFdIGZvciB0aGlzIGNhc2UsCiA+IHRoZXJlZm9yZSByZWZp
bmUgdGhlIGVkazIgcGFja2FnZSB0byB1c2UgdGhpcyBtb3JlIHNwZWNpZmljIGlkZW50aWZpZXIu
CgogPiBbMV06IGh0dHBzOi8vc3BkeC5vcmcvbGljZW5zZXMvQlNELTItQ2xhdXNlLVBhdGVudC5o
dG1sCgogPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFy
bS5jb20+CiA+IENjOiBEaWNrIE9sc3NvbiA8aGlAc2VuemlsbGEuaW8+CgpDb21taXR0ZWQgdG8g
MjAyMi4wOC54IGFuZCAyMDIyLjAyLngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFy
ZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
