Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CCAEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 13:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD6A260B8A;
	Mon, 17 Jul 2023 13:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD6A260B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeKrkrNIxL57; Mon, 17 Jul 2023 13:07:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2644260A91;
	Mon, 17 Jul 2023 13:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2644260A91
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F3BE1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 13:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED996400EF
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 13:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED996400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CNQB6yBhWa3v for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 13:07:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02C73400C5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02C73400C5
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 13:07:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8D512000F;
 Mon, 17 Jul 2023 13:07:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qLNx7-00DopJ-71; Mon, 17 Jul 2023 15:07:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Andr=C3=A9?= Zwing <nerv@dawncrow.de>
References: <20230707144939.1543141-1-nerv@dawncrow.de>
Date: Mon, 17 Jul 2023 15:07:49 +0200
In-Reply-To: <20230707144939.1543141-1-nerv@dawncrow.de> (=?utf-8?Q?=22And?=
 =?utf-8?Q?r=C3=A9?= Zwing"'s
 message of "Fri, 7 Jul 2023 16:49:39 +0200")
Message-ID: <87jzuy8z4q.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/wine: bump to version 8.0.1
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

Pj4+Pj4gIkFuZHLDqSIgPT0gQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPiB3cml0ZXM6
CgogPiBTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgWndpbmcgPG5lcnZAZGF3bmNyb3cuZGU+CgpDb21t
aXR0ZWQgdG8gMjAyMy4wNS54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
