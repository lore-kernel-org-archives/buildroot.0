Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7558AC0015E
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 21:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C230140529;
	Sat, 15 Jul 2023 21:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C230140529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5QC5QDNk7av; Sat, 15 Jul 2023 21:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 158F64051B;
	Sat, 15 Jul 2023 21:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 158F64051B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A6291BF389
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 21:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1403B81D16
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 21:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1403B81D16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5zogUSLXkYCL for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 21:46:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8F1C81CEF
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8F1C81CEF
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 21:45:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 086DAE0002;
 Sat, 15 Jul 2023 21:45:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qKn5O-008etk-Tm; Sat, 15 Jul 2023 23:45:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <aduskett@gmail.com>
References: <CAFSsvmqOZCu+nRz4Ym-h1zHV53BEgdGkLahXpaiDu=-T17qNpA@mail.gmail.com>
 <877cr1f8il.fsf@48ers.dk>
 <CAFSsvmrKm3QVhiZYJRe-UBmX5TEkdrCKdHy+xJ242ng=wdQctw@mail.gmail.com>
Date: Sat, 15 Jul 2023 23:45:54 +0200
In-Reply-To: <CAFSsvmrKm3QVhiZYJRe-UBmX5TEkdrCKdHy+xJ242ng=wdQctw@mail.gmail.com>
 (Adam Duskett's message of "Sat, 15 Jul 2023 11:35:40 -0700")
Message-ID: <87351og86l.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] Flutter-engine package help wanted.
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFkYW0iID09IEFkYW0gRHVza2V0dCA8YWR1c2tldHRAZ21haWwuY29tPiB3cml0ZXM6
CgogPiBIZXkgUGV0ZXIhCiA+IE9uZSB0aG91Z2h0IEkgaGFkIHRoYXQgSSBkaWRu4oCZdCBicmlu
ZyB1cCBpbiB0aGUgZmlyc3QgZW1haWw6IEFub3RoZXIKID4gcG9zc2libGUgc29sdXRpb24gaXMg
dG8gY3JlYXRlIGFuZCB1cGxvYWQgYSB0YXJiYWxsIHRvIHRoZSBidWlsZHJvb3QKID4gc291cmNl
cyBzZXJ2ZXIsIGJ1dCBlYWNoIHRhcmJhbGwgaXMgYXJvdW5kIDIuMUdpQiBpbiBzaXplIQoKU28g
ZmFyIHRoZSBzLmIubyBpcyBqdXN0IGEgZmFsbGJhY2sgYW5kIHNvbWV0aGluZyByZXF1aXJlZCBm
b3IgYW4gYWN0aXZlCnBhY2thZ2UuIEkgd291bGQgcHJlZmVyIHRvIGtlZXAgaXQgbGlrZSB0aGF0
IGlmIGF0IGFsbCBwb3NzaWJsZS4KCgogPiBJIGhhdmUgYmVlbiB1c2luZyBtZXRhLWZsdXR0ZXIg
dG8gcG9ydCB0aGUgcGFja2FnZSB0byBCdWlsZHJvb3QsIGJ1dAogPiBoYXZlbuKAmXQgcXVpdGUg
Z290IGl0IHRvIGNvbXBpbGUgeWV0IQoKT0suCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
