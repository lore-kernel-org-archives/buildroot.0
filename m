Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7417C433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 13:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4EA98266C;
	Tue, 30 Nov 2021 13:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OAic-J5i4_Ai; Tue, 30 Nov 2021 13:57:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35C5D825D3;
	Tue, 30 Nov 2021 13:57:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC9D41BF2AF
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 13:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA0AF82553
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 13:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJR4fY0qpb28 for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 13:57:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACA808254D
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 13:57:08 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id BAB9D20000A;
 Tue, 30 Nov 2021 13:57:05 +0000 (UTC)
Date: Tue, 30 Nov 2021 14:57:04 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Message-ID: <20211130145704.6608ca93@kmaincent-XPS-13-7390>
In-Reply-To: <20211129100358.tjhpwco7sxfdmecv@fedora>
References: <20211125155040.90840-1-kory.maincent@bootlin.com>
 <20211129100358.tjhpwco7sxfdmecv@fedora>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rkdeveloptool: add new package
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUXVlbnRpbiwKClRoYW5rcyBmb3IgdGhlIHJldmlldyEKCk9uIE1vbiwgMjkgTm92IDIw
MjEgMTE6MDM6NTggKzAxMDAKUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QHRoZW9icm9t
YS1zeXN0ZW1zLmNvbT4gd3JvdGU6Cgo+ID4gK1JLREVWRUxPUFRPT0xfVkVSU0lPTiA9IDQ2YmI0
YzA3MzYyNDIyNmMzZjA1YjM3YjllY2M1MGJiY2Y1NDNmNWEKPiA+ICtSS0RFVkVMT1BUT09MX1NJ
VEUgPSAkKGNhbGwKPiA+IGdpdGh1Yixyb2NrY2hpcC1saW51eCxya2RldmVsb3B0b29sLCQoUktE
RVZFTE9QVE9PTF9WRVJTSU9OKSkKPiA+ICtSS0RFVkVMT1BUT09MX0xJQ0VOU0UgPSBHUEwyICtS
S0RFVkVMT1BUT09MX0xJQ0VOU0VfRklMRVMgPSBsaWNlbnNlLnR4dAo+ID4gK0hPU1RfUktERVZF
TE9QVE9PTF9ERVBFTkRFTkNJRVMgPSBob3N0LWxpYnVzYgo+ID4gKyAgCj4gCj4gSXNuJ3QgaXQg
bWlzc2luZyB0aGUgaG9zdC1ldWRldj8gSSBoYWQgaXQgaW4gbXkgbG9jYWwgcGFja2FnZSB0aGF0
IEkKPiBmb3Jnb3QgdG8gdXBzdHJlYW0uIEkgYXNzdW1lIGJ1aWxkaW5nIGl0IGluIGEgbWluaW1h
bCBjb250YWluZXIgd291bGQKPiBnaXZlIHVzIHRoZSBhbnN3ZXIuCj4gCj4gYy5mLgo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9yb2NrY2hpcC1saW51eC9ya2RldmVsb3B0b29sL2Jsb2IvbWFzdGVyL1Jl
YWRtZS50eHQjTDQtTDUKCkl0IGJ1aWx0IGluIGEgbWluaW1hbCBVYnVudHUgZG9ja2VyIHdpdGhv
dXQgbGlidWRldi1kZXYuCk1heWJlIGEgcnVudGltZSBkZXBlbmRlbmN5LCBidXQgbGlidWRldiBp
cyBpbnN0YWxsZWQgaW4gbW9zdCBvZiBkZXNrdG9wCmRpc3RyaWJ1dGlvbiwgcmlnaHQ/Cgo+IAo+
IE90aGVyd2lzZSwgSSBoYWQgdGhlIHNhbWUgZm9yIGV2ZXJ5dGhpbmcgZWxzZS4KPiAKPiBCeSB0
aGUgd2F5LCBubyAuaGFzaCBpbiB0aGlzIHBhdGNoLi4gSXMgdGhpcyBleHBlY3RlZC9va2F5PwoK
T29wcywgYSBtZXJlIG92ZXJzaWdodCEKClJlZ2FyZHMsCgpLw7ZyeQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
