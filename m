Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EA6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:23:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB2060E08
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CB2060E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 181DB606A6;
	Sun, 14 Nov 2021 15:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elDi-L0BhMHn; Sun, 14 Nov 2021 15:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C2EC6061A;
	Sun, 14 Nov 2021 15:23:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3714B1BF964
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2777180BD8
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjXZJZMOyMM9 for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 15:23:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0179080BB4
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 15:23:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A5A0840002;
 Sun, 14 Nov 2021 15:23:43 +0000 (UTC)
Date: Sun, 14 Nov 2021 16:23:42 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20211114162342.41447d34@windsurf>
In-Reply-To: <20211025123117.3605744-1-salvador.joseluis@gmail.com>
References: <CAH+XeQao6Ea_p1Y20a7PqXBfhP+J1KGozTMLwQzuQieXvLwLVA@mail.gmail.com>
 <20211025123117.3605744-1-salvador.joseluis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/zfs: bump version to 2.0.6
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Philippe Serbruyns <Philippe.Serbruyns@ugent.be>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpPbiBNb24sIDI1IE9jdCAyMDIxIDE0OjMxOjE4ICswMjAwCkpvc8OpIEx1
aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPiB3cm90ZToKCj4g
QWRkZWQgcGF0Y2ggZnJvbSB1cHN0cmVhbSB0aGF0IGZpeGVzIHRoZSBgbWFrZWAgZXhlY3V0ZWQg
ZnJvbSB0aGUKPiBga2VybmVsLm00YCBpbiBjcm9zcy1wbGF0Zm9ybS1jb21waWxhdGlvbnMgZW52
aXJvbm1lbnRzLgoKVGhlcmUgaXMgbm8gcGF0Y2ggYWRkZWQgaW4gdGhpcyBwcm9wb3NlZCBwYXRj
aC4gSXQgc2VlbXMgbGlrZSB0aGlzCmNvbW1pdCBsb2cgd2FzIG5vdCBwcm9wZXJseSB1cGRhdGVk
IG5vdyB0aGF0IHlvdSdyZSBidW1waW5nIHRvIGEgbmV3CnZlcnNpb24gb2YgWkZTLgoKPiBBcyB0
aGlzIHZlcnNpb24gYnJpbmdzIHN1cHBvcnQgZm9yIGtlcm5lbCB1cCB0byA1LjE0LCB3ZSB1cGRh
dGUgdGhlCj4gdGVzdCBjYXNlcyB0byB1c2UgdGhlIDUuMTQga2VybmVsLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwu
Y29tPgo+IC0tLQo+IEkgZGlkbid0IGZpbmQgYW5vdGhlciBhbHRlcm5hdGl2ZSB5ZXQgdG86Cj4g
YGBgCj4gWkZTX01BS0VfRU5WID0gJChMSU5VWF9NQUtFX0ZMQUdTKQo+IFpGU19DT05GX0VOViA9
ICQoTElOVVhfTUFLRV9GTEFHUykKPiBgYGAKPiBBbnkgc3VnZ2VzdGlvbj8KCkRpZCB5b3UgdHJ5
IHRoZSBzdWdnZXN0aW9uIGZyb20gQXJub3V0LCB3aGljaCBoZSBtYWRlIG9uIEF1Z3VzdCAyOD8g
U2VlCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8xNDMzYWNjZi0zMDUwLTBmMmUt
OTcwMS0zZGE4N2M4YzdjMTJAbWluZC5iZS8KCgo+IC1jbGFzcyBUZXN0WmZzR2xpYmMoaW5mcmEu
YmFzZXRlc3QuQlJUZXN0KToKPiAtICAgIGNvbmZpZyA9IFwKPiAtICAgICAgICAiIiIKPiArY2xh
c3MgVGVzdFpmc0Jhc2UoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiArICAgIGNvbmZpZyA9ICIi
IgoKSXQgc2VlbXMgbGlrZSB5b3UgYXJlIGFsc28gcmVmYWN0b3JpbmcgdGhlIFpGUyB0ZXN0IGNh
c2VzIHRvIGF2b2lkCmR1cGxpY2F0aW5nIHRoZSBjb25maWd1cmF0aW9uIGZvciB0aGUgZ2xpYmMg
YW5kIHVjbGliYyBjYXNlcy4gVGhpcyBpcyBhCmdvb2QgaWRlYSwgYnV0IGl0IHNob3VsZCBiZSBk
b25lIGluIGEgc2VwYXJhdGUgcGF0Y2gsIGJlZm9yZSB0aGUgWkZTCmJ1bXAuCgpUaGFua3MhCgpU
aG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
