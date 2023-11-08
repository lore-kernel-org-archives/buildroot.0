Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983ABC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38C1360FD7;
	Wed,  8 Nov 2023 09:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38C1360FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1IsAm8q6W-cH; Wed,  8 Nov 2023 09:21:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76D5460FB2;
	Wed,  8 Nov 2023 09:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76D5460FB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6998D1BF423
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 09:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 414B54094F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 09:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 414B54094F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYuMKmmYIRZh for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 09:21:22 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE3244095E
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 09:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE3244095E
Received: by mail.gandi.net (Postfix) with ESMTPSA id C236C1BF209;
 Wed,  8 Nov 2023 09:21:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0ekP-000B7k-2u;
 Wed, 08 Nov 2023 10:21:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
References: <20231017172108.142456-1-leo@yuriev.ru>
Date: Wed, 08 Nov 2023 10:21:17 +0100
In-Reply-To: <20231017172108.142456-1-leo@yuriev.ru> (=?utf-8?B?ItCb0LU=?=
 =?utf-8?B?0L7QvdC40LQg0K7RgNGM0LXQsg==?= (Leonid
 Yuriev)"'s message of "Tue, 17 Oct 2023 20:21:07 +0300")
Message-ID: <87h6lwtxbm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.8
 "Vladimir Utkin"
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

Pj4+Pj4gItCb0LXQvtC90LjQtCIgPT0g0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZ
dXJpZXYpIDxsZW9AeXVyaWV2LnJ1PiB3cml0ZXM6CgogPiBUaGlzIGlzIGJ1Z2ZpeCByZWxlYXNl
IG9mIHN0YWJsZSBsaWJtZGJ4IGJyYW5jaCwgb24gdGhlIGRheSBvZiB0aGUgMTAwdGgKID4gYW5u
aXZlcnNhcnkgb2YgdGhlIGJpcnRoIG9mIHRoZSBvdXRzdGFuZGluZyBTb3ZpZXQgYW5kIFJ1c3Np
YW4gc2NpZW50aXN0CiA+IGFuZCBlbmdpbmVlciBWbGFkaW1pciBGZWRvcm92aWNoIFV0a2luLgoK
ID4gSXQgaXMgcmVhc29uYWJsZSB0byBiYWNrcG9ydCB0aGlzIHBhdGNoIHRvIGFsbCBhcHBsaWNh
YmxlIHJlbGVhc2VzL2JyYW5jaGVzIG9mIEJ1aWxkcm9vdC4KCiA+IFRoZSBtb3N0IHNpZ25pZmlj
YW50IGZpeGVzIG9mIHYwLjEyLjg6CiA+ICAtIEZpeGVkIHJlZ3Jlc3Npb24gb2YgbWRieF9wdXQo
TURCWF9NVUxUSVBMRSkgZHVyaW5nIGJhdGNoL2J1bGsKID4gICAgaW5zZXJ0aW9uIG9mIG11bHRp
LXZhbHVlcyAoYWthICJkdXBzb3J0IikuCiA+ICAtIEltcGxlbWVudGVkIG92ZXJ3cml0aW5nIGlu
IG1kYnhfcHV0KE1EQlhfQ1VSUkVOVCkgb2YgYWxsIGN1cnJlbnQKID4gICAgbXVsdGkta2V5IHZh
bHVlcyBpbiB0aGUgYWJzZW5jZSBvZiB0aGUgZmxhZyBNREJYX05PT1ZFUldSSVRFLgogPiAgLSBB
ZGRlZCB0aGUgYWJpbGl0eSB0byB1c2UgbWRieF9jdXJzb3JfZ2V0KE1EQlhfR0VUX01VTFRJUExF
KSB3aXRob3V0CiA+ICAgIGZpcnN0IHNldHRpbmcgdGhlIGN1cnNvciwgY29tYmluaW5nIHRoZSBi
YXRjaCBkYXRhIGdldHRpbmcgb3BlcmF0aW9uCiA+ICAgIHdpdGggcG9zaXRpb25pbmcgdGhlIGN1
cnNvci4KID4gIC0gTWljcm8tb3B0aW1pemF0aW9uIGFuZCByZWZhY3RvcmluZyBjdXJzb3JfcHV0
X25vY2hlY2tsZW4oKS4KID4gIC0gQ2xhcmlmeWluZyB0aGUgd29yZGluZyBpbiB0aGUgQVBJIGRl
c2NyaXB0aW9uLCBpbmNsdWRpbmcgZXhwbGFuYXRpb24KID4gICAgYWJvdXQgU0lHU0VHViBhbmQg
bm90IGFsbG93aW5nIGRpcmVjdCBkYXRhIGNoYW5nZXMuCgogPiBUaGUgY29tcGxldGUgQ2hhbmdl
TG9nOiBodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvYmxvYj9maWxl
PUNoYW5nZUxvZy5tZAoKID4gU2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0INCu0YDRjNC10LIg
KExlb25pZCBZdXJpZXYpIDxsZW9AeXVyaWV2LnJ1PgoKQ29tbWl0dGVkIHRvIDIwMjMuMDgueCwg
dGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
