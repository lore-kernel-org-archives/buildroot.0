Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDDFC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 09:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04B4260C21;
	Sun,  3 Apr 2022 09:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44Wu_x9SgdBl; Sun,  3 Apr 2022 09:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DDB260BF8;
	Sun,  3 Apr 2022 09:43:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65AE51BF599
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61F35403AC
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqqgEOzUMybq for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 09:43:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D892140145
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 09:43:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DA3A5200006;
 Sun,  3 Apr 2022 09:43:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nawlM-004iMm-Rz; Sun, 03 Apr 2022 11:43:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220313114741.1127825-1-fontaine.fabrice@gmail.com>
 <87mthbb08q.fsf@dell.be.48ers.dk>
 <397c22c3-8ca6-2300-a049-b8f6fa716699@gmail.com>
Date: Sun, 03 Apr 2022 11:43:12 +0200
In-Reply-To: <397c22c3-8ca6-2300-a049-b8f6fa716699@gmail.com> (Romain Naour's
 message of "Thu, 31 Mar 2022 22:04:04 +0200")
Message-ID: <87y20m1ozz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-twisted: security bump
 to version 22.2.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3
cml0ZXM6CgogPiBIZWxsbyBQZXRlciwKID4gTGUgMjcvMDMvMjAyMiDDoCAyMjozNywgUGV0ZXIg
S29yc2dhYXJkIGEgw6ljcml0wqA6CiA+Pj4+Pj4+ICJGYWJyaWNlIiA9PSBGYWJyaWNlIEZvbnRh
aW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JpdGVzOgogPj4gCiA+PiA+IEZpeCBD
VkUtMjAyMi0yMTcxNjogVHdpc3RlZCBpcyBhbiBldmVudC1iYXNlZCBmcmFtZXdvcmsgZm9yIGlu
dGVybmV0CiA+PiA+IGFwcGxpY2F0aW9ucywgc3VwcG9ydGluZyBQeXRob24gMy42Ky4gUHJpb3Ig
dG8gMjIuMi4wLCBUd2lzdGVkIFNTSAogPj4gPiBjbGllbnQgYW5kIHNlcnZlciBpbXBsZW1lbnQg
aXMgYWJsZSB0byBhY2NlcHQgYW4gaW5maW5pdGUgYW1vdW50IG9mIGRhdGEKID4+ID4gZm9yIHRo
ZSBwZWVyJ3MgU1NIIHZlcnNpb24gaWRlbnRpZmllci4gVGhpcyBlbmRzIHVwIHdpdGggYSBidWZm
ZXIgdXNpbmcKID4+ID4gYWxsIHRoZSBhdmFpbGFibGUgbWVtb3J5LiBUaGUgYXR0YWNoIGlzIGEg
c2ltcGxlIGFzIGBuYyAtcnYgbG9jYWxob3N0IDIyCiA+PiA+IDwgL2Rldi96ZXJvYC4gQSBwYXRj
aCBpcyBhdmFpbGFibGUgaW4gdmVyc2lvbiAyMi4yLjAuIFRoZXJlIGFyZQogPj4gPiBjdXJyZW50
bHkgbm8ga25vd24gd29ya2Fyb3VuZHMuCiA+PiAKID4+ID4gaHR0cHM6Ly9naXRodWIuY29tL3R3
aXN0ZWQvdHdpc3RlZC9yZWxlYXNlcy90YWcvdHdpc3RlZC0yMi4yLjAKID4+IAogPj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4K
ID4+IAogPj4gQ29tbWl0dGVkIHRvIDIwMjEuMDIueCBhbmQgMjAyMi4wMi54LCB0aGFua3MuCiA+
PiAKCiA+IEFzIHJlcG9ydGVkIHJlY2VudGx5LCBweXRob24tdHdpc3RlZCBhbmQgcHl0aG9uLXRy
ZXEgbXVzdCB1c2UgdGhlIHNhbWUgdmVyc2lvbjoKID4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0
L3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMi1GZWJydWFyeS82Mzc1MDUuaHRtbAoKID4gQnV0IHRo
aXMgYmFja3BvcnQgcmVxdWlyZXMgdG8gdXBkYXRlIHB5dGhvbi10cmVxIHBhY2thZ2U6CiA+IGh0
dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9OTMzNDQ3YzI3YzQx
ZWJjZGI1ZWI5ZmEyYTM3NDQ1NjY5OWFlMzNmMgoKVGhhbmtzLCBiYWNrcG9ydGVkIHRoZSBweXRo
b24tdHJlcSBidW1wIHRvIDIwMjEuMDIueCAvIDIwMjIuMDIueC4KCi0tIApCeWUsIFBldGVyIEtv
cnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
