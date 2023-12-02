Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FDBC4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 08:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23435435CB;
	Sat,  2 Dec 2023 08:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23435435CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIxrIZuIMV1k; Sat,  2 Dec 2023 08:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2636E403AE;
	Sat,  2 Dec 2023 08:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2636E403AE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0B51BF3BF
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 08:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25EAA60B45
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 08:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25EAA60B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Og-VNX1H-IfU for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 08:40:50 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1565960B43
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 08:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1565960B43
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCA1F1BF205;
 Sat,  2 Dec 2023 08:40:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9LYM-0053ia-0f;
 Sat, 02 Dec 2023 09:40:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231201212318.1091953-1-fontaine.fabrice@gmail.com>
Date: Sat, 02 Dec 2023 09:40:46 +0100
In-Reply-To: <20231201212318.1091953-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 1 Dec 2023 22:23:18 +0100")
Message-ID: <87ttp12e0h.fsf@48ers.dk>
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
Y29tPgoKQ29tbWl0dGVkLCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
