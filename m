Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FBFC83F23
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 13:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE334094A;
	Thu, 29 Aug 2024 13:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSnSkT0PZgiB; Thu, 29 Aug 2024 13:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E99FE4135A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E99FE4135A;
	Thu, 29 Aug 2024 13:41:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 654391BF8B4
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5021540328
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9prsAHAkQQA for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 13:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 44D97402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44D97402A8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44D97402A8
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 13:41:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7438E20007;
 Thu, 29 Aug 2024 13:41:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sjfOn-007PbY-0R;
 Thu, 29 Aug 2024 15:41:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: J. =?utf-8?Q?Neusch=C3=A4fer?= via buildroot <buildroot@buildroot.org>
References: <20240719-micropython-v1-0-9d71f1125e49@gmx.net>
 <20240719-micropython-v1-2-9d71f1125e49@gmx.net>
Date: Thu, 29 Aug 2024 15:41:17 +0200
In-Reply-To: <20240719-micropython-v1-2-9d71f1125e49@gmx.net> ("J.
 =?utf-8?Q?Neusch=C3=A4fer?=
 via buildroot"'s message of "Fri, 19 Jul 2024 16:18:00 +0200")
Message-ID: <87h6b34fb6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/micropython: Adjust name in
 description
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
Cc: Chris Packham <judge.packham@gmail.com>,
 "J. =?utf-8?Q?Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>,
 "J. =?utf-8?Q?Neusch=C3=A4fer?=" <j.ne@posteo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkoiID09IEogTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxk
cm9vdC5vcmc+IHdyaXRlczoKCiA+IENoYW5nZSB0aGUgbmFtZSBmcm9tICJNaWNybyBQeXRob24i
ICh0d28gd29yZHMpIHRvICJNaWNyb1B5dGhvbiIKID4gKGNhbWVsY2FzZSksIHRvIG1hdGNoIHRo
ZSBvZmZpY2lhbCB3ZWJzaXRlIGFuZCBkb2N1bWVudGF0aW9uLgoKID4gU2lnbmVkLW9mZi1ieTog
Si4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCkNvbW1pdHRlZCB0byAyMDI0
LjAyLnggYW5kIDIwMjQuMDUueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
