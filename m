Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027B8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:43:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0F7F61002
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0F7F61002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 751196086F;
	Mon, 25 Oct 2021 11:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6b9Sq6kT3ZwT; Mon, 25 Oct 2021 11:43:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA9D86086B;
	Mon, 25 Oct 2021 11:43:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D13A51BF37A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C13E080DFB
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oMac-BVd5nWL for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 11:43:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3B7080DFA
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:43:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D14221BF206;
 Mon, 25 Oct 2021 11:43:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1meyNu-0008W5-24; Mon, 25 Oct 2021 13:43:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20211015125944.10587-1-peter@korsgaard.com>
 <20211015125944.10587-2-peter@korsgaard.com>
Date: Mon, 25 Oct 2021 13:43:22 +0200
In-Reply-To: <20211015125944.10587-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 15 Oct 2021 14:59:43 +0200")
Message-ID: <87wnm1wcrp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/docker-engine: security bump to
 version 20.10.9
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgaXNzdWVzOgogPiAtIENWRS0y
MDIxLTQxMDg5OiAgQ3JlYXRlIHBhcmVudCBkaXJlY3RvcmllcyBpbnNpZGUgYSBjaHJvb3QgZHVy
aW5nIGRvY2tlcgogPiAgIGNwIHRvIHByZXZlbnQgYSBzcGVjaWFsbHkgY3JhZnRlZCBjb250YWlu
ZXIgZnJvbSBjaGFuZ2luZyBwZXJtaXNzaW9ucyBvZgogPiAgIGV4aXN0aW5nIGZpbGVzIGluIHRo
ZSBob3N04oCZcyBmaWxlc3lzdGVtLgoKID4gLSBDVkUtMjAyMS00MTA5MTogTG9jayBkb3duIGZp
bGUgcGVybWlzc2lvbnMgdG8gcHJldmVudCB1bnByaXZpbGVnZWQgdXNlcnMKID4gICBmcm9tIGRp
c2NvdmVyaW5nIGFuZCBleGVjdXRpbmcgcHJvZ3JhbXMgaW4gL3Zhci9saWIvZG9ja2VyLgoKID4g
U2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgoKQ29t
bWl0dGVkIHRvIDIwMjEuMDIueCBhbmQgMjAyMS4wOC54LCB0aGFua3MuCgotLSAKQnllLCBQZXRl
ciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
