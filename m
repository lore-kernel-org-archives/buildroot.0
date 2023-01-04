Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7386C53210
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 22:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DCA482015;
	Wed,  4 Jan 2023 22:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DCA482015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRVRvvj-TlqB; Wed,  4 Jan 2023 22:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C73E681FFA;
	Wed,  4 Jan 2023 22:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C73E681FFA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 005E41BF3A3
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D00A840577
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D00A840577
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DLfh-YG70PnX for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 22:12:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE19B4016C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE19B4016C
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 22:12:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C021D240002;
 Wed,  4 Jan 2023 22:12:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pDBzk-005BMD-Sh; Wed, 04 Jan 2023 23:12:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Martin =?utf-8?Q?Hundeb=C3=B8ll?= <martin@geanix.com>
References: <20230103135617.3211318-1-martin@geanix.com>
 <20230103135617.3211318-2-martin@geanix.com>
Date: Wed, 04 Jan 2023 23:12:24 +0100
In-Reply-To: <20230103135617.3211318-2-martin@geanix.com> ("Martin
 =?utf-8?Q?Hundeb=C3=B8ll=22's?= message of "Tue, 3 Jan 2023 14:56:17
 +0100")
Message-ID: <87o7rerltj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] bash: bump version to 5.2.15
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

Pj4+Pj4gIk1hcnRpbiIgPT0gTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXguY29tPiB3
cml0ZXM6CgogPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8bWFydGluQGdlYW5p
eC5jb20+CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
