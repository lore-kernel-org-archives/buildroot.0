Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD81C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 17:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E787B4161A;
	Sun,  3 Dec 2023 17:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E787B4161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mX-BIabf17RT; Sun,  3 Dec 2023 17:16:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55402415FD;
	Sun,  3 Dec 2023 17:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55402415FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3DE1BF328
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 17:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14CD0415FD
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 17:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14CD0415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMRl3F9rlAaQ for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 17:16:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 530BC414D1
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 17:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 530BC414D1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69562240002;
 Sun,  3 Dec 2023 17:15:58 +0000 (UTC)
Message-ID: <ba259979-6d16-43a9-b1e0-226f5d91b443@korsgaard.com>
Date: Sun, 3 Dec 2023 18:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 buildroot@buildroot.org
References: <20231122010610.2411374-1-gael.portay@rtone.fr>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231122010610.2411374-1-gael.portay@rtone.fr>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi/readme.txt: add pi0w
 hint
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjIvMTEvMjAyMyAwMi4wNiwgR2HDq2wgUE9SVEFZIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+CgpDb21taXR0ZWQgdG8gbmV4dCwg
dGhhbmtzLgoKPiAtLS0KPiAgIGJvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQgfCA0ICsrKysK
PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYm9h
cmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQK
PiBpbmRleCAyMWExMzZlYjgzLi45MjAyYjVmZjM3IDEwMDY0NAo+IC0tLSBhL2JvYXJkL3Jhc3Bi
ZXJyeXBpL3JlYWRtZS50eHQKPiArKysgYi9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0Cj4g
QEAgLTI4LDYgKzI4LDEwIEBAIEZvciBtb2RlbCBaZXJvIChtb2RlbCBBKyBpbiBzbWFsbGVyIGZv
cm0gZmFjdG9yKToKPiAgIAo+ICAgICAkIG1ha2UgcmFzcGJlcnJ5cGkwX2RlZmNvbmZpZwo+ICAg
Cj4gK29yIGZvciBtb2RlbCBaZXJvIFcgKG1vZGVsIFplcm8gd2l0aCB3aXJlbGVzcyBMQU4gYW5k
IEJsdWV0b290aCk6Cj4gKwo+ICsgICQgbWFrZSByYXNwYmVycnlwaTB3X2RlZmNvbmZpZwo+ICsK
PiAgIEZvciBtb2RlbCBaZXJvIDIgVyAobW9kZWwgQjMgaW4gc21hbGxlciBmb3JtIGZhY3Rvcik6
Cj4gICAKPiAgICAgJCBtYWtlIHJhc3BiZXJyeXBpemVybzJ3X2RlZmNvbmZpZwoKCi0tIApCeWUs
IFBldGVyIEtvcnNnYWFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
