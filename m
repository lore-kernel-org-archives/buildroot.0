Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA0DC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 15:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0C2240A3A;
	Thu,  6 Jan 2022 15:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HBfQtZbag4Op; Thu,  6 Jan 2022 15:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB811404F7;
	Thu,  6 Jan 2022 15:13:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F28C51BF3F6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAA594294A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhTyZH70vtwe for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 15:13:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79E6942907
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 15:13:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id DD0B560015;
 Thu,  6 Jan 2022 15:13:48 +0000 (UTC)
Date: Thu, 6 Jan 2022 16:13:47 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <20220106161347.014794a6@windsurf>
In-Reply-To: <365b8f6c-18b5-e30b-3c94-4dff3c51215f@linatsea.fr>
References: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
 <20211223111348.3532601-2-thierry.bultel@linatsea.fr>
 <20220105231654.GL614810@scaer>
 <365b8f6c-18b5-e30b-3c94-4dff3c51215f@linatsea.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/3] package/dracut: new host package
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

T24gVGh1LCA2IEphbiAyMDIyIDE1OjU2OjMyICswMTAwClRoaWVycnkgQnVsdGVsIDx0aGllcnJ5
LmJ1bHRlbEBsaW5hdHNlYS5mcj4gd3JvdGU6Cgo+IEtlZXBpbmcgaW4gbWluZCB0aGF0IHN5c3Rl
bWQgaXMgdGhlIG9mZmljaWFsbHkgc3VwcG9ydGVkIGluaXQgc3lzdGVtIGJ5IAo+IGRyYWN1dCwg
dGhlcmUgaXMgbm8gZXh0cmEgd29yawo+IGZvciBpdC4gSG93ZXZlciwgSSBicm91Z2h0IHN1cHBv
cnQgZm9yIGJ1c3lib3ggaW5pdCwgdGhyb3VnaCB0aGUgYWJvdmUgCj4gZHJhY3V0IG1vZHVsZSAo
MDVidXN5Ym94LWJ1aWxkcm9vdCkuCj4gQWRkaW5nIHN1cHBvcnQgZm9yIHRoZSBvdGhlciBvbmVz
IGNvdWxkIGJlIGRvbmUgbGF0ZXIsIHNvIEkgc3VnZ2VzdCB3ZSAKPiBzaW1wbHkgZGlzYWJsZSBk
cmFjdXQgd2hlbiB0aGUKPiBpbml0IHN5c3RlbSBpcyBub3Qgc3VwcG9ydGVkOyBieSBhZGRpbmcK
PiAKPiAgwqDCoMKgIGRlcGVuZHMgb24gIUJSMl9JTklUX1NZU1YKPiAgwqDCoMKgIGRlcGVuZHMg
b24gIUJSMl9JTklUX09QRU5SQwo+IAo+IGluIENvbmZpZy5pbi5ob3N0OyB3aXRoIHRoZSBhcHBy
b3ByaWF0ZSBjb21tZW50LiBEb2VzIHRoYXQgc291bmQgCj4gYWNjZXB0YWJsZSA/CgpCdXQgaXMg
aXQganVzdCB0aGUgaW5pdCBzeXN0ZW0gdGhhdCByZXF1aXJlcyB0aG9zZSBzcGVjaWFsIGRyYWN1
dAoibW9kdWxlcyIgPyBPciBvdGhlciBhc3BlY3RzIG9mIHRoZSBzeXN0ZW0gd2lsbCBhbHNvIHJl
cXVpcmUgc29tZQpzcGVjaWFsIG1vZHVsZXMgPwoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25p
LCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
