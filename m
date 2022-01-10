Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56051C4332F
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 09:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC2C6059B;
	Mon, 10 Jan 2022 09:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id je28vvpLlbTz; Mon, 10 Jan 2022 09:02:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE94C60ACB;
	Mon, 10 Jan 2022 09:02:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CAEC1BF29A
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 09:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10F1B40327
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 09:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhEUNnEu_3T7 for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 09:02:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65500400A6
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 09:02:24 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 70E54200003;
 Mon, 10 Jan 2022 09:02:20 +0000 (UTC)
Date: Mon, 10 Jan 2022 10:02:18 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220110100218.1a1319ec@bootlin.com>
In-Reply-To: <20220101160533.GE2777@scaer>
References: <20211112131258.2671293-1-herve.codina@bootlin.com>
 <20211112131258.2671293-3-herve.codina@bootlin.com>
 <20220101160533.GE2777@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/5] package/ulog: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFNhdCwgMSBKYW4gMjAyMiAxNzowNTozMyArMDEwMAoiWWFubiBFLiBNT1JJ
TiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gSGVydsOpLCBBbGwsCj4gCj4g
T24gMjAyMS0xMS0xMiAxNDoxMiArMDEwMCwgSGVydmUgQ29kaW5hIHNwYWtlIHRodXNseToKPiA+
IFRoZSB1bG9nIGxpYnJhcnkgaXMgYSBtaW5pbWFsaXN0aWMgbG9nZ2luZyBsaWJyYXJ5IGRlcml2
ZWQgZnJvbQo+ID4gQW5kcm9pZCBsb2dnZXIuCj4gPiAKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9Q
YXJyb3QtRGV2ZWxvcGVycy91bG9nCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEhlcnZlIENvZGlu
YSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPiAgCj4gWy0tU05JUC0tXQo+ID4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvdWxvZy91bG9nLm1rIGIvcGFja2FnZS91bG9nL3Vsb2cubWsKPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi5mYWIxNmU4MGQ4Cj4gPiAtLS0g
L2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL3Vsb2cvdWxvZy5tawo+ID4gQEAgLTAsMCArMSw0
NCBAQAo+ID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiArIwo+ID4gKyMgdWxvZwo+ID4g
KyMKPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gKwo+ID4gK1VMT0dfVkVSU0lPTiA9
IDAzODlkMjQzMzUyMjU1ZjYxODIzMjZkY2NkYWUzZDU2ZGFkYzA3OGYKPiA+ICtVTE9HX1NJVEUg
PSAkKGNhbGwgZ2l0aHViLFBhcnJvdC1EZXZlbG9wZXJzLHVsb2csJChVTE9HX1ZFUlNJT04pKQo+
ID4gK1VMT0dfTElDRU5TRSA9IEFwYWNoZS0yLjAKPiA+ICtVTE9HX0xJQ0VOU0VfRklMRVMgPSBD
T1BZSU5HCj4gPiArVUxPR19ERVBFTkRFTkNJRVMgPSBob3N0LWFsY2hlbXkKPiA+ICtVTE9HX0lO
U1RBTExfU1RBR0lORyA9IFlFUwo+ID4gKwo+ID4gK2RlZmluZSBVTE9HX0JVSUxEX0NNRFMKPiA+
ICsJJChBTENIRU1ZX1RBUkdFVF9FTlYpIFwKPiA+ICsJCSQoQUxDSEVNWV9NQUtFKSBsaWJ1bG9n
Cj4gPiArZW5kZWYKPiA+ICsKPiA+ICtkZWZpbmUgVUxPR19JTlNUQUxMX1NUQVRJQ19MSUJTCj4g
PiArCSQoSU5TVEFMTCkgLW0gNjQ0ICQoQEQpL2FsY2hlbXktb3V0L3N0YWdpbmcvdXNyL2xpYi9s
aWJ1bG9nLmEgJCgxKS91c3IvbGliLwo+ID4gK2VuZGVmICAKPiAKPiBTbywgaXQgbG9va3MgbGlr
ZSB5b3UgYXJlIGFsd2F5cyBnb2luZyB0byBpbnN0YWxsIHRoZSBzdGF0aWMgbGlicmFyeSwKPiBi
dXQgdGhlIHBhY2thZ2UgZG9lcyBub3QgaGF2ZTogIGRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElC
UwoKVGhlIHYzIHNlcmllcyB3aWxsIHRha2UgY2FyZSBvZiBCUjJfU1RBVElDX0xJQlMuCgo+IAo+
ID4gKwo+ID4gK2RlZmluZSBVTE9HX0lOU1RBTExfSEVBREVSUwo+ID4gKwljcCAtUmFmICQoQEQp
L2xpYnVsb2cvaW5jbHVkZS8qICQoMSkvdXNyL2luY2x1ZGUvCj4gPiArZW5kZWYKPiA+ICsKPiA+
ICtpZmVxICgkKEJSMl9TVEFUSUNfTElCUyksKQo+ID4gK2RlZmluZSBVTE9HX0lOU1RBTExfU0hB
UkVEX0xJQlMKPiA+ICsJJChJTlNUQUxMKSAtbSA3NTUgJChARCkvYWxjaGVteS1vdXQvc3RhZ2lu
Zy91c3IvbGliL2xpYnVsb2cuc28qICQoMSkvdXNyL2xpYi8gIAo+IAo+IEFsdGhvdWdoIGl0IGlz
IHZlcnkgaW1wcm9iYWJsZSB0aGF0IHRoZSBkZXN0aW5hdGlvbiBkaXJlY3RvcnkgZG9lcyBub3QK
PiBhbHJlYWR5IGV4aXN0LCB0aGF0IGlzIHN0aWxsIGEgcG9zc2liaWxpdHksIGVzcGVjaWFsbHkg
aW4gdGFyZ2V0Ly4gQW5kCj4gZm9yIGNvbnNpc3RlbmN5IHdpdGggYWxsIHRoZSBvdGhlciBwYWNr
YWdlcywgeW91IG11c3QgY3JlYXRlIHRoZQo+IGRlc3RpbmF0aW9uIGRpcmVjdG9yeSBmaXJzdCBi
ZWZvcmUgeW91IHN0YXJ0IGNvcHlpbmcgbXVsdGlwbGUgZmlsZXMgaW4KPiB0aGVyZS4KCldpbGwg
YmUgZml4ZWQgaW4gdjMKCj4gCj4gQWxzbyBmb3IgY29uc2lzdGVuY3ksIHVzZSBlaXRoZXIgJ2Nw
JyBvciAnJChJTlNUQUxMKScsIG5vdCBib3RoICwgaW4gdGhlCj4gc2FtZSAubWsgKHlvdSB1c2Vk
ICdjcCcgZm9yIGhlYWRlcnMsIGFuZCAnJChJTlNUQUxMKScgZm9yIGxpYnMsIGFsdGhvdWdoCj4g
SSBkb24ndCBzZWUgYSByZWFzb24gbm90IHRvIHVzZSB0aGVtIGNvbnNpc3RlbnRseSkuCj4gCj4g
T2gsIGFuZCBzaGFyZWQgbGlicmFyaWVzIGRvIG5vdCBuZWVkIHRvIGJlICt4LCBzbyAtbSA2NDQg
aXMgZW5vdWdoLgoKT2ssIEkgd2lsbCB1c2UgJyQoSU5TVEFMTCkgLW0gNjQ0ICcgaW4gdjMgc2Vy
aWVzCgo+IAo+ID4gK2VuZGVmCj4gPiArZW5kaWYKPiA+ICsKPiA+ICtkZWZpbmUgVUxPR19JTlNU
QUxMX1RBUkdFVF9DTURTCj4gPiArCSQoY2FsbCBVTE9HX0lOU1RBTExfU0hBUkVEX0xJQlMsICQo
VEFSR0VUX0RJUikpCj4gPiArZW5kZWYKPiA+ICsKPiA+ICtkZWZpbmUgVUxPR19JTlNUQUxMX1NU
QUdJTkdfQ01EUwo+ID4gKwkkKGNhbGwgVUxPR19JTlNUQUxMX1NUQVRJQ19MSUJTLCAkKFNUQUdJ
TkdfRElSKSkKPiA+ICsJJChjYWxsIFVMT0dfSU5TVEFMTF9TSEFSRURfTElCUywgJChTVEFHSU5H
X0RJUikpCj4gPiArCSQoY2FsbCBVTE9HX0lOU1RBTExfSEVBREVSUywgJChTVEFHSU5HX0RJUikp
Cj4gPiArCSQoY2FsbCBBTENIRU1ZX0lOU1RBTExfTElCX1NES19GSUxFLCB1bG9nLCBsaWJ1bG9n
LCBsaWJ1bG9nLnNvKSAgCj4gCj4gU28sIHdoYXQgaGFwcGVucyB3aXRoIEJSMl9TVEFUSUNfTElC
Uz15PyBUaGUgLnNvIHdvdWxkIG5vdCBleGlzdCBpbiB0aGF0Cj4gY2FzZSwgd291bGQgaXQ/IEJ1
dCB0aGVuLCB0aGlzIGlzIHdoYXQgd291bGQgYmUgcmVnaXN0ZXJlZCBpbiB0aGUKPiBhdG9tLm1r
Li4uCgpUaGUgZmlsZSBwYXNzZWQgdG8gQWxjaGVteSBtdXN0IGJlIHRoZSAuc28uCkludGVybmFs
bHksIHRoZSBzdGF0aWMgbmFtZSB3aWxsIGJlIGRlZHVjZWQgYnkgcmVwbGFjaW5nIHRoZSBzaGFy
ZWQKc3VmZml4ICguc28pIGJ5IHRoZSBzdGF0aWMgc3VmZml4ICguYSkKCj4gCj4gQW5kIHdpdGgg
QlIyX1NUQVRJQ19MSUJTIG5vdCBzZXQsIHRoZW4gdGhlIC5hIHNob3VsZCBub3QgYmUgYnVpbHQg
KG9yIGF0Cj4gbGVhc3Qgbm90IGluc3RhbGxlZCEpLCB5ZXQgdGhlIGluc3RhbGxhdGlvbiBvZiB0
aGUgc3RhdGljIGxpYiBpcwo+IHVuY29uZGl0aW9uYWwgKGFuZCBzZWUgdGhlIGZpcnN0IGNvbW1l
bnQgdG9vKS4KPiAKPiBJdCBpcyBkaWZmaWN1bHQgdG8gdW5kZXJzdGFuZCBpZiBhbGwgb2YgdGhl
IHN0YXRpYy1zaGFyZWQgY29tYmluYXRpb25zCj4gYXJlIHN1cHBvcnRlZCwgc28gY291bGQgeW91
IHBsZWFzZSBjaGVjay9jbGFyaWZ5IHRoaXM/Cj4gCj4gSWYgdGhlIHRocmVlIGNvbWJpbmF0aW9u
cyBhcmUgaW5kZWVkIHN1cHBvcnRlZCwgdGhlbiBib3RoIHRoZSBzaGFyZWQgYW5kCj4gdGhlIHN0
YWljIGluc3RhbGwgbWFjcm9zIHNob3VsZCBiZSBjb25kaXRpb25hbC4gT3RoZXJ3aXNlLCBwcm9w
ZXIgZ3VhcmRzCj4gc2hvdWxkIGJlIGFkZGVkIGluIHRoZSBDb25maWcuaW4uCgpJbiB0aGUgbmV4
dCB2ZXJzaW9uICh2Mykgb2YgdGhpcyBzZXJpZXMsIEkgd2lsbCBpbnN0YWxsIC5hIGFuZCAuc28g
YWNjb3JkaW5nCnRvIGZsYWdzIHNldCAoQlIyX3tTVEFUSUMsU0hBUkVEfV9MSUJTKS4KCkkgd2ls
bCBoYXZlIG9uZSBleGNlcHRpb246IGxpYnNoZGF0YSwgbGlic2hkYXRhLXNlY3Rpb24tbG9va3Vw
LmEuClRoaXMgc3RhdGljIGxpYiBpcyBuZWVkZWQgdG8gdXNlIGxpYnNoZGF0YSBhbmQgY2Fubm90
IGJlIGEgc2hhcmVkIGxpYnJhcnkuCkl0IGlzIGZvcmNlZCBhcyBzdGF0aWMgaW4gbGlic2hkYXRh
IGF0b20ubWsgZmlsZSAoaW5jbHVkZSAkKEJVSUxEX1NUQVRJQ19MSUJSQVJZKSkKClNvLCBJIGNo
b29zZSB0byBpbnN0YWxsIGl0IGV2ZW4gaWYgd2Ugc3VwcG9zZWQgdG8gYmUgc2hhcmVkIGxpYnJh
cnkgb25seSAoaWUKQlIyX1NIQVJFRF9MSUJTPXkpCgoKPiAKPiBUaG9zZSBjb21tZW50cyBhcHBs
eSB0byBhbGwgdGhlIHBha2NhZ2VzIGluIHRoaXMgc2VyaWVzLgo+IAoKVGhhbmtzIGZvciB0aGUg
cmV2aWV3LApIZXJ2w6kKCi0tIApIZXJ2w6kgQ29kaW5hLCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
