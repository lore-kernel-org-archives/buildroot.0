Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7B3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 21:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B82240252;
	Tue, 23 Nov 2021 21:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SX46l8uECPqJ; Tue, 23 Nov 2021 21:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD4BB4024A;
	Tue, 23 Nov 2021 21:19:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2CD01BF47F
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 21:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC48B60754
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 21:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fiYXtNdKEQ7X for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 21:19:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D618360747
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 21:19:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (18)
Received: from [192.168.10.50] (host-81-161-202-22.oxylion.net.pl
 [81.161.202.22])
 by server220076.nazwa.pl (Postfix) with ESMTP id 102E01C6618;
 Tue, 23 Nov 2021 22:19:33 +0100 (CET)
Message-ID: <946f6386-e79a-265f-14d8-aab2b6f53897@grinn-global.com>
Date: Tue, 23 Nov 2021 22:19:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: =?UTF-8?Q?Marcin_Niestr=c3=b3j?= <m.niestroj@grinn-global.com>
References: <20211123160833.29036-1-b.bilas@grinn-global.com>
 <87ee76mwjn.fsf@grinn-global.com>
 <453b1ace-86a2-224e-0f21-a95bd06be7b9@grinn-global.com>
 <87a6humvsf.fsf@grinn-global.com>
From: Bartosz Bilas <b.bilas@grinn-global.com>
In-Reply-To: <87a6humvsf.fsf@grinn-global.com>
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

Ck9uIDIzLjExLjIwMjEgMjE6NTksIE1hcmNpbiBOaWVzdHLDs2ogd3JvdGU6Cj4gQmFydG9zeiBC
aWxhcyA8Yi5iaWxhc0Bncmlubi1nbG9iYWwuY29tPiB3cml0ZXM6Cj4KPj4gSGksCj4+Cj4+IE9u
IDIzLjExLjIwMjEgMjE6NDIsIE1hcmNpbiBOaWVzdHLDs2ogd3JvdGU6Cj4+PiBCYXJ0b3N6IEJp
bGFzIDxiLmJpbGFzQGdyaW5uLWdsb2JhbC5jb20+IHdyaXRlczoKPj4+Cj4+Pj4gRml4ZXM6Cj4+
Pj4gICAgL3Vzci9iaW4vbGQ6IHNjcmlwdHMvZHRjL2R0Yy1wYXJzZXIudGFiLm86KC5ic3MrMHgx
MCk6IG11bHRpcGxlIGRlZmluaXRpb24gb2YgYHl5bGxvYyc7Cj4+Pj4gCXNjcmlwdHMvZHRjL2R0
Yy1sZXhlci5sZXgubzooLmJzcysweDApOiBmaXJzdCBkZWZpbmVkIGhlcmUKPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IEJhcnRvc3ogQmlsYXMgPGIuYmlsYXNAZ3Jpbm4tZ2xvYmFsLmNvbT4KPj4+
PiAtLS0KPj4+PiAgICAyMDIwLjEwIHZlcnNpb24gaXMgdGhlIGxhdGVzdCBvbmUgdGhhdCBib290
cyBjb3JyZWN0bHksCj4+Pj4gICAgdGhlIG5ld2VyIG9uZXMgYXJlIGJlaW5nIHN0dWNrIGR1cmlu
ZyBjbG9ja3MgaW5pdGlhbGl6YXRpb24uCj4+Pj4KPj4+IFRoZXJlIGlzIGFscmVhZHkgYSBmaXgg
cHVsbGVkIGludG8gbWFzdGVyIGJyYW5jaCBvZiB1LWJvb3QsIHNvIHVwY29taW5nCj4+PiB1LWJv
b3QgcmVsZWFzZSBzaG91bGQgYmUgd29ya2luZyBmaW5lLgo+PiBJIGhhdmVuJ3Qgbm90aWNlZCB0
aGF0LCBtYXliZSB0aGUgYmV0dGVyIGlkZWEgd291bGQgYmUgdG8gdXNlIHRoZSBsYXRlc3QKPj4g
djIwMjEuMTAgcmVsZWFzZSArIGFwcGx5IHRoYXQgcGF0Y2ggaW5zdGVhZCBvZiB1c2luZyB0aGUg
MjAyMC4xMCB2ZXJzaW9uPwo+Pgo+IEkgYW0gb2theSB3aXRoIHVzaW5nIDIwMjAuMTAgZm9yIG5v
dywgYXMgaXQgaXMgcHJvdmVuIHRvIHdvcmsuCgpPaywgc28gbGV0IGl0IHN0YXkgYXMgaXQgaXMg
dGhlbi4KCkJlc3QKQmFydGVrCj4KPj4gQmVzdAo+PiBCYXJ0ZWsKPj4+PiAgICBjb25maWdzL2dy
aW5uX2NoaWxpYm9hcmRfZGVmY29uZmlnIHwgMiArLQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2NvbmZp
Z3MvZ3Jpbm5fY2hpbGlib2FyZF9kZWZjb25maWcgYi9jb25maWdzL2dyaW5uX2NoaWxpYm9hcmRf
ZGVmY29uZmlnCj4+Pj4gaW5kZXggZTcyYTgyY2VlOC4uODBmMzA3N2I3NiAxMDA2NDQKPj4+PiAt
LS0gYS9jb25maWdzL2dyaW5uX2NoaWxpYm9hcmRfZGVmY29uZmlnCj4+Pj4gKysrIGIvY29uZmln
cy9ncmlubl9jaGlsaWJvYXJkX2RlZmNvbmZpZwo+Pj4+IEBAIC0xNiw3ICsxNiw3IEBAIEJSMl9U
QVJHRVRfUk9PVEZTX0VYVDJfND15Cj4+Pj4gICAgQlIyX1RBUkdFVF9VQk9PVD15Cj4+Pj4gICAg
QlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15Cj4+Pj4gICAgQlIyX1RBUkdF
VF9VQk9PVF9DVVNUT01fVkVSU0lPTj15Cj4+Pj4gLUJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZF
UlNJT05fVkFMVUU9IjIwMjAuMDEiCj4+Pj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJ
T05fVkFMVUU9IjIwMjAuMTAiCj4+Pj4gICAgQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05G
SUc9ImNoaWxpYm9hcmQiCj4+Pj4gICAgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfSU1HPXkKPj4+
PiAgICBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9DVVNUT009eQo+Pj4gUmV2aWV3ZWQtYnk6IE1h
cmNpbiBOaWVzdHJvaiA8bS5uaWVzdHJvakBncmlubi1nbG9iYWwuY29tPgo+Pj4KPj4+IC0tCj4+
PiBNYXJjaW4gTmllc3Ryw7NqCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo+Cj4gLS0KPiBNYXJjaW4gTmllc3Ryw7NqCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
