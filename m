Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0A9C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 21:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9739400EC;
	Sun,  3 Dec 2023 21:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9739400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uuPb23NdAEf; Sun,  3 Dec 2023 21:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3C92400F9;
	Sun,  3 Dec 2023 21:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3C92400F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 433CF1BF3EE
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 186CB607BC
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 186CB607BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GGscjWddZ9v for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 21:22:26 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7A2760767
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 21:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7A2760767
Received: by mail.gandi.net (Postfix) with ESMTPSA id 779DC20005;
 Sun,  3 Dec 2023 21:22:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9tuv-009gsq-2e;
 Sun, 03 Dec 2023 22:22:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231201212318.1091953-1-fontaine.fabrice@gmail.com>
Date: Sun, 03 Dec 2023 22:22:21 +0100
In-Reply-To: <20231201212318.1091953-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 1 Dec 2023 22:23:18 +0100")
Message-ID: <87h6kzvv5e.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libpjsip: security bump to
 version 2.14
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBGaXggQ1ZFLTIwMjMtMzg3MDM6IFBKU0lQIGlzIGEgZnJlZSBh
bmQgb3BlbiBzb3VyY2UgbXVsdGltZWRpYQogPiBjb21tdW5pY2F0aW9uIGxpYnJhcnkgd3JpdHRl
biBpbiBDIHdpdGggaGlnaCBsZXZlbCBBUEkgaW4gQywgQysrLCBKYXZhLAogPiBDIywgYW5kIFB5
dGhvbiBsYW5ndWFnZXMuIFNSVFAgaXMgYSBoaWdoZXIgbGV2ZWwgbWVkaWEgdHJhbnNwb3J0IHdo
aWNoCiA+IGlzIHN0YWNrZWQgdXBvbiBhIGxvd2VyIGxldmVsIG1lZGlhIHRyYW5zcG9ydCBzdWNo
IGFzIFVEUCBhbmQgSUNFLgogPiBDdXJyZW50bHkgYSBoaWdoZXIgbGV2ZWwgdHJhbnNwb3J0IGlz
IG5vdCBzeW5jaHJvbml6ZWQgd2l0aCBpdHMgbG93ZXIKID4gbGV2ZWwgdHJhbnNwb3J0IHRoYXQg
bWF5IGludHJvZHVjZSB1c2UtYWZ0ZXItZnJlZSBpc3N1ZS4gVGhpcwogPiB2dWxuZXJhYmlsaXR5
IGFmZmVjdHMgYXBwbGljYXRpb25zIHRoYXQgaGF2ZSBTUlRQIGNhcGFiaWxpdHkKID4gKGBQSk1F
RElBX0hBU19TUlRQYCBpcyBzZXQpIGFuZCB1c2UgdW5kZXJseWluZyBtZWRpYSB0cmFuc3BvcnQg
b3RoZXIKID4gdGhhbiBVRFAuIFRoaXMgdnVsbmVyYWJpbGl0eeKAmXMgaW1wYWN0IG1heSByYW5n
ZSBmcm9tIHVuZXhwZWN0ZWQKID4gYXBwbGljYXRpb24gdGVybWluYXRpb24gdG8gY29udHJvbCBm
bG93IGhpamFjay9tZW1vcnkgY29ycnVwdGlvbi4gVGhlCiA+IHBhdGNoIGlzIGF2YWlsYWJsZSBh
cyBhIGNvbW1pdCBpbiB0aGUgbWFzdGVyIGJyYW5jaC4KCiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9w
anNpcC9wanByb2plY3Qvc2VjdXJpdHkvYWR2aXNvcmllcy9HSFNBLWY3NnctZmg3Yy1wYzY2CiA+
IGh0dHBzOi8vZ2l0aHViLmNvbS9wanNpcC9wanByb2plY3QvcmVsZWFzZXMvdGFnLzIuMTQKCiA+
IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwu
Y29tPgoKQ29tbWl0dGVkIHRvIDIwMjMuMDIueCBhbmQgMjAyMy4wOC54LCB0aGFua3MuCgotLSAK
QnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
