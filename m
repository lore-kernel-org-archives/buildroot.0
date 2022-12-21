Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FECC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 08:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFB4A404C1;
	Wed, 21 Dec 2022 08:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFB4A404C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVhANQYVerMx; Wed, 21 Dec 2022 08:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3407F404AB;
	Wed, 21 Dec 2022 08:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3407F404AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 848671BF3F6
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 08:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64EAA404AB
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 08:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64EAA404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rkjb6sFWdH3z for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 08:07:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E77E0404A1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E77E0404A1
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 08:07:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B71161C000A;
 Wed, 21 Dec 2022 08:07:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p7u8n-000Ndk-O6; Wed, 21 Dec 2022 09:07:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221211131740.416228623A@busybox.osuosl.org>
Date: Wed, 21 Dec 2022 09:07:53 +0100
In-Reply-To: <20221211131740.416228623A@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sun, 11 Dec 2022 14:16:27 +0100")
Message-ID: <875ye5rxgm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/asterisk: security bump to
 version 16.29.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gY29tbWl0OiBodHRwczovL2dpdC5idWlsZHJv
b3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPWMzNGUwYjFjZDVmN2UxMGNlNGZjMTk4ODBlMTVi
YTYwODAwNmVlNzYKID4gYnJhbmNoOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9v
dC9jb21taXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCgogPiBGaXhlcyB0aGUgZm9sbG93aW5nIHNl
Y3VyaXR5IGlzc3VlczoKCiA+IC0gQ1ZFLTIwMjItMzczMjU6IEEgemVybyBsZW5ndGggQ2FsbGVk
IG9yIENhbGxpbmcgUGFydHkgTnVtYmVyIGNhbiBjYXVzZSBhCiA+ICAgYnVmZmVyIHVuZGVyLXJ1
biBhbmQgQXN0ZXJpc2sgY3Jhc2guCgogPiAgIGh0dHBzOi8vZG93bmxvYWRzLmFzdGVyaXNrLm9y
Zy9wdWIvc2VjdXJpdHkvQVNULTIwMjItMDA3Lmh0bWwKCiA+IC0gQ1ZFLTIwMjItNDI3MDU6IFVz
ZSBhZnRlciBmcmVlIGluIHJlc19wanNpcF9wdWJzdWIuYyBtYXkgYWxsb3cgYSByZW1vdGUKID4g
ICBhdXRoZW50aWNhdGVkIGF0dGFja2VyIHRvIGNyYXNoIEFzdGVyaXNrIChkZW5pYWwgb2Ygc2Vy
dmljZSkgYnkgcGVyZm9ybWluZwogPiAgIGFjdGl2aXR5IG9uIGEgc3Vic2NyaXB0aW9uIHZpYSBh
IHJlbGlhYmxlIHRyYW5zcG9ydCBhdCB0aGUgc2FtZSB0aW1lCiA+ICAgQXN0ZXJpc2sgaXMgYWxz
byBwZXJmb3JtaW5nIGFjdGl2dHkgb24gdGhhdCBzdWJzY3JpcHRpb24uCgogPiAgIGh0dHBzOi8v
ZG93bmxvYWRzLmFzdGVyaXNrLm9yZy9wdWIvc2VjdXJpdHkvQVNULTIwMjItMDA4Lmh0bWwKCiA+
IC0gQ1ZFLTIwMjItNDI3MDY6IEFNSSBVc2VycyB3aXRoIOKAnGNvbmZpZ+KAnSBwZXJtaXNzaW9u
cyBtYXkgcmVhZCBmaWxlcyBvdXRzaWRlCiA+ICAgb2YgQXN0ZXJpc2sgZGlyZWN0b3J5IHZpYSBH
ZXRDb25maWcgQU1JIEFjdGlvbiBldmVuIGlmIOKAnGxpdmVfZGFuZ2Vyb3VzbHkiCiA+ICAgaXMg
c2V0IHRvICJubyIKCiA+ICAgaHR0cHM6Ly9kb3dubG9hZHMuYXN0ZXJpc2sub3JnL3B1Yi9zZWN1
cml0eS9BU1QtMjAyMi0wMDkuaHRtbAoKID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJk
IDxwZXRlckBrb3JzZ2FhcmQuY29tPgogPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25p
IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQ29tbWl0dGVkIHRvIDIwMjIuMTEueCBh
bmQgMjAyMi4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
