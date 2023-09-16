Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE13DCD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 14:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F1E540C2F;
	Sat, 16 Sep 2023 14:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F1E540C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54viXrt0_ov1; Sat, 16 Sep 2023 14:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEE1940C12;
	Sat, 16 Sep 2023 14:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEE1940C12
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 945E31BF40D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B80440C12
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B80440C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CoCbD3Oo-stD for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 14:10:50 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 055C24026E
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 14:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 055C24026E
X-Virus-Scanned: by amavisd-new using ClamAV (8)
Received: from zm (pub-46.182.29.194.multiplay.pl [194.29.182.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id 233161BBDA9;
 Sat, 16 Sep 2023 16:10:47 +0200 (CEST)
References: <20230916092206.851843-1-m.niestroj@grinn-global.com>
 <20230916115022.GT2571@scaer>
User-agent: mu4e 1.10.7; emacs 29.1
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sat, 16 Sep 2023 16:09:11 +0200
In-reply-to: <20230916115022.GT2571@scaer>
Message-ID: <87v8cai4yh.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] board/orangepi-zero-plus: update link in
 readme
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCiJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyaXRl
czoKCj4gTWFyY2luLCBBbGwsCj4KPiBPbiAyMDIzLTA5LTE2IDExOjIyICswMjAwLCBNYXJjaW4g
Tmllc3Ryb2ogc3Bha2UgdGh1c2x5Ogo+PiBPbGQgbGluayBpcyBubyBsb25nZXIgd29ya2luZywg
c28gdXNlIG5ldyBsaW5rIGluc3RlYWQuCj4KPiBXZSBoYXZlIGEgZmV3IG90aGVyIG9yYW5nZXBp
Lm9yZyBVUkxTLCBhbmQgYnkgdGhlIGxvb2sgb2YgdGhvc2UsIHRoZXkKPiBwcm9iIGFibHkgbm8g
bG9uZ2VyIHdvcmsgZWl0aGVyOgo+Cj4gICAgICQgZ2l0IGdyZXAgb3JhbmdlcGkub3JnCj4KPiBD
b3VsZCB5b3UgbG9vayBpbnRvIHJlcGxhY2luZyB0aG9zZSB0b28sIHBsZWFzZT8KPgoKR29vZCBp
ZGVhISBBbHJlYWR5IHNlbnQgcGF0Y2ggd2l0aCB0aGF0LgoKLS0KTWFyY2luIE5pZXN0csOzagpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
