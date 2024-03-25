Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA64C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 09:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE84981E57;
	Mon, 25 Mar 2024 09:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L504YvBLe00I; Mon, 25 Mar 2024 09:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D97C381E70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D97C381E70;
	Mon, 25 Mar 2024 09:10:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 677591BF370
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60A964068C
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2ruwHUT7htm for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 09:10:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F58B40681
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F58B40681
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F58B40681
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 09:10:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37CAB1BF210;
 Mon, 25 Mar 2024 09:10:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rogLw-008dFx-0Y;
 Mon, 25 Mar 2024 10:10:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
References: <3a03670a-7a1b-4fd9-a44a-b5ffff19dc94@grenoble.cnrs.fr>
Date: Mon, 25 Mar 2024 10:10:48 +0100
In-Reply-To: <3a03670a-7a1b-4fd9-a44a-b5ffff19dc94@grenoble.cnrs.fr> (Edgar
 Bonet's message of "Mon, 25 Mar 2024 09:32:10 +0100")
Message-ID: <87msqmd6cn.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] Being kicked-off the mailing list
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

Pj4+Pj4gIkVkZ2FyIiA9PSBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4gd3Jp
dGVzOgoKID4gSGVsbG8gZXZlcnlib2R5IQogPiBUaGlzIG11c3QgYmUgdGhlIHRoaXJkIHRpbWUg
aXQgaGFwcGVucywgYW5kIEkgZmluZCBpdCBzb21ld2hhdAogPiBhbm5veWluZy4uLiBUaGlzIG1v
cm5pbmcgSSByZWNlaXZlZCBhbiBlLW1haWwgZnJvbSBidWlsZHJvb3QtcmVxdWVzdAogPiBpbmZv
cm1pbmcgbWUgdGhhdCBteSBtZW1iZXJzaGlwIHRvIHRoaXMgbWFpbGluZyBsaXN0IGhhcyBiZWVu
IGRpc2FibGVkCiA+IGR1ZSB0byDigJxleGNlc3NpdmUgYm91bmNlc+KAnS4KCiA+IEkgdHJpZWQg
dG8gaW52ZXN0aWdhdGUgYW5kIGl0IHR1cm5zIG91dCB0aGF0IOKAnGV4Y2Vzc2l2ZSBib3VuY2Vz
4oCdCiA+IGFjdHVhbGx5IG1lYW5zIHRoYXQgZXhhY3RseSBvbmUgbWVzc2FnZSBib3VuY2VkLCBu
YW1lbHkgdGhlIG1lc3NhZ2UKID4gdGl0bGVkIOKAnFlvdXIgbWFpbGJveCBpcyBmdWxs4oCdIGZy
b20gU3RvcmFnZSBBY2NvdW50c1sxXS4gSSBkaXNjdXNzZWQgdGhlCiA+IGlzc3VlIHdpdGggbXkg
ZS1tYWlsIHByb3ZpZGVyIGFuZCB0aGV5IHNheSB0aGF0IGJvdW5jaW5nIG1lc3NhZ2VzIHRoYXQK
ID4gYXJlIDEwMCUtY2VydGFpbiBwaGlzaGluZyBhdHRlbXB0cyBpcyB0aGUgZGVzaXJlZCBiZWhh
dmlvciwgYW5kIHRoZXkKID4gd2lsbCBub3QgZGlzYWJsZSB0aGUganVuay1tYWlsIGZpbHRlciwg
d2hpY2ggaXMgYWxyZWFkeSB2ZXJ5IGxheC4KCiA+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGNv
bmZpZ3VyZSBCdWlsZHJvb3QncyBtYWlsIHNlcnZlciB0byBiZSBhIGJpdAogPiBtb3JlIHRvbGVy
YW50IHRvIGJvdW5jZXM/IEkgdW5kZXJzdGFuZCB0aGUgbmVlZCB0byB1bnN1YnNjcmliZSBhZGRy
ZXNzZXMKID4gdGhhdCBnZW5lcmF0ZSB0b28gbWFueSBlcnJvcnMsIGJ1dCBJIGZpbmQgdGhpcyDi
gJxraWNrLW91dCBvbiBmaXJzdAogPiBib3VuY2XigJ0gcG9saWN5IGEgYml0IGV4dHJlbWUuCgpT
b3JyeSBhYm91dCB0aGF0LiBJIGhhdmUgYnVtcGVkIHRoZSBtYWlsbWFuIGJvdW5jZV9zY29yZV90
aHJlc2hvbGQgZnJvbQo1IHRvIDEwLCBob3BlZnVsbHkgdGhhdCBmaXhlcyBpdC4KClRoZSBkb2N1
bWVudGF0aW9uIGZvciB0aGF0IHNldHRpbmcgaXM6CgpFYWNoIHN1YnNjcmliZXIgaXMgYXNzaWdu
ZWQgYSBib3VuY2Ugc2NvcmUsIGFzIGEgZmxvYXRpbmcgcG9pbnQKbnVtYmVyLiBXaGVuZXZlciBN
YWlsbWFuIHJlY2VpdmVzIGEgYm91bmNlIGZyb20gYSBsaXN0IG1lbWJlciwgdGhhdAptZW1iZXIn
cyBzY29yZSBpcyBpbmNyZW1lbnRlZC4gSGFyZCBib3VuY2VzIChmYXRhbCBlcnJvcnMpIGluY3Jl
YXNlIHRoZQpzY29yZSBieSAxLCB3aGlsZSBzb2Z0IGJvdW5jZXMgKHRlbXBvcmFyeSBlcnJvcnMp
IGluY3JlYXNlIHRoZSBzY29yZSBieQowLjUuIE9ubHkgb25lIGJvdW5jZSBwZXIgZGF5IGNvdW50
cyBhZ2FpbnN0IGEgbWVtYmVyJ3Mgc2NvcmUsIHNvIGV2ZW4gaWYKMTAgYm91bmNlcyBhcmUgcmVj
ZWl2ZWQgZm9yIGEgbWVtYmVyIG9uIHRoZSBzYW1lIGRheSwgdGhlaXIgc2NvcmUgd2lsbAppbmNy
ZWFzZSBieSBqdXN0IDEuIFRoaXMgdmFyaWFibGUgZGVzY3JpYmVzIHRoZSB1cHBlciBsaW1pdCBm
b3IgYQptZW1iZXIncyBib3VuY2Ugc2NvcmUsIGFib3ZlIHdoaWNoIHRoZXkgYXJlIGF1dG9tYXRp
Y2FsbHkgZGlzYWJsZWQsIGJ1dApub3QgcmVtb3ZlZCBmcm9tIHRoZSBtYWlsaW5nIGxpc3QuCgpJ
IGhhdmUgYWxzbyBsb3dlcmVkIGJvdW5jZV9pbmZvX3N0YWxlX2FmdGVyIGZyb20gMyB0byAxLiBU
aGUKZG9jdW1lbnRhdGlvbiBmb3IgdGhhdCBzZXR0aW5nIGlzOgoKVGhlIG51bWJlciBvZiBkYXlz
IGFmdGVyIHdoaWNoIGEgbWVtYmVyJ3MgYm91bmNlIGluZm9ybWF0aW9uIGlzCmRpc2NhcmRlZCwg
aWYgbm8gbmV3IGJvdW5jZXMgaGF2ZSBiZWVuIHJlY2VpdmVkIGluIHRoZSBpbnRlcmltLiBUaGlz
CnZhbHVlIG11c3QgYmUgYW4gaW50ZWdlci4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
