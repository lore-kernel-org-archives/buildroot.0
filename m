Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE13C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7262541D29;
	Mon, 30 Jan 2023 21:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7262541D29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RwID-qA9W-G9; Mon, 30 Jan 2023 21:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF5B404E8;
	Mon, 30 Jan 2023 21:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FF5B404E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 006641BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB3C6404E8
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB3C6404E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vVtVC1yVuhe9 for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:50:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 142A5401E1
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 142A5401E1
 for <buildroot@uclibc.org>; Mon, 30 Jan 2023 21:50:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1pMc2R-0008iW-G1
 for buildroot@uclibc.org; Mon, 30 Jan 2023 22:50:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 30 Jan 2023 22:49:04 +0100
Message-ID: <pan$2724f$ad18d855$3c1930f1$855c20a8@ID-313208.user.individual.net>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
 <20230130174339.36794-4-bernd.kuhls@t-online.de>
 <20230130221514.2d58df14__31334.1615417571$1675113344$gmane$org@windsurf>
 <pan$86f7$3b01a6c4$a6498246$160afa18@ID-313208.user.individual.net>
 <20230130223941.11f007d8@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 4/5] package/intel-mediadriver: bump version
 to 23.1.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gTW9uLCAzMCBKYW4gMjAyMyAyMjozOTo0MSArMDEwMCBzY2hyaWViIFRob21hcyBQZXRhenpv
bmkgdmlhIGJ1aWxkcm9vdDoKCj4gT24gTW9uLCAzMCBKYW4gMjAyMyAyMjozMDoxOSArMDEwMCBC
ZXJuZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+Cj4gd3JvdGU6Cj4gCj4+IGJvdGgg
dGFyYmFsbHMgY29udGFpbiBleGFjdGx5IHRoZSBzYW1lIGZpbGVzIGJ1dCB0aGUgdGFyYmFsbHMg
ZGlmZmVyIGluCj4+IHNpemU6Cj4+IAo+PiAtcnctci0tci0tIDEgYmVybmQgYmVybmQgMjg1MTcx
MDcgSmFuIDMwIDIyOjI0Cj4+IGludGVsLW1lZGlhLTIzLjEuMC50YXIuZ3ogLXJ3LXItLXItLSAx
IGJlcm5kIGJlcm5kIDI4NjAxOTM4IEphbiAxOAo+PiAxOToxNCBpbnRlbC1tZWRpYS0yMy4xLjAu
dGFyLmd6Cj4gCj4gQ291bGQgeW91IHJ1biBkaWZmb3Njb3BlIGJldHdlZW4gYm90aCB0YXJiYWxs
cz8KClRoZSByZXN1bHQgaXMgYSAyMzUgTUIgbG9nIGZpbGUgc3RhcnRpbmcgd2l0aDoKCi0tLSBv
bGRfZWRhZS9pbnRlbC1tZWRpYS0yMy4xLjAudGFyLmd6CisrKyBuZXdfZjQ3Zi9pbnRlbC1tZWRp
YS0yMy4xLjAudGFyLmd6CuKUguKUhCBGb3JtYXQtc3BlY2lmaWMgZGlmZmVyZW5jZXMgYXJlIHN1
cHBvcnRlZCBmb3IgR3ppcHBlZCBmaWxlcyBidXQgbm8gCmZpbGUtc3BlY2lmaWMgZGlmZmVyZW5j
ZXMgd2VyZSBkZXRlY3RlZDsgZmFsbGluZyBiYWNrIHRvIGEgYmluYXJ5IGRpZmYuIApmaWxlKDEp
IHJlcG9ydHM6IGd6aXAgY29tcHJlc3NlZCBkYXRhLCBmcm9tIFVuaXgsIG9yaWdpbmFsIHNpemUg
bW9kdWxvIAoyXjMyIDI0NTg5MzEyMAoKUmVnYXJkcywgQmVybmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
