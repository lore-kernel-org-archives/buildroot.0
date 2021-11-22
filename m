Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2309CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 17:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BF68818BE;
	Mon, 22 Nov 2021 17:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1cY-PppaJeA; Mon, 22 Nov 2021 17:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4A0B81763;
	Mon, 22 Nov 2021 17:37:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 232B11BF31A
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 17:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 110D6400CC
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 17:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l4pjXQDEddKX for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 17:37:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CA32400C7
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 17:37:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 86F7D20000C;
 Mon, 22 Nov 2021 17:37:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mpDG8-0003HY-Jk; Mon, 22 Nov 2021 18:37:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20211120231007.1944130-1-yann.morin.1998@free.fr>
 <66122ac8-f802-d8e6-eae5-6288edaedc11@gmail.com>
Date: Mon, 22 Nov 2021 18:37:40 +0100
In-Reply-To: <66122ac8-f802-d8e6-eae5-6288edaedc11@gmail.com> (Romain Naour's
 message of "Sun, 21 Nov 2021 21:02:46 +0100")
Message-ID: <8735noozvf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH:LTS] gitlab-ci: update the image version
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3
cml0ZXM6CgogPiBIZWxsbyBZYW5uLAogPiBMZSAyMS8xMS8yMDIxIMOgIDAwOjEwLCBZYW5uIEUu
IE1PUklOIGEgw6ljcml0wqA6CiA+PiBXZSBnZXQgbmV3ZXIgQ0EgY2VydGlmaWNhdGVzLCB0byBn
ZXQgcmlkIG9mIHRoZSBhbm5veWluZyBpc3N1ZXMgd2l0aCB0aGUKID4+IG5vdy1leHBpcmVkIExl
dCdzIEVuY3J5cHQgcm9vdCBjZXJ0aWZpY2F0ZS4KID4+IAogPj4gU3VnZ2VzdGVkLWJ5OiBQZXRl
ciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CiA+PiBTaWduZWQtb2ZmLWJ5OiBZYW5u
IEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KID4+IENjOiBSb21haW4gTmFvdXIg
PHJvbWFpbi5uYW91ckBnbWFpbC5jb20+CiA+PiAKID4+IC0tLQogPj4gQmVmb3JlIGFwcGx5aW5n
IHRoaXMgcGF0Y2gsIGZpcnN0IGNoZWNrIHRoYXQgdGhlIGltYWdlIGlzIGF2YWlsYWJsZQogPj4g
b24gdGhlIERvY2tlciBodWIsIGFzIHB1c2hpbmcgNjUwK01pQiB0YWtlcyBxdWl0ZSBzb21lIHRp
bWUgb24gbXkKID4+IERTTCBsaW5lLi4uCgpDb21taXR0ZWQgdG8gMjAyMS4wMi54IGFuZCAyMDIx
LjA4LngsIHRoYW5rcy4KCiA+IFRlc3RlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPgoKID4gaHR0cHM6Ly9naXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9waXBl
bGluZXMvNDEzMzUwOTYxL2ZhaWx1cmVzCgogPiBNYXliZSB3ZSBjYW4gYWxzbyBiYWNrcG9ydCB0
aGUgcGF0Y2ggc3dpdGNoaW5nIHRvIHRoZSBnaXRsYWIgcmVnaXN0cnk/CiA+IGh0dHA6Ly9saXN0
cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjEtTm92ZW1iZXIvNjI4NTAyLmh0
bWwKCldlIGNhbi4gSXMgdGhlIDIwMjExMTIwLjE5MjUgaW1hZ2UgdGhlcmUgYWxyZWFkeT8KCi0t
IApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
