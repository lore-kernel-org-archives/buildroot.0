Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E81C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 17:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3E64410AB;
	Fri, 14 Jan 2022 17:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IrGLOv1vKkpg; Fri, 14 Jan 2022 17:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3ED5409E7;
	Fri, 14 Jan 2022 17:44:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83D5C1BF28E
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 17:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8003A409E7
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 17:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sOWC1nRTOR2H for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 17:44:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77345409AA
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 17:44:36 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70F6BE0004;
 Fri, 14 Jan 2022 17:44:34 +0000 (UTC)
Date: Fri, 14 Jan 2022 18:44:33 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20220114184433.687ebc15@bootlin.com>
In-Reply-To: <20220112094250.27022-3-sebastien.szymanski@armadeus.com>
References: <20220112094250.27022-1-sebastien.szymanski@armadeus.com>
 <20220112094250.27022-3-sebastien.szymanski@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/gstreamer1/gst1-imx2: new
 package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU8OpYmFzdGllbiwgYWxsCgpPbiBXZWQsIDEyIEphbiAyMDIyIDEwOjQyOjUwICswMTAwClPD
qWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4gd3Jv
dGU6Cgo+IFRoaXMgaXMgdmVyc2lvbiAyIG9mIGdzdDEtaW14Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4K
PiAtLS0KPiAgcGFja2FnZS9nc3RyZWFtZXIxL0NvbmZpZy5pbiAgICAgICAgICAgICAgICB8ICAx
ICsKPiAgcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtaW14Mi9Db25maWcuaW4gICAgICB8IDc1ICsr
KysrKysrKysrKysrKysrKysrKwo+ICBwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1pbXgyL2dzdDEt
aW14Mi5oYXNoIHwgIDMgKwo+ICBwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1pbXgyL2dzdDEtaW14
Mi5tayAgIHwgNzUgKysrKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTU0
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ3N0cmVhbWVyMS9n
c3QxLWlteDIvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dzdHJlYW1l
cjEvZ3N0MS1pbXgyL2dzdDEtaW14Mi5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2dzdHJlYW1lcjEvZ3N0MS1pbXgyL2dzdDEtaW14Mi5tawo+IAoKVGhpcyBwYWNrYWdlIHNlZW1z
IGFuIHVwZGF0ZSBvZiB0aGUgZXhpc3RpbmcgZ3N0MS1pbXggcGFja2FnZS4KCldoeSBhZGQgYSBu
ZXcgcGFja2FnZSBpbnN0ZWFkIG9mIGJ1bXBpbmcgZ3N0MS1pbXggPwoKQmVzdCByZWdhcmRzLApI
ZXJ2w6kKCi0tIApIZXJ2w6kgQ29kaW5hLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
