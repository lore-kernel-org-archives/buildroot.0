Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58308C6FA89
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 15:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C193281271;
	Thu, 15 Sep 2022 15:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C193281271
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sb6JA7eASlK2; Thu, 15 Sep 2022 15:03:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCCEF81002;
	Thu, 15 Sep 2022 15:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCCEF81002
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1230C1BF40D
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 15:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E166660F79
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 15:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E166660F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDw6OFgutYeb for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 15:03:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B935605A2
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B935605A2
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 15:03:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D96331682;
 Thu, 15 Sep 2022 08:03:36 -0700 (PDT)
Received: from debian (X72Y076X74.nice.arm.com [10.34.125.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEAF83F73D;
 Thu, 15 Sep 2022 08:03:29 -0700 (PDT)
Date: Thu, 15 Sep 2022 17:03:27 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YyM+v4AYpVlZQFB6@debian>
Mail-Followup-To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
References: <20220914140821.3158921-1-vincent.stehle@arm.com>
 <675b62b5-7999-36f2-4d73-3d65c17f645b@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <675b62b5-7999-36f2-4d73-3d65c17f645b@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] configs/qemu_aarch64_ebbr: new defconfig
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBTZXAgMTQsIDIwMjIgYXQgMTA6MjU6MTVQTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4gSGkgVmluY2VudCwKCkhpIEdpdWxpbywKClRoYW5rIHlvdSBmb3IgdGhlIHJldmll
dy4gTW9yZSBjb21tZW50cyBiZWxvdywgYnV0IEkgd291bGQgbGlrZSB0byBhc2sgYWxyZWFkeToK
c2hhbGwgSSBhZGQgeW91ciAicmV2aWV3ZWQtYnkiIHdoZW4gSSBzZW5kIGEgdjIsIHBsZWFzZT8K
Cj4gT24gMTQvMDkvMjIgMTY6MDgsIFZpbmNlbnQgU3RlaGzDqSB3cm90ZToKLi4KPiA+IEkgd291
bGQgcHJlZmVyIHRvIGFkZCBteSB3b3JrIGUtbWFpbCBpbiBERVZFTE9QRVJTIGZvciB0aGlzIGRl
ZmNvbmZpZy4KPiA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGlzIGlzIG9rIG9yIGlmIEkgc2hv
dWxkIGtlZXAgYSBzaW5nbGUgZS1tYWlsCj4gPiBhZGRyZXNzLgo+IAo+IEl0IGlzIHBvc3NpYmxl
LCB0aGVyZSBpcyBhIHBlbmRpbmcgcGF0Y2ggZXhhY3RseSBmb3IgdGhpczoKPiBodHRwczovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzcxNDlfMTY2MzA3OTg4
M182MzIwOTVDQl83MTQ5XzE1M18xXzg0ZjE0NDU0Mjc4YzgyM2YyMzY1NGIyMGU0NGFmN2RjNjQ2
YjZmZGQuMTY2MzA3OTg3OS5naXQueWFubi5tb3JpbkBvcmFuZ2UuY29tLwo+IGFuZCBjb21lcyBm
cm9tIG9uZSBvZiB0aGUgbWFpbnRhaW5lcnMuCgpUaGFua3MgZm9yIHRoZSBjb25maXJtYXRpb24u
CgouLgo+ID4gKwlwYXJ0aXRpb24gYm9vdCB7Cj4gPiArCQlpbWFnZSA9ICJlZmktcGFydC52ZmF0
Igo+ID4gKwkJcGFydGl0aW9uLXR5cGUtdXVpZCA9IGMxMmE3MzI4LWY4MWYtMTFkMi1iYTRiLTAw
YTBjOTNlYzkzYgo+IAo+IEhlcmUgXl5eIGl0J3MgYmVlbiBkZWNpZGVkIHRvIHVzZSBnZW5pbWFn
ZSBzaG9ydGN1dCBsZXR0ZXJzLCBpbiB0aGlzIGNhc2UgVQo+IHNpbmNlIGl0J3MgRUZJLgoKT2ss
IHdpbGwgZG8uCgo+ID4gKwkJb2Zmc2V0ID0gMzJLCj4gPiArCQlib290YWJsZSA9IHRydWUKPiA+
ICsJfQo+ID4gKwo+ID4gKwlwYXJ0aXRpb24gcm9vdCB7Cj4gPiArCQlwYXJ0aXRpb24tdHlwZS11
dWlkID0gYjkyMWIwNDUtMWRmMC00MWMzLWFmNDQtNGM2ZjI4MGQzZmFlCj4gCj4gSGVyZSBeXl4g
aW5zdGVhZCBpcyBjb3JyZWN0IGFjY29yZGluZyB0byBCdWlsZHJvb3QgbWFudWFsLgo+IFlvdSBj
YW4gY2hlY2sgaXQgb24gZm9sbG93aW5nIGxpbms6Cj4gaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rv
d25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjd3JpdGluZy1nZW5pbWFnZS1jZmcKCk9uIHNlY29u
ZCB0aG91Z2h0IEkgdGhpbmsgSSBtaWdodCBhcyB3ZWxsIG5vdCBzcGVjaWZ5IHRoZSB1dWlkIGF0
IGFsbCBhbmQgcmVseQpvbiB0aGUgZGVmYXVsdCBiZWluZyAnTCcuCgouLgo+ID4gKyMgVG9vbGNo
YWluLCByZXF1aXJlZCBmb3IgR1JVQgo+ID4gK0JSMl9UT09MQ0hBSU5fQlVJTERST09UX1dDSEFS
PXkKPiAKPiBUaGlzIF5eXiBpcyBvbmx5IG5lZWRlZCBmb3IgdWNsaWJjLCBidXQgdGhlIGRlZmF1
bHQgbGliYyBub3cgaXMgZ2xpYmMsCj4gc28geW91IGRvbid0IG5lZWQgdG8gc3BlY2lmeSBpdC4K
Ck9rLCB3aWxsIHJlbW92ZS4KCi4uCj4gPiArIyBMaW51eCBoZWFkZXJzCj4gPiArQlIyX1BBQ0tB
R0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE3PXkKPiAKPiBGb3IgdGhpcyBeXl4gcGxl
YXNlIHNwZWNpZnkgaW4gY29tbWl0IGxvZyB0aGF0IGF0IHRoZSBtb21lbnQgd2UgZG9uJ3QKPiBo
YXZlIDUuMTkgaGVhZGVycyBhdmFpbGFibGUgYW5kIHNvIHdlIHJlbHkgb24gNS4xNy4KCk9rLCB3
aWxsIGRvLgoKLi4KPiBJdCBidWlsZHMgZmluZSB1c2luZyB1dGlscy9kb2NrZXItcnVuIGFuZCBJ
J3ZlIHJ1biBpdCBzdWNjZXNzZnVsbHkgd2l0aAo+IHFlbXUuCgpUaGFuayB5b3UgZm9yIHRlc3Rp
bmchCgpCZXN0IHJlZ2FyZHMsClZpbmNlbnQuCgo+IFNvIEkgd2FpdCBmb3IgVjIuCj4gCj4gVGhh
bmsgeW91IQo+IAo+IEJlc3QgcmVnYXJkcwo+IC0tIAo+IEdpdWxpbyBCZW5ldHRpCj4gQmVuZXR0
aSBFbmdpbmVlcmluZyBzYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
