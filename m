Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D946DC6FA89
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 15:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C16D61093;
	Thu, 15 Sep 2022 15:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C16D61093
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDmEUfUMJDuY; Thu, 15 Sep 2022 15:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A23156108B;
	Thu, 15 Sep 2022 15:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A23156108B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 228631BF3EF
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 15:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFC01405AE
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 15:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFC01405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tTWVvwm9vZnR for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 15:06:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8348404A6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8348404A6
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 15:06:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 649B71682;
 Thu, 15 Sep 2022 08:06:20 -0700 (PDT)
Received: from debian (X72Y076X74.nice.arm.com [10.34.125.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A55D3F73D;
 Thu, 15 Sep 2022 08:06:13 -0700 (PDT)
Date: Thu, 15 Sep 2022 17:06:10 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <YyM/Yo0pbi8QJpVo@debian>
Mail-Followup-To: Romain Naour <romain.naour@gmail.com>,
 buildroot@buildroot.org
References: <20220914140821.3158921-1-vincent.stehle@arm.com>
 <7581ed17-0768-c255-78ea-d2164fa0e0fc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7581ed17-0768-c255-78ea-d2164fa0e0fc@gmail.com>
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBTZXAgMTQsIDIwMjIgYXQgMTA6NDk6MzZQTSArMDIwMCwgUm9tYWluIE5hb3VyIHdy
b3RlOgo+IEhlbGxvIFZpbmNlbnQsCj4gCj4gTGUgMTQvMDkvMjAyMiDDoCAxNjowOCwgVmluY2Vu
dCBTdGVobMOpIGEgw6ljcml0wqA6Ci4uCj4gPiBJIHdvdWxkIHByZWZlciB0byBhZGQgbXkgd29y
ayBlLW1haWwgaW4gREVWRUxPUEVSUyBmb3IgdGhpcyBkZWZjb25maWcuCj4gPiBQbGVhc2UgbGV0
IG1lIGtub3cgaWYgdGhpcyBpcyBvayBvciBpZiBJIHNob3VsZCBrZWVwIGEgc2luZ2xlIGUtbWFp
bAo+ID4gYWRkcmVzcy4KPiA+IFRoYW5rcyEKPiAKPiBJJ20gb2sgd2l0aCB0aGF0LgoKSGkgUm9t
YWluLAoKVGhhbmsgeW91IGZvciB0aGUgY29uZmlybWF0aW9uLgoKLi4KPiA+ICsJcGFydGl0aW9u
IGJvb3Qgewo+ID4gKwkJaW1hZ2UgPSAiZWZpLXBhcnQudmZhdCIKPiA+ICsJCXBhcnRpdGlvbi10
eXBlLXV1aWQgPSBjMTJhNzMyOC1mODFmLTExZDItYmE0Yi0wMGEwYzkzZWM5M2IKPiAKPiBZb3Ug
Y2FuIHJlcGxhY2UgdGhpcyBsaW5lIGJ5Ogo+ICAgcGFydGl0aW9uLXR5cGUtdXVpZCA9IFUKPiAK
PiBTZWU6Cj4gaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD0w
MjVkOGFjODBkMDZhZDQ2ZWMzMDQyYzRhZjg1ZGRkNmE1ZTA5YjgwCgpPaywgd2lsbCBkby4KCi4u
Cj4gPiArIyBUb29sY2hhaW4sIHJlcXVpcmVkIGZvciBHUlVCCj4gPiArQlIyX1RPT0xDSEFJTl9C
VUlMRFJPT1RfV0NIQVI9eQo+IAo+IFRoZSBuZXcgZGVmYXVsdCBsaWJjIGlzIG5vdyBnbGliYyBv
biB0aGUgY3VycmVudCBtYXN0ZXIgYnJhbmNoLCBzbyB5b3UgY2FuIGRyb3AKPiBCUjJfVE9PTENI
QUlOX0JVSUxEUk9PVF9XQ0hBUj15CgpPaywgd2lsbCBkby4KCj4gCj4gT3RoZXJ3aXNlOgo+IFJl
dmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+CgpUaGFuayB5
b3UhCgpJIHdpbGwgc2VuZCBhIHYyLgoKQmVzdCByZWdhcmRzLApWaW5jZW50LgoKPiAKPiBCZXN0
IHJlZ2FyZHMsCj4gUm9tYWluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
