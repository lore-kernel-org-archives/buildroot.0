Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E18C433F5
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 20:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E5D260A43;
	Tue, 23 Nov 2021 20:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ext-uhIl0leX; Tue, 23 Nov 2021 20:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F16C160A7E;
	Tue, 23 Nov 2021 20:50:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0EE71BF3A8
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 20:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0C0E80F42
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 20:50:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_0XsFLepl1v for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 20:50:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07539818BE
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 20:50:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (24)
Received: from [192.168.10.50] (host-81-161-202-22.oxylion.net.pl
 [81.161.202.22])
 by server220076.nazwa.pl (Postfix) with ESMTP id 6221D1C5D5F;
 Tue, 23 Nov 2021 21:50:05 +0100 (CET)
Message-ID: <453b1ace-86a2-224e-0f21-a95bd06be7b9@grinn-global.com>
Date: Tue, 23 Nov 2021 21:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: =?UTF-8?Q?Marcin_Niestr=c3=b3j?= <m.niestroj@grinn-global.com>
References: <20211123160833.29036-1-b.bilas@grinn-global.com>
 <87ee76mwjn.fsf@grinn-global.com>
From: Bartosz Bilas <b.bilas@grinn-global.com>
In-Reply-To: <87ee76mwjn.fsf@grinn-global.com>
Subject: Re: [Buildroot] [PATCH] configs/chiliboard: bump to u-boot 2020.10
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiAyMy4xMS4yMDIxIDIxOjQyLCBNYXJjaW4gTmllc3Ryw7NqIHdyb3RlOgo+IEJhcnRv
c3ogQmlsYXMgPGIuYmlsYXNAZ3Jpbm4tZ2xvYmFsLmNvbT4gd3JpdGVzOgo+Cj4+IEZpeGVzOgo+
PiAgIC91c3IvYmluL2xkOiBzY3JpcHRzL2R0Yy9kdGMtcGFyc2VyLnRhYi5vOiguYnNzKzB4MTAp
OiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIGB5eWxsb2MnOwo+PiAJc2NyaXB0cy9kdGMvZHRjLWxl
eGVyLmxleC5vOiguYnNzKzB4MCk6IGZpcnN0IGRlZmluZWQgaGVyZQo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBCYXJ0b3N6IEJpbGFzIDxiLmJpbGFzQGdyaW5uLWdsb2JhbC5jb20+Cj4+IC0tLQo+PiAg
IDIwMjAuMTAgdmVyc2lvbiBpcyB0aGUgbGF0ZXN0IG9uZSB0aGF0IGJvb3RzIGNvcnJlY3RseSwK
Pj4gICB0aGUgbmV3ZXIgb25lcyBhcmUgYmVpbmcgc3R1Y2sgZHVyaW5nIGNsb2NrcyBpbml0aWFs
aXphdGlvbi4KPj4KPiBUaGVyZSBpcyBhbHJlYWR5IGEgZml4IHB1bGxlZCBpbnRvIG1hc3RlciBi
cmFuY2ggb2YgdS1ib290LCBzbyB1cGNvbWluZwo+IHUtYm9vdCByZWxlYXNlIHNob3VsZCBiZSB3
b3JraW5nIGZpbmUuCgpJIGhhdmVuJ3Qgbm90aWNlZCB0aGF0LCBtYXliZSB0aGUgYmV0dGVyIGlk
ZWEgd291bGQgYmUgdG8gdXNlIHRoZSBsYXRlc3QgCnYyMDIxLjEwIHJlbGVhc2UgKyBhcHBseSB0
aGF0IHBhdGNoIGluc3RlYWQgb2YgdXNpbmcgdGhlIDIwMjAuMTAgdmVyc2lvbj8KCkJlc3QKQmFy
dGVrCj4KPj4gICBjb25maWdzL2dyaW5uX2NoaWxpYm9hcmRfZGVmY29uZmlnIHwgMiArLQo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvY29uZmlncy9ncmlubl9jaGlsaWJvYXJkX2RlZmNvbmZpZyBiL2NvbmZpZ3MvZ3Jp
bm5fY2hpbGlib2FyZF9kZWZjb25maWcKPj4gaW5kZXggZTcyYTgyY2VlOC4uODBmMzA3N2I3NiAx
MDA2NDQKPj4gLS0tIGEvY29uZmlncy9ncmlubl9jaGlsaWJvYXJkX2RlZmNvbmZpZwo+PiArKysg
Yi9jb25maWdzL2dyaW5uX2NoaWxpYm9hcmRfZGVmY29uZmlnCj4+IEBAIC0xNiw3ICsxNiw3IEBA
IEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4+ICAgQlIyX1RBUkdFVF9VQk9PVD15Cj4+ICAg
QlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15Cj4+ICAgQlIyX1RBUkdFVF9V
Qk9PVF9DVVNUT01fVkVSU0lPTj15Cj4+IC1CUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9O
X1ZBTFVFPSIyMDIwLjAxIgo+PiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxV
RT0iMjAyMC4xMCIKPj4gICBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0iY2hpbGli
b2FyZCIKPj4gICBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JTUc9eQo+PiAgIEJSMl9UQVJHRVRf
VUJPT1RfRk9STUFUX0NVU1RPTT15Cj4gUmV2aWV3ZWQtYnk6IE1hcmNpbiBOaWVzdHJvaiA8bS5u
aWVzdHJvakBncmlubi1nbG9iYWwuY29tPgo+Cj4gLS0KPiBNYXJjaW4gTmllc3Ryw7NqCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
