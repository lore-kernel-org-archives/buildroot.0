Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3BEC5479D
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 11:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67F2460BC9;
	Mon,  2 Jan 2023 11:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67F2460BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyqTs9G6jmcz; Mon,  2 Jan 2023 11:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF6260AD2;
	Mon,  2 Jan 2023 11:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABF6260AD2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 489B11BF39C
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 11:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2414E81E50
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 11:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2414E81E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7gfMObjZoMNp for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 11:26:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA22F81E4F
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA22F81E4F
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 11:26:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (22)
Received: from zm (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id 4C2D81BD890;
 Mon,  2 Jan 2023 12:26:20 +0100 (CET)
References: <20221103102102.924370-1-m.niestroj@grinn-global.com>
 <20221103102102.924370-2-m.niestroj@grinn-global.com>
 <20221211091013.GN1044805@scaer>
User-agent: mu4e 1.8.13; emacs 28.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 02 Jan 2023 12:23:05 +0100
In-reply-to: <20221211091013.GN1044805@scaer>
Message-ID: <87tu1941pl.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-bleak: bump version
 to 0.19.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCiJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyaXRl
czoKCj4gTWFyY2luLCBBbGwsCj4KPiBPbiAyMDIyLTExLTAzIDExOjIxICswMTAwLCBNYXJjaW4g
Tmllc3Ryb2ogc3Bha2UgdGh1c2x5Ogo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJjaW4gTmllc3Ryb2og
PG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNvbT4KPgo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFu
a3MuCj4KCkkgaGF2ZSBub3RpY2VkIHRoYXQgdGhpcyBwYXRjaCB3YXMgYXBwbGllZCB0byBtYXN0
ZXIgd2l0aG91dCBQQVRDSCAxLzIKdGhhdCBhZGRzIHB5dGhvbi1kYnVzLW5leHQgcGFja2FnZSwg
d2hpY2ggaXMgYSBydW50aW1lIGRlcGVuZGVuY3kuCgotLQpSZWdhcmRzLApNYXJjaW4gTmllc3Ry
w7NqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
