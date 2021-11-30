Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E52C433EF
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 10:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEFA581C44;
	Tue, 30 Nov 2021 10:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JjalYgy9cRVk; Tue, 30 Nov 2021 10:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 540AC81B53;
	Tue, 30 Nov 2021 10:37:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24DFD1BF255
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 10:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A7B340114
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 10:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ej9rK02UIHh for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 10:37:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 081C540001
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 10:37:51 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 06094FF807;
 Tue, 30 Nov 2021 10:37:48 +0000 (UTC)
Date: Tue, 30 Nov 2021 11:37:47 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211130113747.59c465d4@kmaincent-XPS-13-7390>
In-Reply-To: <b54e1162-de72-7b2b-4bfe-3e67560f445c@mind.be>
References: <20210908081630.3404221-1-kory.maincent@bootlin.com>
 <ecec6557-9d20-134b-497c-e6c7e55deee6@mind.be>
 <20210919150904.04051568@windsurf>
 <f8756bf0-c955-f301-299e-f5d8c0aabe04@mind.be>
 <20210920140127.1de86c50@windsurf>
 <ad51da8c-2b94-3969-b26c-2d8b168d198b@mind.be>
 <20210923215517.1c2bd3f8@windsurf>
 <b54e1162-de72-7b2b-4bfe-3e67560f445c@mind.be>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-a-toolchain: bump to
 version 10.3-2021.07
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LCBUaG9tYXMsCgpPbiBUaHUsIDIzIFNlcCAyMDIxIDIzOjIwOjQwICswMjAw
CkFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cgo+IAo+ID4+ICAg
IEhvd2V2ZXIsIGlmIHRoZSBpbnRlbnRpb24gaXMgdG8gdXNlIHRoZSB0b29sY2hhaW4gZm9yIGEg
Q29ydGV4LU0gYW5kCj4gPj4geW91IG5lZWQgYW55IG9mIGl0cyBsaWJyYXJpZXMsIGl0J3MgcHJv
YmFibHkgYSBsb3QgY2xlYW5lciB0byBzaW1wbHkgaGF2ZQo+ID4+IGEgc2VwYXJhdGUgYXJtLWdu
dS1hLXRvb2xjaGFpbiBhbmQgYXJtLWdudS1ybS10b29sY2hhaW4uIEl0J3MgZGVmaW5pdGVseSBh
Cj4gPj4gYml0IHdlaXJkIHRvIGhhdmUgYSBwYWNrYWdlICJhcm0tZ251LWEtdG9vbGNoYWluIiB0
aGF0IGFjdHVhbGx5IHVzZXMgdGhlCj4gPj4gLXJtIG9uZS4uLiAgCj4gPiAKPiA+IFllcywgSSBh
Z3JlZSB0aGF0IHdlIHNob3VsZCBwcm9iYWJseSBhZGQgYSBhcm0tZ251LXJtLXRvb2xjaGFpbiBw
YWNrYWdlCj4gPiBzaWRlLWJ5LXNpZGUgd2l0aCB0aGUgYXJtLWdudS1hLXRvb2xjaGFpbi4gS8O2
cnk6IHNvbWV0aGluZyBmb3IgeW91IHRvCj4gPiBsb29rIGF0LCBwZXJoYXBzPyA6LSkKCkh1bSwg
SSBkb24ndCBrbm93IGhvdyB0byBkbyBpdCBwcm9wZXJseSwgd2l0aG91dCBsaW5rIGFuZCBuYW1p
bmcgaW5zdGFsbGF0aW9uCmNvbmZsaWN0IGJldHdlZW4gdGhlc2UgdHdvIHRvb2xjaGFpbnMuCgpS
ZWdhcmRzLAoKS8O2cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
