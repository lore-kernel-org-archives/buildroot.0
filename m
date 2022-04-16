Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21FCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 13:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A70760EA4;
	Sat, 16 Apr 2022 13:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dT_Fc8LA6bwK; Sat, 16 Apr 2022 13:47:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F0D960B9C;
	Sat, 16 Apr 2022 13:47:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA3D21BF589
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 13:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D690860B9C
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 13:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tHZD7MC5FOJ5 for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 13:47:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62B3160B21
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 13:47:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 81FDF200005;
 Sat, 16 Apr 2022 13:47:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nfilo-00EbCq-Ox; Sat, 16 Apr 2022 15:47:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220415222615.3293508-1-peter@korsgaard.com>
Date: Sat, 16 Apr 2022 15:47:24 +0200
In-Reply-To: <20220415222615.3293508-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 16 Apr 2022 00:26:15 +0200")
Message-ID: <87fsmd87ir.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.25.2
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgaXNzdWVzOgogPiAxNi4yNC4x
OgoKID4gQ1ZFLTIwMjEtMzc3MDYgLyBBU1QtMjAyMi0wMDQ6IHBqcHJvamVjdDogaW50ZWdlciB1
bmRlcmZsb3cgb24gU1RVTiBtZXNzYWdlCgogPiBUaGUgaGVhZGVyIGxlbmd0aCBvbiBpbmNvbWlu
ZyBTVFVOIG1lc3NhZ2VzIHRoYXQgY29udGFpbiBhbiBFUlJPUi1DT0RFCiA+IGF0dHJpYnV0ZSBp
cyBub3QgcHJvcGVybHkgY2hlY2tlZC4gIFRoaXMgY2FuIHJlc3VsdCBpbiBhbiBpbnRlZ2VyIHVu
ZGVyZmxvdy4KID4gTm90ZSwgdGhpcyByZXF1aXJlcyBJQ0Ugb3IgV2ViUlRDIHN1cHBvcnQgdG8g
YmUgaW4gdXNlIHdpdGggYSBtYWxpY2lvdXMKID4gcmVtb3RlIHBhcnR5LgoKID4gaHR0cHM6Ly9z
ZWNsaXN0cy5vcmcvZnVsbGRpc2Nsb3N1cmUvMjAyMi9NYXIvMAoKID4gQ1ZFLTIwMjItMjM2MDgg
LyBBU1QtMjAyMi0wMDU6IHBqcHJvamVjdDogdW5kZWZpbmVkIGJlaGF2aW9yIGFmdGVyIGZyZWVp
bmcgYQogPiBkaWFsb2cgc2V0CgogPiBXaGVuIGFjdGluZyBhcyBhIFVBQywgYW5kIHdoZW4gcGxh
Y2luZyBhbiBvdXRnb2luZyBjYWxsIHRvIGEgdGFyZ2V0IHRoYXQgdGhlbgogPiBmb3JrcyBBc3Rl
cmlzayBtYXkgZXhwZXJpZW5jZSB1bmRlZmluZWQgYmVoYXZpb3IgKGNyYXNoZXMsIGhhbmdzLCBl
dGPigKYpCiA+IGFmdGVyIGEgZGlhbG9nIHNldCBpcyBwcmVtYXR1cmVseSBmcmVlZC4KCiA+IGh0
dHBzOi8vc2VjbGlzdHMub3JnL2Z1bGxkaXNjbG9zdXJlLzIwMjIvTWFyLzEKCiA+IENWRS0yMDIy
LTIxNzIzIC8gQVNULTIwMjItMDA2OiBwanByb2plY3Q6IHVuY29uc3RyYWluZWQgbWFsZm9ybWVk
IG11bHRpcGFydAogPiBTSVAgbWVzc2FnZQoKID4gSWYgYW4gaW5jb21pbmcgU0lQIG1lc3NhZ2Ug
Y29udGFpbnMgYSBtYWxmb3JtZWQgbXVsdGktcGFydCBib2R5IGFuIG91dCBvZgogPiBib3VuZHMg
cmVhZCBhY2Nlc3MgbWF5IG9jY3VyLCB3aGljaCBjYW4gcmVzdWx0IGluIHVuZGVmaW5lZCBiZWhh
dmlvci4gIE5vdGUsCiA+IGl04oCZcyBjdXJyZW50bHkgdW5jZXJ0YWluIGlmIHRoZXJlIGlzIGFu
eSBleHRlcm5hbGx5IGV4cGxvaXRhYmxlIHZlY3RvcgogPiB3aXRoaW4gQXN0ZXJpc2sgZm9yIHRo
aXMgaXNzdWUsIGJ1dCBwcm92aWRpbmcgdGhpcyBhcyBhIHNlY3VyaXR5IGlzc3VlIG91dAogPiBv
ZiBjYXV0aW9uLgoKID4gaHR0cHM6Ly9zZWNsaXN0cy5vcmcvZnVsbGRpc2Nsb3N1cmUvMjAyMi9N
YXIvMgoKID4gMTYuMjUuMjoKCiA+IENWRS0yMDIyLTI2NDk4IC8gQVNULTIwMjItMDAxOiByZXNf
c3Rpcl9zaGFrZW46IHJlc291cmNlIGV4aGF1c3Rpb24gd2l0aAogPiBsYXJnZSBmaWxlcwoKID4g
V2hlbiB1c2luZyBTVElSL1NIQUtFTiwgaXTigJlzIHBvc3NpYmxlIHRvIGRvd25sb2FkIGZpbGVz
IHRoYXQgYXJlIG5vdAogPiBjZXJ0aWZpY2F0ZXMuIFRoZXNlIGZpbGVzIGNvdWxkIGJlIG11Y2gg
bGFyZ2VyIHRoYW4gd2hhdCB5b3Ugd291bGQgZXhwZWN0IHRvCiA+IGRvd25sb2FkLgoKID4gaHR0
cHM6Ly9zZWNsaXN0cy5vcmcvZnVsbGRpc2Nsb3N1cmUvMjAyMi9BcHIvMTcKCiA+IENWRS0yMDIy
LTI2NDk5IC8gQVNULTIwMjItMDAyOiByZXNfc3Rpcl9zaGFrZW46IFNTUkYgdnVsbmVyYWJpbGl0
eSB3aXRoCiA+IElkZW50aXR5IGhlYWRlcgoKID4gV2hlbiB1c2luZyBTVElSL1NIQUtFTiwgaXTi
gJlzIHBvc3NpYmxlIHRvIHNlbmQgYXJiaXRyYXJ5IHJlcXVlc3RzIGxpa2UgR0VUIHRvCiA+IGlu
dGVyZmFjZXMgc3VjaCBhcyBsb2NhbGhvc3QgdXNpbmcgdGhlIElkZW50aXR5IGhlYWRlci4KCiA+
IGh0dHBzOi8vc2VjbGlzdHMub3JnL2Z1bGxkaXNjbG9zdXJlLzIwMjIvQXByLzE4CgogPiBDVkUt
MjAyMi0yNjY1MSAvIEFTVC0yMDIyLTAwMzogZnVuY19vZGJjOiBQb3NzaWJsZSBTUUwgSW5qZWN0
aW9uCgogPiBTb21lIGRhdGFiYXNlcyBjYW4gdXNlIGJhY2tzbGFzaGVzIHRvIGVzY2FwZSBjZXJ0
YWluIGNoYXJhY3RlcnMsIHN1Y2ggYXMKID4gYmFja3RpY2tzLiAgSWYgaW5wdXQgaXMgcHJvdmlk
ZWQgdG8gZnVuY19vZGJjIHdoaWNoIGluY2x1ZGVzIGJhY2tzbGFzaGVzIGl0CiA+IGlzIHBvc3Np
YmxlIGZvciBmdW5jX29kYmMgdG8gY29uc3RydWN0IGEgYnJva2VuIFNRTCBxdWVyeSBhbmQgdGhl
IFNRTCBxdWVyeQogPiB0byBmYWlsLgoKID4gaHR0cHM6Ly9zZWNsaXN0cy5vcmcvZnVsbGRpc2Ns
b3N1cmUvMjAyMi9BcHIvMTkKCiA+IFVwZGF0ZSBoYXNoIG9mIHNoYTEuYyBhZnRlciBhIGRveHln
ZW4gY29tbWVudCB1cGRhdGU6CiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9hc3Rlcmlzay9hc3Rlcmlz
ay9jb21taXQvMzdjMjliNmEyODFkN2Y2OWU4OTExMTcyNjlkYmY4YzIwYmFjYzkwNAoKID4gU2ln
bmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgoKQ29tbWl0
dGVkLCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
