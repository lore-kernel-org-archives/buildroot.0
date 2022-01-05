Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593AAC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 22:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C460482FD7;
	Wed,  5 Jan 2022 22:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bUn8ypp3Hb3g; Wed,  5 Jan 2022 22:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EDBB82CFD;
	Wed,  5 Jan 2022 22:23:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE93A1BF267
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 22:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E81C5828E3
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 22:23:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I77OjD2C7RAL for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 22:23:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C968D82D75
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 22:23:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A4646240003;
 Wed,  5 Jan 2022 22:23:50 +0000 (UTC)
Date: Wed, 5 Jan 2022 23:23:48 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20220105232348.68986536@windsurf>
In-Reply-To: <20211210141209.1812043-3-jose.pekkarinen@unikie.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-3-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/7] package/bmx7: new package
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

SGVsbG8gSm9zw6ksCgpPbiBGcmksIDEwIERlYyAyMDIxIDE2OjEyOjA1ICswMjAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gVGhpcyBwYXRj
aCB3aWxsIHByb3ZpZGUgYW4gaW5pdGlhbCBwYWNrYWdlCj4gZm9yIGJteDcgcHJvamVjdC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2ll
LmNvbT4KCkkgaGF2ZSBhcHBsaWVkIHRoaXMgcGF0Y2gsIHdpdGggYSBmZXcgY2hhbmdlcyAoc2Vl
IGJlbG93KS4gQnV0IEkgbXVzdApzYXkgSSBoZXNpdGF0ZWQuIERvIHlvdSByZWFsbHkgdXNlIHRo
aXM/IFRoaXMgcHJvamVjdCBoYXMgbm90IHNlZW4gYW55CnVwZGF0ZXMgc2luY2UgSnVseSAyMDE5
LCB0aGVyZSBpcyBhIHNpbXBsZSBwdWxsIHJlcXVlc3QgZml4aW5nIHRoZQpTSU9DR1NUQU1QIGlz
c3VlIHRoYXQgaGFzIG5ldmVyIGJlZW4gbG9va2VkIGF0LCBhbmQgdGhlcmUgYXJlCmFsdGVybmF0
aXZlcyBzdWNoIGFzIG9sc3IgYW5kIGJhdG1hbi1hZHYgd2hpY2ggYXJlIGFjdGl2ZWx5IG1haW50
YWluZWQuCgpBbHNvLCBnY2MgZ2VuZXJhdGVzIHRvbnMgYW5kIHRvbnMgb2Ygd2FybmluZ3MsIHdo
aWNoIGlzIHF1aXRlIHdvcnJ5aW5nLAphcyBnY2MgdGVuZHMgdG8gYmVjb21lIG1vcmUgYW5kIG1v
cmUgc3RyaWN0LCBhbmQgdXBzdHJlYW0gaXMgbm8gbG9uZ2VyCmFjdGl2ZS4KClNvIEkndmUgYXBw
bGllZCwgYnV0IEkgcmVhbGx5IGhlc2l0YXRlZC4KCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Jt
eDcvQ29uZmlnLmluIGIvcGFja2FnZS9ibXg3L0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uM2MxM2MwNDdlOQo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9wYWNrYWdlL2JteDcvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwxNiBAQAo+ICtjb25maWcgQlIy
X1BBQ0tBR0VfQk1YNwo+ICsJYm9vbCAiYm14NyIKPiArCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNf
TElCUyAjIGRsb3BlbigpCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfWkxJQgo+ICsJc2VsZWN0IEJS
Ml9QQUNLQUdFX0xJQlpMSUIKCkkgZHJvcHBlZCB0aGF0LCBhbmQgdGVzdGVkIGl0IGJ1aWxkcyBm
aW5lIHdpdGggemxpYi1uZy4KCgo+ICtCTVg3X1ZFUlNJT04gPSB2Ny4xLjEKPiArQk1YN19TT1VS
Q0UgPSAkKEJNWDdfVkVSU0lPTikudGFyLmd6Cj4gK0JNWDdfU0lURSA9IGh0dHBzOi8vZ2l0aHVi
LmNvbS9ibXgtcm91dGluZy9ibXg3L2FyY2hpdmUvcmVmcy90YWdzCgpDaGFuZ2VkIHRoYXQgdG8g
dXNlIHRoZSBnaXRodWIgbWFjcm8gdGhhdCB3ZSBoYXZlIGluIEJ1aWxkcm9vdC4KCj4gK0JNWDdf
TElDRU5TRSA9IEdQTC0yCgpDaGFuZ2VkIHRvIEdQTC0yLjAuCgo+ICtCTVg3X0xJQ0VOU0VfRklM
RVMgPSBMSUNFTlNFCj4gK0JNWDdfREVQRU5ERU5DSUVTID0gemxpYiBtYmVkdGxzIHdpcmVsZXNz
X3Rvb2xzCj4gKwo+ICtkZWZpbmUgQk1YN19CVUlMRF9DTURTCj4gKwkoY2QgJChARCk7IFwKPiAr
CSQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQpLyQoZCkvc3JjIENDPSIkKFRBUkdF
VF9DQykiKQoKQ2hhbmdlZCB0bzoKCiAgICAgICAgJChUQVJHRVRfTUFLRV9FTlYpICQoVEFSR0VU
X0NPTkZJR1VSRV9PUFRTKSAkKE1BS0UpIC1DICQoQEQpLyQoZCkvc3JjCgpJLmUsIG5vdCBuZWVk
IHRvIGNkIGludG8gJChARCksIGFuZCB0aGVuIHVzaW5nICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRT
KQp0byBwYXNzIGFsbCB2YXJpYWJsZXMsIG5vdCBqdXN0IENDLgoKQmVzdCByZWdhcmRzLAoKVGhv
bWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
