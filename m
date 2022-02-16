Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57F0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 00:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43BAC4088A;
	Wed, 16 Feb 2022 00:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzJqg488hnzR; Wed, 16 Feb 2022 00:53:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85B7B40529;
	Wed, 16 Feb 2022 00:53:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9914D1BF2A4
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 00:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82D71828B3
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 00:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ja45g80Tw3hU for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 00:53:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [60.248.187.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 286A482890
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 00:53:20 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 21G0r8Tv085539;
 Wed, 16 Feb 2022 08:53:08 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Wed, 16 Feb 2022 08:53:06 +0800
Date: Wed, 16 Feb 2022 08:52:13 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YgxKvW3ab+JbmYA/@APC323>
References: <Ygs2xMj+B0UhKFxh@APC323>
 <E6BF6E53-C2C5-4FA5-8419-34B11400C780@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E6BF6E53-C2C5-4FA5-8419-34B11400C780@benettiengineering.com>
User-Agent: Mutt/2.1.4 (93ef06ae) (2021-12-11)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 21G0r8Tv085539
Subject: Re: [Buildroot] [PATCH 2/3] board/andes/ae350: add support for
 Andes AE350
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

SGkgR2l1bGlvLAoKPiBPbiBUdWUsIEZlYiAxNSwgMjAyMiBhdCAwMjowMDozNlBNICswMTAwLCBH
aXVsaW8gQmVuZXR0aSB3cm90ZToKPiA+IEhpIFBldGVyLAo+ID4gCj4gPiA+IElsIGdpb3JubyAx
NSBmZWIgMjAyMiwgYWxsZSBvcmUgMDY6MTYsIFl1IENoaWVuIFBldGVyIExpbiA8cGV0ZXJsaW5A
YW5kZXN0ZWNoLmNvbT4gaGEgc2NyaXR0bzoKPiA+ID4gCj4gPiA+IO+7vwo+ID4gPj4gCj4gPiA+
Pj4gT24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTA6MzI6MDFBTSArMDgwMCwgWXUgQ2hpZW4gUGV0
ZXIgTGluIHdyb3RlOgo+ID4gPj4+IFRoaXMgcGF0Y2ggcHJvdmlkZXMgZGVmY29uZmlnIGFuZCBi
YXNpYyBzdXBwb3J0IGZvciB0aGUgQW5kZXMKPiA+ID4+PiA0NSBzZXJpZXMgUklTQy1WIGFyY2hp
dGVjdHVyZS4KPiA+ID4+PiAKPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBZdSBDaGllbiBQZXRlciBM
aW4gPHBldGVybGluQGFuZGVzdGVjaC5jb20+Cj4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogQWxhbiBL
YW8gPGFsYW5rYW9AYW5kZXN0ZWNoLmNvbT4KPiA+ID4+PiAtLS0KPiA+ID4+PiBDaGFuZ2VzCj4g
PiA+Pj4gVjEtPlYyOgo+ID4gPj4+ICogbW92ZSBsaW51eCBzb3VyY2UgY29kZSBhbmQgaXRzIHBh
dGNoZXMgdG8gQW5kZXNUZWNoIEdpdGh1YiByZXBvCj4gPiA+Pj4gKiByZW5hbWUgYWUzNTBfYW5k
ZXN0YXI0NV9kZWZjb25maWcgdG8gYW5kZXNfYWUzNTBfNDVfZGVmY29uZmlnCj4gPiA+Pj4gKiBj
aGFuZ2UgQyBsaWJyYXJ5IHRvIHVDbGliYwo+ID4gPj4+ICogcmVtb3ZlIE9wZW5TU0wgcGFja2Fn
ZQo+ID4gPj4+ICogcmVtb3ZlIHJvb3Rmcy5jcGlvIGFuZCByb290ZnMudGFyCj4gPiA+Pj4gKiB1
cGRhdGUgREVWRUxPUEVSUwo+ID4gPj4+IFYyLT5WMzoKPiA+ID4+PiAqIHNwZWNpZml5IGJyYW5j
aCB0byBkb3dubG9hZCBmcm9tIEFuZGVzVGVjaCBsaW51eCByZXBvCj4gPiA+Pj4gKiBjaGFuZ2Ug
Ym9vdC5jbWQgdG8gZXh0bGludXguY29uZgo+ID4gPj4+ICogYWRkIHBvc3QtYnVpbGQuc2ggZm9y
IGV4dGxpbnV4LmNvbmYgdG8gcmV0cmlldmUgSW1hZ2UgYW5kIERUQgo+ID4gPj4+ICogZml4IGZv
cm1hdCBhbmQgdXBkYXRlIGdlbmltYWdlX3NkY2FyZC5jZmcKPiA+ID4+PiAqIHVwZGF0ZSByZWFk
bWUudHh0Cj4gPiA+Pj4gKiBhZGQgcGFja2FnZXMgKHB5dGhvbjMsIHB5bGliZmR0IGFuZCBvcGVu
c3NsKSBmb3IgdS1ib290IGJpbm1hbgo+ID4gPj4+ICogcmVvcmRlciBpdGVtIGluIERFVkVMT1BF
UlMKPiA+ID4+PiAKPiA+ID4gCj4gPiA+IFNvcnJ5LCBJIG1pc3NlZCB2ZXJzaW9uaW5nIGZvciB0
aGlzIHJldmlzaW9uLgo+ID4gPiBJJ2xsIHJlc2VuZCBpdCBhbmQgZml4IGNoYW5nZWxvZyBmb3Jt
YXQuCj4gPiAKPiA+IENhbiB5b3UgcGxlYXNlIHN1YnNjcmliZSB0byBwYXRjaHdvcmtbMV0gYW5k
IHRhZyB5b3VyIHBhdGNoZXMgd2l0aG91dCBWMyBwcmVmaXggYXMgcmVqZWN0ZWQ/Cj4gPiAKPiA+
IFsxXTogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0
Lwo+ID4gCj4gPiBUaGFuayB5b3UhCj4gPiBHaXVsaW8KClN1cmUsIEkndmUgdXBkYXRlZC4gU29y
cnkgYWJvdXQgdGhhdC4KCll1LUNoaWVuIFBldGVyIExpbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
