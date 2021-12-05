Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A233C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 15:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3C284045D;
	Sun,  5 Dec 2021 15:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7LK4l9eUNrRV; Sun,  5 Dec 2021 15:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66C8840432;
	Sun,  5 Dec 2021 15:15:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D64591BF57C
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5DB9606DA
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEfdUE_4Rc-1 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 15:15:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 842A4606A8
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 15:15:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A55E660009;
 Sun,  5 Dec 2021 15:15:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mttEi-00054y-Tt; Sun, 05 Dec 2021 16:15:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20211027083502.5530-1-sebastien.szymanski@armadeus.com>
 <f67157e7-c19d-ac2f-380d-7f63d089ed84@mind.be>
Date: Sun, 05 Dec 2021 16:15:32 +0100
In-Reply-To: <f67157e7-c19d-ac2f-380d-7f63d089ed84@mind.be> (Arnout
 Vandecappelle's message of "Wed, 17 Nov 2021 22:38:02 +0100")
Message-ID: <87sfv784mj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/stress-ng: bump to version
 0.13.05
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFybm91dCIgPT0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3
cml0ZXM6CgogPiBPbiAyNy8xMC8yMDIxIDEwOjM1LCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90
ZToKID4+IFRoZSBwcm9qZWN0IFVSTCByZXR1cm5zIDQwNCBlcnJvciBiZWNhdXNlOgogPj4gCiA+
PiBRdW90aW5nIENvbGluZyBLaW5nOgogPj4gIlVuZm9ydHVuYXRlbHkgd2hlbiBJIGxlZnQgQ2Fu
b25pY2FsIGxhc3Qgd2VlayB0aGV5IHJlbW92ZWQgbXkgdGFyYmFsbHMiCiA+PiAKID4+IFNvIHVz
ZSBnaXRodWIgYW5kIHVwZGF0ZSBoYXNoLgogPj4gCiA+PiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0
aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgogPiAgQXBw
bGllZCB0byBuZXh0LCB0aGFua3MuIE9yIHNob3VsZCBJIGhhdmUgYXBwbGllZCBpdCB0byBtYXN0
ZXI/IFdlCiA+IHNob3VsZCBhdCBsZWFzdCBhcHBseSB0aGUgY2hhbmdlIG9mIF9TSVRFIHRvIG1h
c3Rlci4KCkkndmUgc2VudCBhIHBhdGNoIHRvIGRvIHRoYXQuCgotLSAKQnllLCBQZXRlciBLb3Jz
Z2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
