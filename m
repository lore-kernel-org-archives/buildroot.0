Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E45C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 09:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05EEB402B9;
	Tue,  7 Feb 2023 09:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05EEB402B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 257m26q6-_7W; Tue,  7 Feb 2023 09:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E893C40249;
	Tue,  7 Feb 2023 09:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E893C40249
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3593A1BF2C2
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AA714020B
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AA714020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOyogKInJpPT for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 09:51:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F36CB40238
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F36CB40238
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 09:51:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A527520004;
 Tue,  7 Feb 2023 09:51:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pPKdK-00EJ2M-Sr; Tue, 07 Feb 2023 10:51:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20221212154111.2865211-1-james.hilliard1@gmail.com>
Date: Tue, 07 Feb 2023 10:51:26 +0100
In-Reply-To: <20221212154111.2865211-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Mon, 12 Dec 2022 08:41:11 -0700")
Message-ID: <87sffh7qht.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-bunch: remove package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkphbWVzIiA9PSBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4gd3JpdGVzOgoKID4gU2luY2UgdGhlIHB5dGhvbjMgYnVtcCB0byB2ZXJzaW9uIDMuMTEgaW4g
Y29tbWl0CiA+IDczODUwMGMyOTZjOGIxMjA2ZjIwZTk0Y2EzZTdjNTkzMmE2YTA0ODYgcHl0aG9u
LWJ1bmNoIGhhcyBmYWlsZWQKID4gdG8gYnVpbGQuCgogPiBUaGlzIGlzIGR1ZSB0byBvcGVuKCkg
d2hpY2ggbm8gbG9uZ2VyIGFjY2VwdHMgJ1UnICjigJx1bml2ZXJzYWwKID4gbmV3bGluZeKAnSkg
aW4gdGhlIGZpbGUgbW9kZS4KCiA+IFJlbW92ZSB0aGlzIHBhY2thZ2UgYXMgaXQgaGFzIG5vdCBo
YWQgYSByZWxlYXNlIHNpbmNlIDIwMTEgYW5kCiA+IGlzIHVubWFpbnRhaW5lZCB1cHN0cmVhbS4K
CiA+IERldGFpbHM6CiA+IGh0dHBzOi8vZG9jcy5weXRob24ub3JnLzMuMTEvd2hhdHNuZXcvMy4x
MS5odG1sI3BvcnRpbmctdG8tcHl0aG9uLTMtMTEKCiA+IEZpeGVzOgogPiAgLSBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8yYmEvMmJhNzJmYzk4Mzc2MDVhMzZlYTYzYmJk
M2U2ZTE4MWE0MGNkZjM2MAoKID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20+CiA+IC0tLQogPiBDaGFuZ2VzIHYxIC0+IHYyOgogPiAgIC0g
YWRkIGNvbW1lbnQgYWJvdXQgcHl0aG9uLW11bmNoIHJlcGxhY2VtZW50CgpDb21taXR0ZWQsIHRo
YW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
