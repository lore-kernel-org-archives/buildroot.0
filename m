Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B96C0015E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 16:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3010461473;
	Fri, 14 Jul 2023 16:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3010461473
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bo2h6ak3bMhb; Fri, 14 Jul 2023 16:42:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FEE161489;
	Fri, 14 Jul 2023 16:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FEE161489
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C6881BF369
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9BC241863
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9BC241863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ou-4-A9Jgipg for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 16:42:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10CFF41858
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10CFF41858
 for <buildroot@uclibc.org>; Fri, 14 Jul 2023 16:42:49 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qKLsV-00082e-H9
 for buildroot@uclibc.org; Fri, 14 Jul 2023 18:42:47 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 14 Jul 2023 18:42:27 +0200
Message-ID: <pan$49395$1196efe4$334817be$2befc66c@ID-313208.user.individual.net>
References: <BE1P281MB166840C4621F6F53B7B1B3FEEC5FA@BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM>
 <87v8fjpoqi.fsf@48ers.dk>
 <d23d2495-f724-98b8-1f09-23a3914f3510@rotronics.co.uk>
 <09666051-9013-f88c-b7cb-b46abe5dbd43__38194.5088667393$1689330625$gmane$org@gateware.de>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] OpenSSL v3.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gRnJpLCAxNCBKdWwgMjAyMyAxMjoyOTo1NSArMDIwMCBzY2hyaWViIEtvbnJhZCBHcsOkZmU6
Cgo+IHRoYW5rcyBmb3IgcGlja2luZyB0aGlzIHVwLiBJIHRyaWVkIHlvdXIgcGF0Y2ggb24gb3Vy
IG93biBzeXN0ZW0gYW5kIGl0Cj4gc2VlbXMgdG8gd29yayBoZXJlIGFzIHdlbGwuIEkgZG8gaGF2
ZSBhIGZldyBjb21tZW50cyB0aG91Z2g6CgpIaSBLb25yYWQsCgpzb3JyeSwganVzdCBzYXcgeW91
ciBwb3N0IGFmdGVyIEkgc2VudCB2MSBvZiBEYW5ueXMgcGF0Y2ggdG8gdGhlIAptYWlsaW5nbGlz
dC4gSSB1cGRhdGVkIHRoZSBsaWNlbnNlIGFjY29yZGluZyB0byB5b3VyIGNvbW1lbnRzIGJ1dCBk
aWQgbm90IAp1cGRhdGUgdGhlIG1pc3Npbmcgcy1vLWIgbGluZXMgaW4gdGhlIHBhdGNoIGZpbGVz
LgoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8K
MjAyMzA3MTQxNjQxMDIuMjE3NTc2MC0xLWJlcm5kQGt1aGxzLm5ldC8KClJlZ2FyZHMsIEJlcm5k
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
