Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62416C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:54:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B4046108E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B4046108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1FCD40477;
	Mon, 18 Oct 2021 19:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlazbbOlEBpK; Mon, 18 Oct 2021 19:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EBEC4046F;
	Mon, 18 Oct 2021 19:54:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9898A1BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 874894046F
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BbptRnotHdJM for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:54:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5484A40477
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:54:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 52DA5100005;
 Mon, 18 Oct 2021 19:54:11 +0000 (UTC)
Date: Mon, 18 Oct 2021 21:54:10 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>
Message-ID: <20211018215410.3d89a74b@windsurf>
In-Reply-To: <20211018195146.184984-1-joerg.krause@embedded.rocks>
References: <20211018195146.184984-1-joerg.krause@embedded.rocks>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gerbera: bump to version 1.9.2
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

T24gTW9uLCAxOCBPY3QgMjAyMSAxOTo1MTo0NiArMDAwMApKw7ZyZyBLcmF1c2UgPGpvZXJnLmty
YXVzZUBlbWJlZGRlZC5yb2Nrcz4gd3JvdGU6Cgo+IFNpZ25lZC1vZmYtYnk6IErDtnJnIEtyYXVz
ZSA8am9lcmcua3JhdXNlQGVtYmVkZGVkLnJvY2tzPgo+IC0tLQo+ICBwYWNrYWdlL2dlcmJlcmEv
Z2VyYmVyYS5oYXNoIHwgMiArLQo+ICBwYWNrYWdlL2dlcmJlcmEvZ2VyYmVyYS5tayAgIHwgMiAr
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENU
TywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
