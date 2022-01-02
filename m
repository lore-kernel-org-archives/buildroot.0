Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4CDC433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 22:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E61AB40223;
	Sun,  2 Jan 2022 22:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aTITFBhnCrgQ; Sun,  2 Jan 2022 22:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DEE740165;
	Sun,  2 Jan 2022 22:05:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D53931BF3BF
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 22:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCAC160ADB
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 22:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWDAhtVRFTKC for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 22:05:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAA10606F2
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 22:05:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (29)
Received: from zm (pub-91.183.29.194.multiplay.pl [194.29.183.91])
 by server220076.nazwa.pl (Postfix) with ESMTP id 8DE82873E4;
 Sun,  2 Jan 2022 23:05:08 +0100 (CET)
References: <20220101193018.404937-1-james.hilliard1@gmail.com>
 <20220101193018.404937-2-james.hilliard1@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Jan 2022 22:56:11 +0100
In-reply-to: <20220101193018.404937-2-james.hilliard1@gmail.com>
Message-ID: <87ee5phjzu.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5] package/python-pyparsing: enable host
 build
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
Cc: Asaf Kahlon <asafka7@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFRo
aXMgd2lsbCBiZSByZXF1aXJlZCBieSBob3N0LXB5dGhvbi1wYWNrYWdpbmcuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAtLS0K
PiAgcGFja2FnZS9weXRob24tcHlwYXJzaW5nL3B5dGhvbi1weXBhcnNpbmcubWsgfCAyICsrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3B5dGhvbi1weXBhcnNpbmcvcHl0aG9uLXB5cGFyc2luZy5tayBiL3BhY2thZ2UvcHl0aG9uLXB5
cGFyc2luZy9weXRob24tcHlwYXJzaW5nLm1rCj4gaW5kZXggMGRhY2YyMzcxZC4uNTc0MTQ1OGQ2
NSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1weXBhcnNpbmcvcHl0aG9uLXB5cGFyc2lu
Zy5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXB5cGFyc2luZy9weXRob24tcHlwYXJzaW5nLm1r
Cj4gQEAgLTEwLDUgKzEwLDcgQEAgUFlUSE9OX1BZUEFSU0lOR19TSVRFID0gaHR0cHM6Ly9maWxl
cy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2MxLzQ3L2RmYzljMzQyYzkKPiAgUFlUSE9OX1BZ
UEFSU0lOR19MSUNFTlNFID0gTUlUCj4gIFBZVEhPTl9QWVBBUlNJTkdfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UKPiAgUFlUSE9OX1BZUEFSU0lOR19TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+ICtI
T1NUX1BZVEhPTl9QWVBBUlNJTkdfTkVFRFNfSE9TVF9QWVRIT04gPSBweXRob24zCj4KPiAgJChl
dmFsICQocHl0aG9uLXBhY2thZ2UpKQo+ICskKGV2YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkK
ClJldmlld2VkLWJ5OiBNYXJjaW4gTmllc3Ryb2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNv
bT4KCi0tCk1hcmNpbiBOaWVzdHLDs2oKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
