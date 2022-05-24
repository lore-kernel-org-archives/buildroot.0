Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02456C433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 10:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B62040C20;
	Tue, 24 May 2022 10:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y_9q7Dsrv8fS; Tue, 24 May 2022 10:26:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D55440C11;
	Tue, 24 May 2022 10:26:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFBDF1BF25F
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 10:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC64A40C0E
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 10:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qA72Wtn45Psq for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 10:26:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85867405E0
 for <buildroot@buildroot.org>; Tue, 24 May 2022 10:26:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 90B301820C3; Tue, 24 May 2022 12:25:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1653387954; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=T/565C0PUpcG511RhqwBbaMkXyshxg+Gc67GnsLpliI=;
 b=Id1OJNz0/4SzUGms7nndxxu7TdzEtnVFyAv8X8zAYH32gAoTaeX9GDVdYDPprwFXlemC8c
 6LeohXtYLlcWV7sSgMV6vrwPaTx//KnO+sh/gYmFRW62fdPVuFU7IJD1KEDinaKc4Ah/F8
 4CULKqhMJejgI0bXq3ndN9Bzirsy63U=
In-Reply-To: <20220519201219.GB3682468@momiji>
Date: Tue, 24 May 2022 12:25:51 +0200
To: "Adrian Perez de Castro" <aperez@igalia.com>
MIME-Version: 1.0
Message-ID: <49-628cb280-3-6e046780@154311738>
User-Agent: SOGoMail 5.6.0
X-Last-TLS-Session-Version: None
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/1=5D_package/wpewebkit=3A__bump?=
 =?utf-8?q?_to_version_2=2E36=2E2?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWRyaWFuLAoKT24gVGh1cnNkYXksIE1heSAxOSwgMjAyMiAxOToxMiBDRVNULCBBZHJpYW4g
UGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cgo+IEhpLAo+IAo+IE9u
IFRodSwgMTkgTWF5IDIwMjIgMTg6MzE6MzAgKzAyMDAgRnJhbsOnb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPiB3cm90ZToKPiA+IExlIG1lci4gMTggbWFpIDIwMjIgw6AgMTY6
MTksIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiBhCj4gPiDDqWNy
aXQgOgo+ID4gCj4gPiA+IEJ1Z2ZpeCByZWxlYXNlLCBtb3N0bHkgd2l0aCBidWlsZCBmaXhlcywg
YW5kIGFuIGltcG9ydGFudCBmaXggZm9yCj4gPiA+IHdoZW4gdXNpbmcgdGhyZWFkZWQgcmVuZGVy
aW5nLiBSZWxlYXNlIG5vdGVzOgo+ID4gPgo+ID4gPiAgIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9y
ZWxlYXNlL3dwZXdlYmtpdC0yLjM2LjIuaHRtbAo+ID4gPgo+ID4gPiBUaGlzIHJlbGVhc2UgZmFp
bHMgdG8gYnVpbGQgd2hlbiBYMTEgaGVhZGVycyBhcmUgbm90IHByZXNlbnQsIGJ1dCB0aGVyZQo+
ID4gPiBpcyBhbHJlYWR5IGEgZml4IGFjY2VwdGVkIHVwc3RyZWFtIGFuZCBzbGF0ZWQgZm9yIGlu
Y2x1c2lvbiBpbiB0aGUgbmV4dAo+ID4gPiByZWxlYXNlIGluIHRoZSBzZXJpZXMsIHNvIGluIHRo
ZSBtZWFudGltZSBpbXBvcnRlZCBpdCBsb2NhbGx5Lgo+ID4gPgo+ID4gPgo+ID4gd2Via2l0Z3Rr
IDIuMzYuMSAoZnJvbSBCUiAyMDIyLjA1LXJjMSkgaGFzIGFsc28gdGhpcyBpc3N1ZS4KPiA+IHBh
dGNoIGZyb20gaHR0cHM6Ly9idWdzLndlYmtpdC5vcmcvc2hvd19idWcuY2dpP2lkPTIzOTAzOSBz
b2x2ZXMgaXQuCj4gCj4gSSB3YXMgaW4gdGhlIG1pZGRsZSBvZiBwcmVwYXJpbmcgdGhlIDIuMzYu
MiB1cGRhdGUgZm9yIHdlYmtpdGd0aywgd2hpY2gKPiB3b3VsZCBpbmNsdWRlIHRoaXMgcGF0Y2gg
YXMgd2VsbDsgYnV0IHRoZW4gSSBmb3VuZCBhIGRpZmZlcmVudCBidWlsZAo+IGlzc3VlLiBUaGVu
IHdoaWxlIGxvb2tpbmcgaW50byBpdCBBcHBsZSBwdWJsaXNoZWQgYSBuZXcgbGlzdCBvZiBzZWN1
cml0eQo+IGJ1Z3MsIHdoaWNoIG1lYW5zIHdlIG5lZWQgdG8gbWFrZSBhIG5ldyAod2hpY2ggd2ls
bCBiZSAyLjM2LjMpIGZvciBib3RoCj4gcG9ydHMgaW5jbHVkaW5nIHRoZSBmaXhlcy4uLiBzbyBJ
IGhhdmUgbWVyZ2VkIHRoZSBidWlsZCBmaXggZm9yIHRoZSBYMTEKPiBoZWFkZXJzIGluIHRoZSBy
ZWxlYXNlIGJyYW5jaCBhbmQgd2Ugd29uJ3QgZXZlbiBuZWVkIHRvIGltcG9ydCB0aGUgcGF0Y2gK
PiBpbiBCdWlsZHJvb3QuCj4gCj4gRldJVzogbGV0J3Mgbm90IG1lcmdlIHRoZSAyLjM2LjIgdXBk
YXRlIGZvciB3cGV3ZWJraXQsIGJlY2F1c2UgaW4gYSBmZXcKPiBkYXlzIEkgd2lsbCBzZW5kIGFu
eXdheSBwYXRjaGVzIHRvIGdvIGRpcmVjdGx5IHRvIDIuMzYuMwo+IAoKSSBqdXN0IHRlc3RlZCB0
aGUgMjAyMi4wNS1yYzEgKyB0aGlzIHBhdGNoIHdpdGggbXkgY29uZmlnLgoKVGhlIHBhdGNoIHNv
bHZlZCB0aGUgWDExIGhlYWRlcnMgYnVpbGQgZXJyb3IgYnV0IEknbSBnZXR0aW5nIHR3byBvdGhl
ciBlcnJvcnMuCgooVGhpcyBhcHBsaWVzIHRvIDIuMzYuMSBhcyB3ZWxsIGFzIDIuMzYuMiwgYm90
aCBwYXRjaGVkKQoKVGhlIGZpcnN0IG9uZSAiZGlzYXBwZWFycyIgd2hlbiBJIGlzc3VlICJtYWtl
IHdwZXdlYmtpdCIgYSBzZWNvbmQgdGltZSwgc28gSSBndWVzcyB0aGlzCmlzIGEgY29uY3VycmVu
Y3kgaXNzdWUgaW4gdGhlIGJ1aWxkIHNldHVwOgoKWyAzOSVdIEJ1aWx0IHRhcmdldCBKYXZhU2Ny
aXB0Q29yZV9Db3B5UHJpdmF0ZUhlYWRlcnMKU2Nhbm5pbmcgZGVwZW5kZW5jaWVzIG9mIHRhcmdl
dCBqc2MKbWFrZVs0XTogKioqIE5vIHJ1bGUgdG8gbWFrZSB0YXJnZXQgJ1NvdXJjZS9KYXZhU2Ny
aXB0Q29yZS9DTWFrZUZpbGVzL0xvd0xldmVsSW50ZXJwcmV0ZXJMaWIuZGlyL2xsaW50L0xvd0xl
dmVsSW50ZXJwcmV0ZXIuY3BwLm8nLCBuZWVkZWQgYnkgJ2Jpbi9qc2MnLiAgU3RvcC4KbWFrZVs0
XTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KWyAzOSVdIEJ1aWxkaW5nIENY
WCBvYmplY3QgU291cmNlL0phdmFTY3JpcHRDb3JlL3NoZWxsL0NNYWtlRmlsZXMvanNjLmRpci9f
Xy9qc2MuY3BwLm8KbWFrZVszXTogKioqIFtDTWFrZUZpbGVzL01ha2VmaWxlMjo3OTQ6IFNvdXJj
ZS9KYXZhU2NyaXB0Q29yZS9zaGVsbC9DTWFrZUZpbGVzL2pzYy5kaXIvYWxsXSBFcnJvciAyCm1h
a2VbM106ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uClNjYW5uaW5nIGRlcGVu
ZGVuY2llcyBvZiB0YXJnZXQgTG93TGV2ZWxJbnRlcnByZXRlckxpYgpbIDM5JV0gQnVpbGRpbmcg
Q1hYIG9iamVjdCBTb3VyY2UvSmF2YVNjcmlwdENvcmUvQ01ha2VGaWxlcy9Mb3dMZXZlbEludGVy
cHJldGVyTGliLmRpci9sbGludC9Mb3dMZXZlbEludGVycHJldGVyLmNwcC5vClsgMzklXSBCdWls
dCB0YXJnZXQgTG93TGV2ZWxJbnRlcnByZXRlckxpYgpbIDM5JV0gQnVpbHQgdGFyZ2V0IFdlYklu
c3BlY3RvclVJCm1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MTcxOiBhbGxdIEVycm9yIDIKCmFuZCB0
aGUgYnVpbGQgdWx0aW1hdGVseSB0aGVuIGxhdGVyIGZhaWxzIHdpdGggdGhpcyBlcnJvcjoKClsg
NDglXSBCdWlsZGluZyBDWFggb2JqZWN0IFNvdXJjZS9XZWJDb3JlL0NNYWtlRmlsZXMvV2ViQ29y
ZS5kaXIvX18vX18vV2ViQ29yZS9EZXJpdmVkU291cmNlcy91bmlmaWVkLXNvdXJjZXMvVW5pZmll
ZFNvdXJjZS1jYmRmZTMyMy00Mi5jcHAubwpJbiBmaWxlIGluY2x1ZGVkIGZyb20gcGxhdGZvcm0v
Z3JhcGhpY3MvZmlsdGVycy9GRVNwZWN1bGFyTGlnaHRpbmcuaDoyNSwKICAgICAgICAgICAgICAg
ICBmcm9tIHN2Zy9TVkdGRVNwZWN1bGFyTGlnaHRpbmdFbGVtZW50Lmg6MjUsCiAgICAgICAgICAg
ICAgICAgZnJvbSAuLi8uLi9XZWJDb3JlL0Rlcml2ZWRTb3VyY2VzL0pTU1ZHRkVTcGVjdWxhckxp
Z2h0aW5nRWxlbWVudC5oOjI2LAogICAgICAgICAgICAgICAgIGZyb20gLi4vLi4vV2ViQ29yZS9E
ZXJpdmVkU291cmNlcy9KU1NWR0ZFU3BlY3VsYXJMaWdodGluZ0VsZW1lbnQuY3BwOjIyLAogICAg
ICAgICAgICAgICAgIGZyb20gLi4vLi4vV2ViQ29yZS9EZXJpdmVkU291cmNlcy91bmlmaWVkLXNv
dXJjZXMvVW5pZmllZFNvdXJjZS0zYTUyY2U3OC0xMTkuY3BwOjU6CnBsYXRmb3JtL2dyYXBoaWNz
L2ZpbHRlcnMvRkVMaWdodGluZy5oOjcyOjQxOiBlcnJvcjog4oCYTGlnaHRpbmdEYXRh4oCZIGRv
ZXMgbm90IG5hbWUgYSB0eXBlCiAgIDcyIHwgICAgIGlubGluZSB2b2lkIHBsYXRmb3JtQXBwbHlO
ZW9uKGNvbnN0IExpZ2h0aW5nRGF0YSYsIGNvbnN0IExpZ2h0U291cmNlOjpQYWludGluZ0RhdGEm
KTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+Cm1ha2VbNF06ICoqKiBbU291cmNlL1dlYkNvcmUvQ01ha2VGaWxlcy9XZWJDb3JlLmRp
ci9idWlsZC5tYWtlOjUxNTI6IFNvdXJjZS9XZWJDb3JlL0NNYWtlRmlsZXMvV2ViQ29yZS5kaXIv
X18vX18vV2ViQ29yZS9EZXJpdmVkU291cmNlcy91bmlmaWVkLXNvdXJjZXMvVW5pZmllZFNvdXJj
ZS0zYTUyY2U3OC0xMTkuY3BwLm9dIEVycm9yIDEKCkkgdHJpZWQgdG8gZmluZCBpdCBpbiB0aGUg
d2Via2l0IGJ1Z3RyYWNrZXIgYnV0IHdhcyBub3Qgc3VjY2Vzc2Z1bC4gCgpNeSBXUEUgZGVmY29u
ZmlnIGlzIAoKQlIyX1BBQ0tBR0VfV1BFV0VCS0lUPXkKQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX1NB
TkRCT1g9eQoKd2l0aCB0aGUgYXJtIGdjYyAxMC4zIHRvb2xjaGFpbi4KCmRvIHlvdSBoYXZlIGFu
eSBpZGVhIGlmIHRoaXMgbWlnaHQgYmUgZml4ZWQgaW4gdGhlIHVwY29taW5nIDIuMzYuMz8KClJl
Z2FyZHMsCk1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
