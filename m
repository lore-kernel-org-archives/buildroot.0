Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0326BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CD8060B69;
	Mon, 13 Dec 2021 21:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6NJUVH_CK5x; Mon, 13 Dec 2021 21:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0B0E60B5E;
	Mon, 13 Dec 2021 21:18:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 651E01BF2B0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 542E14029D
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qg6-gRNAINeP for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:16:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E337402ED
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:16:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C88A3240002;
 Mon, 13 Dec 2021 21:16:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mwsfy-0000ii-N1; Mon, 13 Dec 2021 22:16:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211113163241.547023-1-fontaine.fabrice@gmail.com>
 <874k8atos5.fsf@dell.be.48ers.dk>
 <CAPi7W80e+E94i7g_Bv+8e18vAGHC3nf=oaZOxw7jKBeSze4bdA@mail.gmail.com>
Date: Mon, 13 Dec 2021 22:16:02 +0100
In-Reply-To: <CAPi7W80e+E94i7g_Bv+8e18vAGHC3nf=oaZOxw7jKBeSze4bdA@mail.gmail.com>
 (Fabrice Fontaine's message of "Thu, 18 Nov 2021 22:16:21 +0100")
Message-ID: <874k7ctdd9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: security bump to
 version 5.62
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBMZSBtZXIuIDE3IG5vdi4gMjAyMSDDoCAyMzoxMiwgUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6CiA+PiAKID4+ID4+Pj4+
ICJGYWJyaWNlIiA9PSBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4gd3JpdGVzOgogPj4gCiA+PiA+IC0gRHJvcCBzZWNvbmQgcGF0Y2ggKGFscmVhZHkgaW4gdmVy
c2lvbikKID4+ID4gLSBGaXggQ1ZFLTIwMjEtNDM0MDA6IEFuIGlzc3VlIHdhcyBkaXNjb3ZlcmVk
IGluIGdhdHQtZGF0YWJhc2UuYyBpbiBCbHVlWgogPj4gPiAgIDUuNjEuIEEgdXNlLWFmdGVyLWZy
ZWUgY2FuIG9jY3VyIHdoZW4gYSBjbGllbnQgZGlzY29ubmVjdHMgZHVyaW5nIEQtQnVzCiA+PiA+
ICAgcHJvY2Vzc2luZyBvZiBhIFdyaXRlVmFsdWUgY2FsbC4KID4+IAogPj4gPiBodHRwOi8vd3d3
LmJsdWV6Lm9yZy9yZWxlYXNlLW9mLWJsdWV6LTUtNjIKID4+IAogPj4gVGhpcyBzdGF0ZXMgIkl0
IHJlY29tbWVuZHMgdXNpbmcgdGhlIEVMTCB2ZXJzaW9uIDAuNDQuIi4gRG8geW91IGtub3cKID4+
IGhvdyBpbXBvcnRhbnQgdGhpcyBpcz8gMjAyMS4wOC54IGhhcyAwLjQxIGFuZCAyMDIxLjAyLngg
aGFzIDAuMzUuIERvZXMKID4+IGl0IG5lZWQgdG8gYmUgYnVtcGVkIGFzIHdlbGw/CiA+IE5vcGUs
IEkgZG9uJ3Qga25vdy4KCk9rLgoKQ29tbWl0dGVkIHRvIDIwMjEuMDIueCBhbmQgMjAyMS4wOC54
LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
