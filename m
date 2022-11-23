Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296D7C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 09:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B70A14181C;
	Wed, 23 Nov 2022 09:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B70A14181C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxfT4HFdqbGS; Wed, 23 Nov 2022 09:53:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4AC841754;
	Wed, 23 Nov 2022 09:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4AC841754
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A84F91BF853
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8351161194
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8351161194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kReAVwkkcTTU for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 09:53:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0840E61188
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0840E61188
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 09:53:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A520120004;
 Wed, 23 Nov 2022 09:53:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oxmRL-001lNp-RB; Wed, 23 Nov 2022 10:53:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20221120141721.1068907-1-peter@korsgaard.com>
Date: Wed, 23 Nov 2022 10:53:11 +0100
In-Reply-To: <20221120141721.1068907-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 20 Nov 2022 15:17:20 +0100")
Message-ID: <875yf62e0o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.28.0
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
aXRlczoKCiA+IEFzdGVyaXNrIDE2LjI2LjAgZml4ZWQgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBp
c3N1ZXM6CiA+IC0gW0FTVEVSSVNLLTI5NDc2XSDigJMgcmVzX3N0aXJfc2hha2VuOiBCbGluZCBT
U1JGIHZ1bG5lcmFiaWxpdGllcwogPiAgIGh0dHBzOi8vaXNzdWVzLmFzdGVyaXNrLm9yZy9qaXJh
L2Jyb3dzZS9BU1RFUklTSy0yOTQ3NgoKID4gLSBbQVNURVJJU0stMjk4MzhdIOKAkyAke1NRTF9F
U0MoKX0gbm90IGNvcnJlY3RseSBlc2NhcGluZyBhIHRlcm1pbmF0aW5nIFwKID4gICBodHRwczov
L2lzc3Vlcy5hc3Rlcmlzay5vcmcvamlyYS9icm93c2UvQVNURVJJU0stMjk4MzgKCiA+IC0gW0FT
VEVSSVNLLTI5ODcyXSDigJMgcmVzX3N0aXJfc2hha2VuOiBSZXNvdXJjZSBleGhhdXN0aW9uIHdp
dGggbGFyZ2UgZmlsZXMKID4gICBodHRwczovL2lzc3Vlcy5hc3Rlcmlzay5vcmcvamlyYS9icm93
c2UvQVNURVJJU0stMjk4NzIKCiA+IGh0dHBzOi8vd3d3LmFzdGVyaXNrLm9yZy9hc3Rlcmlzay1u
ZXdzL2FzdGVyaXNrLTE2LTI2LTAtbm93LWF2YWlsYWJsZS8KCiA+IEl0IHVuZm9ydHVuYXRlbHkg
YWxzbyBpbnRyb2R1Y2VkIGEgY2hhbmdlIHRvIGNoYW5faWF4MiwgYnJlYWtpbmcgYnVpbGRzCiA+
IHdpdGhvdXQgT3BlblNTTDoKID4gaHR0cHM6Ly9naXRodWIuY29tL2FzdGVyaXNrL2FzdGVyaXNr
L2NvbW1pdC81OWE4Y2RhY2EyZGJiNWVlYjczODJkZmJlNzhjMGMxY2JlZDhjZTZkCgogPiBXaGlj
aCB3YXMgYWdhaW4gZml4ZWQgaW4gMTYuMjguMDoKID4gaHR0cHM6Ly9naXRodWIuY29tL2FzdGVy
aXNrL2FzdGVyaXNrL2NvbW1pdC9mODEyZGZiNjhjNmVkN2FlNTViNGMxNjM3MTZmZDFkZGMwNjNm
ZjU0CgogPiBTbyBidW1wIHRvIDE2LjI4LjA6CiA+IGh0dHBzOi8vd3d3LmFzdGVyaXNrLm9yZy9h
c3Rlcmlzay1uZXdzL2FzdGVyaXNrLTE2LTI4LTAtbm93LWF2YWlsYWJsZS8KCiA+IFRoZSBsaWJ4
bWwyIHN1cHBvcnQgbm93IHVzZXMgcGtnLWNvbmZpZywgc28gZHJvcCB0aGUgbGlieG1sMi1jb25m
aWcgaGFuZGxpbmc6CiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9hc3Rlcmlzay9hc3Rlcmlzay9jb21t
aXQvYmY5ZGFmYTdjMjIzMDJiMmYxYTEyYjgyMTZkYTYzMTAyMTE2ZDljOQoKID4gU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgoKQ29tbWl0dGVkIHRv
IDIwMjIuMDgueCBhbmQgMjAyMi4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2Fh
cmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
