Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F103FD41C15
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 08:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CF716082D;
	Wed, 13 Nov 2024 08:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4j137kGK0Yx; Wed, 13 Nov 2024 08:18:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC4BE6082A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC4BE6082A;
	Wed, 13 Nov 2024 08:18:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42A5B6C
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 08:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23E5D6082A
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 08:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cn2Ka4-y-KyK for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 08:18:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04D6760810
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04D6760810
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04D6760810
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 08:18:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09E4FC0007;
 Wed, 13 Nov 2024 08:18:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tB8aP-00EalB-00;
 Wed, 13 Nov 2024 09:18:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
Cc: buildroot@buildroot.org
References: <20241027193029.298728-1-leo@yuriev.ru>
Date: Wed, 13 Nov 2024 09:18:48 +0100
In-Reply-To: <20241027193029.298728-1-leo@yuriev.ru> (=?utf-8?B?ItCb0LU=?=
 =?utf-8?B?0L7QvdC40LQg0K7RgNGM0LXQsg==?= (Leonid
 Yuriev)"'s message of "Sun, 27 Oct 2024 22:30:28 +0300")
Message-ID: <87wmh75yxj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gItCb0LXQvtC90LjQtCIgPT0g0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZ
dXJpZXYpIDxsZW9AeXVyaWV2LnJ1PiB3cml0ZXM6CgogPiBUaGlzIGlzIGJ1Z2ZpeCByZWxlYXNl
IG9mIHN0YWJsZSBsaWJtZGJ4IGJyYW5jaC4KID4gVGhlIG1vc3Qgc2lnbmlmaWNhbnQgZml4ZXMg
c2luY2UgdjAuMTIuMTAgKHRoZSBwcmV2aW91cyB2ZXJzaW9uIHBpbm5lZCB0bwogPiBidWlsZHJv
b3QpOgoKID4gIC0gRml4ZWQgdGhlIHBvc3NpYmlsaXR5IG9mIGBTSUdTRUdWYCBpbnNpZGUgdGhl
IGBjb2hlcmVuY2VfY2hlY2soKWAgYWZ0ZXIKID4gICAgY2hhbmdpbmcgdGhlIGdlb21ldHJ5IGJ5
IGFub3RoZXIgcHJvY2VzcyB3aXRoIGFuIGluY3JlYXNlIGluIHRoZSB1cHBlcgogPiAgICBEQiBz
aXplIGFib3ZlIHRoZSBwcmV2aW91cyBpbi1wcm9jZXNzIGxpbWl0LgoKID4gIC0gRml4ZWQgY3Vy
c29yKHMpIGhhbmRsaW5nIG9wZW5lZCBpbiBwYXJlbnQgdHJhbnNhY3Rpb25zIGFuZCBjbG9zZWQg
YmVmb3JlCiA+ICAgIHRoZSBjb21wbGV0aW9uIG9mIG5lc3RlZC9jaGlsZCB0cmFuc2FjdGlvbnMu
IEluIHN1Y2ggY2FzZSwgY2xvc2VkCiA+ICAgIGN1cnNvcnMgd2VyZSAicmVzdXJyZWN0ZWQiLCB3
aGljaCBsZWQgdG8gYSBsZWFrIG9mIG1lbW9yeSBhbGxvY2F0ZWQgZm9yCiA+ICAgIHN1Y2ggY3Vy
c29ycy4KCiA+ICAtIEZpeGVkIGEgcG9zc2liaWxpdHkgb2YgYFNJR1NFR1ZgIHdoZW4gZW5hYmxp
bmcgbG9nZ2luZyBvZiB0aGUKID4gICAgYE1EQlhfTE9HX1RSQUNFYCBsZXZlbCBpbiBkZWJ1ZyBi
dWlsZHMuCgogPiAgLSBDb3JyZWN0aW9uIG9mIHRoZSBtaXNzaW5nIGBUWE5fRU5EX0VPVERPTkVg
IGluIHRoZSBjYXNlIHRoZSBzdGFydCBvZgogPiAgICBhIHJlYWRpbmcgdHJhbnNhY3Rpb24gZmFp
bHMuIFRoZSBtZW50aW9uZWQgYml0LWZsYWcgd2FzIG1pc3NpbmcgaW4gdGhlCiA+ICAgIHRyYW5z
YWN0aW9uIGRlc3RydWN0aW9uL3NodXRkb3duIHBhdGggb24gZXJyb3IgaXRzIGxhdW5jaC4gQmVj
YXVzZSBvZgogPiAgICB0aGlzLCBhbiBhdHRlbXB0IHdhcyBtYWRlIHRvIGRlc3Ryb3kgdGhlIGN1
cnNvcnMsIHdoaWNoIGxlZCB0byBjcmFzaAogPiAgICBkZWJ1ZyBidWlsZHMsIHNpbmNlIHRoZSBj
b3JyZXNwb25kaW5nIGFycmF5IGlzIGludGVudGlvbmFsbHkgZmlsbGVkCiA+ICAgIHdpdGggcG9p
c29uIHBvaW50ZXJzLgoKID4gIC0gTW9kaWZpY2F0aW9uIG9mIGBtZGJ4X2Nsb3NlX2J5KClgIHRv
IHJldHVybiBhbiBlcnJvciB3aGVuIHRyeWluZyB0bwogPiAgICBjbG9zZSB0aGUgZGJpIGRlc2Ny
aXB0b3Igb2YgYSB0YWJsZSBjcmVhdGVkIGFuZC9vciBtb2RpZmllZCBpbiBhCiA+ICAgIHN0aWxs
LXJ1bm5pbmcgdHJhbnNhY3Rpb24uIFN1Y2ggcHJlbWF0dXJlIGNsb3N1cmUgb2YgdGhlIGRlc2Ny
aXB0b3IgaXMKID4gICAgYW4gaW5jb3JyZWN0IHVzZSBvZiB0aGUgQVBJIGFuZCBhIHZpb2xhdGlv
biBvZiB0aGUgY29udHJhY3QvcHJlY29uZGl0aW9ucwogPiAgICBmb3JtdWxhdGVkIGluIHRoZSBk
ZXNjcmlwdGlvbiBvZiBgbWRieF9jbG9zZV9kYmkoKWAuCgogPiAgICBIb3dldmVyLCBpbnN0ZWFk
IG9mIHJldHVybmluZyBhbiBlcnJvciwgYW4gaW5jb3JyZWN0IGNsb3N1cmUgb2YgdGhlCiA+ICAg
IGRlc2NyaXB0b3Igd2FzIHBlcmZvcm1lZCwgd2hpY2ggY291bGQgbGVhZCB0byB0aGUgY3JlYXRp
b24gb2YgYSB0YWJsZQogPiAgICB3aXRoIGFuIGVtcHR5IG5hbWUsIGxlYWthZ2Ugb2YgZGF0YWJh
c2UgcGFnZXMgYW5kL29yIGNvcnJ1cHRpb24gb2YgYQogPiAgICBiLXRyZWUgc3RydWN0dXJlICh3
cm9uZyByZWZlcmVuY2UgdG8gdGhlIHJvb3Qgb2YgYSB0YWJsZSkuCgogPiBUaGUgY29tcGxldGUg
Q2hhbmdlTG9nOgogPiAgICAgaHR0cHM6Ly9naXRmbGljLnJ1L3Byb2plY3QvZXJ0aGluay9saWJt
ZGJ4L2Jsb2I/ZmlsZT1DaGFuZ2VMb2cubWQKCiA+IFNpZ25lZC1vZmYtYnk6INCb0LXQvtC90LjQ
tCDQrtGA0YzQtdCyIChMZW9uaWQgWXVyaWV2KSA8bGVvQHl1cmlldi5ydT4KCkNvbW1pdHRlZCB0
byAyMDI0LjAyLnggYW5kIDIwMjQuMDgueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
