Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77DEC352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 13:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A7FB41682;
	Wed,  7 Dec 2022 13:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A7FB41682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sUDf1wW0TWE4; Wed,  7 Dec 2022 13:28:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 445F9415F2;
	Wed,  7 Dec 2022 13:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 445F9415F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D90FB1BF4D8
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4BEA40123
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4BEA40123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8FzdVumRjQd for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 13:28:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AFF2400D2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AFF2400D2
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 13:28:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8F53C60004;
 Wed,  7 Dec 2022 13:28:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p2uTY-00GrIF-Ig; Wed, 07 Dec 2022 14:28:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
References: <20221110111109.99724-1-leo@yuriev.ru>
Date: Wed, 07 Dec 2022 14:28:40 +0100
In-Reply-To: <20221110111109.99724-1-leo@yuriev.ru> (=?utf-8?B?ItCb0LU=?=
 =?utf-8?B?0L7QvdC40LQg0K7RgNGM0LXQsg==?= (Leonid
 Yuriev)"'s message of "Thu, 10 Nov 2022 14:11:08 +0300")
Message-ID: <87r0xb4a2f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.13
 "Swashplate"
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
dXJpZXYpIDxsZW9AeXVyaWV2LnJ1PiB3cml0ZXM6CgogPiBUaGlzIGlzIHN0YWJsZSBidWdmaXgg
cmVsZWFzZSBvZiBsaWJtZGJ4LCBpbiBGYW1pbHkgR2xvcnkgYW5kCiA+IGluIG1lbW9yeSBvZiBC
b3JpcyBZdXJpZXYgKHRoZSBpbnZlbnRvciBvZiBIZWxpY29wdGVyIGFuZAogPiBTd2FzaHBsYXRl
IGluIDE5MTEpIG9uIGhpcyAxMzNyZCBiaXJ0aGRheS4KCiA+IEl0IGlzIHJlYXNvbmFibGUgdG8g
YmFja3BvcnQgdGhpcyBwYXRjaCB0byBhbGwgYXBwbGljYWJsZSByZWxlYXNlcy9icmFuY2hlcyBv
ZiBCdWlsZHJvb3QuCgogPiBSZWxlYXNlIG5vdGVzIGZvciB2MC4xMS4xMwogPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQoKID4gRml4ZXM6CgogPiAgLSBGaXhlZCBidWlsZHMgd2l0aCBvbGRl
ciBsaWJjIHZlcnNpb25zIGFmdGVyIHVzaW5nIGBmY250bDY0KClgIChiYWNrcG9ydCkuCiA+ICAt
IEZpeGVkIGJ1aWxkcyB3aXRoICBvbGRlciBgc3RkYXRvbWljLmhgIHZlcnNpb25zLAogPiAgICB3
aGVyZSB0aGUgYEFUT01JQ18qX0xPQ0tfRlJFRWAgbWFjcm9zIG1pc3Rha2VubHkgcmVkZWZpbmVk
IHVzaW5nIGZ1bmN0aW9ucyAoYmFja3BvcnQpLgogPiAgLSBBZGRlZCB3b3JrYXJvdW5kIGZvciBg
bXJlbWFwKClgIGRlZmVjdCB0byBhdm9pZCBhc3NlcnRpb24gZmFpbHVyZSAoYmFja3BvcnQpLgog
PiAgLSBXb3JrYXJvdW5kIGZvciBgZW5jcnlwdGZzYCBidWcocykgaW4gdGhlIGBjb3B5X2ZpbGVf
cmFuZ2VgIGltcGxlbWVudGF0aW9uICAoYmFja3BvcnQpLgogPiAgLSBGaXhlZCB1bmV4cGVjdGVk
IGBNREJYX0JVU1lgIGZyb20gYG1kYnhfZW52X3NldF9vcHRpb24oKWAsIGBtZGJ4X2Vudl9zZXRf
c3luY2J5dGVzKClgCiA+ICAgIGFuZCBgbWRieF9lbnZfc2V0X3N5bmNwZXJpb2QoKWAgKGJhY2tw
b3J0KS4KID4gIC0gQ01ha2UgcmVxdWlyZW1lbnRzIGxvd2VyZWQgdG8gdmVyc2lvbiAzLjAuMiAo
YmFja3BvcnQpLgogPiAgLSBBZGRlZCBhZG1vbml0aW9uIG9mIGluc2VjdXJlIGZvciBSSVNDLVYg
KGJhY2twb3J0KS4KCiA+IE1pbm9yczoKCiA+ICAtIE1pbm9yIGNsYXJpZmljYXRpb24gb3V0cHV0
IG9mIGAtLWhlbHBgIGZvciBgbWRieF90ZXN0YCAoYmFja3BvcnQpLgogPiAgLSBBZGRlZCBhZG1v
bml0aW9uIG9mIGluc2VjdXJlIGZvciBSSVNDLVYgKGJhY2twb3J0KS4KID4gIC0gU3RvY2hhc3Rp
YyBzY3JpcHRzIGFuZCBDTWFrZSBmaWxlcyBzeW5jaHJvbml6ZWQgd2l0aCB0aGUgYGRldmVsYCBi
cmFuY2guCiA+ICAtIFVzZSBgLS1kb250LWNoZWNrLXJhbS1zaXplYCBmb3Igc21hbGwtdGVzdHMg
bWFrZS10YXJnZXRzIChiYWNrcG9ydCkuCgogPiBUaGUgY29tcGxldGUgQ2hhbmdlTG9nOiBodHRw
czovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvYmxvYj9maWxlPUNoYW5nZUxv
Zy5tZAoKID4gU2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZ
dXJpZXYpIDxsZW9AeXVyaWV2LnJ1PgoKQ29tbWl0dGVkIHRvIDIwMjIuMDgueCBhbmQgMjAyMi4w
Mi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
