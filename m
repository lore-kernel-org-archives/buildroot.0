Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AF7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38CFC6163A;
	Fri, 27 May 2022 09:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80twnmPEUI5L; Fri, 27 May 2022 09:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C59761631;
	Fri, 27 May 2022 09:23:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9781BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C53461631
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lcHtsf_uzam for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:23:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09F12615E1
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:23:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F1CE4240002;
 Fri, 27 May 2022 09:23:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuWBu-001l4Y-SF; Fri, 27 May 2022 11:23:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
References: <20220424235618.471682-1-leo@yuriev.ru>
Date: Fri, 27 May 2022 11:23:30 +0200
In-Reply-To: <20220424235618.471682-1-leo@yuriev.ru> (=?utf-8?B?ItCb0LU=?=
 =?utf-8?B?0L7QvdC40LQg0K7RgNGM0LXQsg==?= (Leonid
 Yuriev)"'s message of "Mon, 25 Apr 2022 02:56:15 +0300")
Message-ID: <87leunl46l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libmdbx: bump version to 0.11.7
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

Pj4+Pj4gItCb0LXQvtC90LjQtCIgPT0g0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZ
dXJpZXYpIDxsZW9AeXVyaWV2LnJ1PiB3cml0ZXM6CgogPiBUaGlzIGlzIHN0YWJsZSBidWdmaXgg
cmVsZWFzZSBvZiBsaWJtZGJ4LiBTbyBpdCBpcyByZWFzb25hYmxlIHRvIGJhY2twb3J0CiA+IHRo
aXMgcGF0Y2ggdG8gYWxsIGFwcGxpY2FibGUgcmVsZWFzZXMvYnJhbmNoZXMgb2YgYnVpbGRyb290
LgoKID4gUmVsZWFzZSBub3RlcyBmb3IgdjAuMTEuNyBodHRwczovL2dpdGZsaWMucnUvcHJvamVj
dC9lcnRoaW5rL2xpYm1kYngvcmVsZWFzZS85MGVjOTk4NS1jZDYwLTRkOWEtOGM5OC04NDE3NTA2
ZmQyNmQKCiA+IFRoZSBjb21wbGV0ZSBDaGFuZ2VMb2c6IGh0dHBzOi8vZ2l0ZmxpYy5ydS9wcm9q
ZWN0L2VydGhpbmsvbGlibWRieC9ibG9iP2ZpbGU9Q2hhbmdlTG9nLm1kCgogPiBTaWduZWQtb2Zm
LWJ5OiDQm9C10L7QvdC40LQg0K7RgNGM0LXQsiAoTGVvbmlkIFl1cmlldikgPGxlb0B5dXJpZXYu
cnU+CgpDb21taXR0ZWQgdG8gMjAyMi4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3Jz
Z2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
