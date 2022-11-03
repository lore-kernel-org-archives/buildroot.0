Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB90C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 02:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4BD281E22;
	Thu,  3 Nov 2022 02:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4BD281E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8-PNHqGSdR4; Thu,  3 Nov 2022 02:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FD0A81E25;
	Thu,  3 Nov 2022 02:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FD0A81E25
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCE3A1BF337
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 02:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8E4A40168
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 02:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E4A40168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPLzTMr21iU4 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 02:02:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6842F400D0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6842F400D0
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 02:02:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (15)
Received: from zm (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id A48DA1BBFAA;
 Thu,  3 Nov 2022 03:02:45 +0100 (CET)
References: <20221102185739.2346971-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.8.11; emacs 28.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 03 Nov 2022 02:53:39 +0100
In-reply-to: <20221102185739.2346971-1-james.hilliard1@gmail.com>
Message-ID: <875yfwokvu.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/python-dbus-fast: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpTZWVtcyB0aGF0IHdlJ3ZlIGJlZW4gd29ya2luZyBvbiB0aGUgc2FtZSBzdHVm
ZiB0b2RheSwgYXMgSSd2ZSBqdXN0IHNlbnQKdGhlIHNhbWUgdXBkYXRlIG5vdy4KCkphbWVzIEhp
bGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IC0tLQo+ICBE
RVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBw
YWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBw
YWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvQ29uZmlnLmluICAgICAgICAgICAgIHwgIDcgKysrKysr
Kwo+ICBwYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5oYXNoIHwgIDUg
KysrKysKPiAgcGFja2FnZS9weXRob24tZGJ1cy1mYXN0L3B5dGhvbi1kYnVzLWZhc3QubWsgICB8
IDE2ICsrKysrKysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCsp
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvQ29uZmlnLmlu
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRi
dXMtZmFzdC5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1kYnVzLWZh
c3QvcHl0aG9uLWRidXMtZmFzdC5tawo+Cj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZF
TE9QRVJTCj4gaW5kZXggN2QyNzkzNjk5Mi4uNDEwNGEzM2Y3ZiAxMDA2NDQKPiAtLS0gYS9ERVZF
TE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0xODgxLDYgKzE4ODEsNyBAQCBGOglwYWNr
YWdlL211cmF0YS1jeXctZncvCj4gIEY6CXBhY2thZ2UvbmV0ZGF0YS8KPiAgRjoJcGFja2FnZS9w
eXRob24tYW5zaWNvbG9ycy8KPiAgRjoJcGFja2FnZS9weXRob24tYmxlYWsvCj4gK0Y6CXBhY2th
Z2UvcHl0aG9uLWRidXMtZmFzdC8KPgoKWW91J3ZlIGFkZGVkIG5ldyBlbnRyeSB1bmRlciBteSBu
YW1lLiBJIGhhdmUgbm90aGluZyBhZ2FpbnN0IChhcyBJIGhhdmUKcG9zdGVkIGFsbW9zdCB0aGUg
c2FtZSBwYXRjaCksIGJ1dCBJIGd1ZXNzIHRoaXMgd2FzIGJ5IG1pc3Rha2UsIHJpZ2h0PwoKPiAg
RjoJcGFja2FnZS9weXRob24tZGJ1cy1uZXh0Lwo+ICBGOglwYWNrYWdlL3B5dGhvbi1pbmljb25m
aWcvCj4gIEY6CXBhY2thZ2UvcHl0aG9uLWludGVsaGV4Lwo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggMjM4ZDc4MTNmMC4uZGI5ZTk0
ZjM1NyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29u
ZmlnLmluCj4gQEAgLTEwMTUsNiArMTAxNSw3IEBAIG1lbnUgIkV4dGVybmFsIHB5dGhvbiBtb2R1
bGVzIgo+ICAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1kYXBobmUvQ29uZmlnLmluIgo+ICAJc291
cmNlICJwYWNrYWdlL3B5dGhvbi1kYXRhcHJvcGVydHkvQ29uZmlnLmluIgo+ICAJc291cmNlICJw
YWNrYWdlL3B5dGhvbi1kYXRldXRpbC9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvcHl0
aG9uLWRidXMtZmFzdC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWRidXMt
bmV4dC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWRlY29yYXRvci9Db25m
aWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWRlZnVzZWR4bWwvQ29uZmlnLmluIgo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvQ29uZmlnLmluIGIvcGFja2Fn
ZS9weXRob24tZGJ1cy1mYXN0L0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uNDAwZTcwYmQ3Ygo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdl
L3B5dGhvbi1kYnVzLWZhc3QvQ29uZmlnLmluCj4gQEAgLTAsMCArMSw3IEBACj4gK2NvbmZpZyBC
UjJfUEFDS0FHRV9QWVRIT05fREJVU19GQVNUCj4gKwlib29sICJweXRob24tZGJ1cy1mYXN0Igo+
ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9BU1lOQ19USU1FT1VUICMgcnVudGltZQoKVGhl
cmUgaXMgcnVudGltZSBkZXBlbmRlbmN5IG9uIFhNTCwgd2hpY2ggSSBkaXNjb3ZlcmVkIHdpdGgg
cnVudGltZQp0ZXN0aW5nLiBTbyBtaXNzaW5nOgoKICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9O
M19QWUVYUEFUICMgcnVudGltZQoKPiArCWhlbHAKPiArCSAgQSBmYXN0ZXIgdmVyc2lvbiBvZiBk
YnVzLW5leHQuCj4gKwo+ICsJICBodHRwczovL2dpdGh1Yi5jb20vYmx1ZXRvb3RoLWRldmljZXMv
ZGJ1cy1mYXN0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRob24t
ZGJ1cy1mYXN0Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFz
dC5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5mMGRjZWVi
NDNkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRo
b24tZGJ1cy1mYXN0Lmhhc2gKPiBAQCAtMCwwICsxLDUgQEAKPiArIyBtZDUsIHNoYTI1NiBmcm9t
IGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9kYnVzLWZhc3QvanNvbgo+ICttZDUgIGVlYmYyYzU1OGRk
MWFmMGY4ZjMyYjM2MWU5MWYyZmEzICBkYnVzX2Zhc3QtMS42MS4xLnRhci5nego+ICtzaGEyNTYg
IGJkYTRhN2Q1NTkwNDdiNzRmNDA5ZWRhMjc4ZjY4ZjYxMGE0MThlODZhZDNlZmEwMzY4ZmEyZWQy
NDBkYWE2YjYgIGRidXNfZmFzdC0xLjYxLjEudGFyLmd6Cj4gKyMgTG9jYWxseSBjb21wdXRlZCBz
aGEyNTYgY2hlY2tzdW1zCj4gK3NoYTI1NiAgYzM3ZTljNzUxMTBlMDFkMWYwYzUzNjBkYzdkNzc3
NmEzMGFjNWY3MGQyNDQwZGIyMTQ0MjNlNGI3YTc3YTZhZiAgTElDRU5TRQo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5tayBiL3BhY2thZ2Uv
cHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5kZTcwNDliYTIyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3BhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lm1rCj4gQEAgLTAsMCAr
MSwxNiBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgcHl0aG9uLWRidXMt
ZmFzdAo+ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtQWVRIT05fREJVU19G
QVNUX1ZFUlNJT04gPSAxLjYxLjEKPiArUFlUSE9OX0RCVVNfRkFTVF9TT1VSQ0UgPSBkYnVzX2Zh
c3QtJChQWVRIT05fREJVU19GQVNUX1ZFUlNJT04pLnRhci5nego+ICtQWVRIT05fREJVU19GQVNU
X1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZGQvZjQvYTI4
MGQ0NmIxMTlkNTlmNmEzZDg0YWJmNDc0NDUyYWU3NjY1MTU1OGIwOTYzYWI4YzQ4YWUxM2I1YTQ0
Cj4gK1BZVEhPTl9EQlVTX0ZBU1RfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiArUFlUSE9OX0RC
VVNfRkFTVF9MSUNFTlNFID0gTUlUCj4gK1BZVEhPTl9EQlVTX0ZBU1RfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UKPiArUFlUSE9OX0RCVVNfRkFTVF9FTlYgPSBSRVFVSVJFX0NZVEhPTj0xCj4gK1BZ
VEhPTl9EQlVTX0ZBU1RfREVQRU5ERU5DSUVTID0gaG9zdC1weXRob24tY3l0aG9uCj4gKwo+ICsk
KGV2YWwgJChweXRob24tcGFja2FnZSkpCgoKLS0KTWFyY2luIE5pZXN0csOzagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
