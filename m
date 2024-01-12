Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4F0C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 15:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A835384527;
	Fri, 12 Jan 2024 15:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A835384527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wurfwr8tsmqt; Fri, 12 Jan 2024 15:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1532D84542;
	Fri, 12 Jan 2024 15:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1532D84542
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 742611BF39F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 15:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B60D43A53
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 15:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B60D43A53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49WF2wEpDq6N for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 15:21:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 004FD4032A
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 15:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 004FD4032A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D24F4000D;
 Fri, 12 Jan 2024 15:21:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOJLd-00Atrz-2w;
 Fri, 12 Jan 2024 16:21:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240101221317.39694-1-fontaine.fabrice@gmail.com>
 <20240102095510.395f7b6f@windsurf>
Date: Fri, 12 Jan 2024 16:21:29 +0100
In-Reply-To: <20240102095510.395f7b6f@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 2 Jan 2024 09:55:10 +0100")
Message-ID: <87v87y1ssm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-paramiko: security bump
 to version 3.4.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gT24gTW9uLCAgMSBKYW4gMjAyNCAyMzoxMzox
NyArMDEwMAogPiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4g
d3JvdGU6CgogPj4gQWRkcmVzcyBDVkUgMjAyMy00ODc5NSAoYWthIHRoZSDigJxUZXJyYXBpbiBB
dHRhY2vigJ0sIGEgdnVsbmVyYWJpbGl0eSBmb3VuZAogPj4gaW4gdGhlIFNTSCBwcm90b2NvbCBy
ZQogPj4gCiA+PiBodHRwczovL2dpdGh1Yi5jb20vcGFyYW1pa28vcGFyYW1pa28vYmxvYi8zLjQu
MC9zaXRlcy93d3cvY2hhbmdlbG9nLnJzdAogPj4gCiA+PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNl
IEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KID4+IC0tLQogPj4gcGFja2Fn
ZS9weXRob24tcGFyYW1pa28vcHl0aG9uLXBhcmFtaWtvLmhhc2ggfCA0ICsrLS0KID4+IHBhY2th
Z2UvcHl0aG9uLXBhcmFtaWtvL3B5dGhvbi1wYXJhbWlrby5tayAgIHwgNCArKy0tCiA+PiAyIGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCiA+IEFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpGWUksIDIwMjMuMDIueCBhbmQgMjAyMy4xMS54IGhhcyBwYXJh
bWlrbyAyLjEyLiBJIHdvdWxkIHByZWZlciB0byBub3QKaGF2ZSB0byBidW1wIHRoZW0gdG8gMy40
LjAuCgpJIHNlZSB0aGF0IERlYmlhbiBhbHNvIGhhcyBwYXJhbWlrbyAyLjEyLCBidXQgc28gZmFy
IG5vIGJhY2twb3J0ZWQgcGF0Y2gKZm9yIGl0LiBIb3BlZnVsbHkgdGhhdCB3aWxsIHNob3cgdXAg
c29vbjoKCmh0dHBzOi8vc2VjdXJpdHktdHJhY2tlci5kZWJpYW4ub3JnL3RyYWNrZXIvQ1ZFLTIw
MjMtNDg3OTUKClNvIEknbGwgbGVhdmUgdGhpcyBmb3Igbm93LgoKLS0gCkJ5ZSwgUGV0ZXIgS29y
c2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
