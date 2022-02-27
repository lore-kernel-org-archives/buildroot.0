Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C90C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 17:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3A9781CE7;
	Sun, 27 Feb 2022 17:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZIOxjpQ55EjD; Sun, 27 Feb 2022 17:41:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EAE681C81;
	Sun, 27 Feb 2022 17:41:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3511BF285
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7783560AA3
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kGvPMuGp-RKm for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 17:41:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 226F5607FF
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 17:41:28 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92A5B40002;
 Sun, 27 Feb 2022 17:41:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nONXw-00Dnyn-KJ; Sun, 27 Feb 2022 18:41:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Nuno =?utf-8?Q?Gon=C3=A7alves?= <nunojpg@gmail.com>
References: <CAEXMXLSmFXY7jEVTuxtkq034drmG7nS_3c5D=B44M0Wt6U7rPA@mail.gmail.com>
 <CAEXMXLTDvKwJk0twwv_fqXkZFBncW3V4EGoDOZi9jadKVzG-Zg@mail.gmail.com>
Date: Sun, 27 Feb 2022 18:41:24 +0100
In-Reply-To: <CAEXMXLTDvKwJk0twwv_fqXkZFBncW3V4EGoDOZi9jadKVzG-Zg@mail.gmail.com>
 ("Nuno =?utf-8?Q?Gon=C3=A7alves=22's?= message of "Fri, 11 Feb 2022
 18:22:03 +0000")
Message-ID: <874k4k437f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/casync: fix zstd dependency to
 correct package name
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

Pj4+Pj4gIk51bm8iID09IE51bm8gR29uw6dhbHZlcyA8bnVub2pwZ0BnbWFpbC5jb20+IHdyaXRl
czoKCiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gR29uY2FsdmVzIDxudW5vanBnQGdtYWlsLmNvbT4K
CkNvbW1pdHRlZCB0byAyMDIxLjAyLnggYW5kIDIwMjEuMTEueCwgdGhhbmtzLgoKLS0gCkJ5ZSwg
UGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
