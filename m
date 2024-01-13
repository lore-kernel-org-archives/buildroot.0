Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19DEC4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A5460F40;
	Sat, 13 Jan 2024 21:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1A5460F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjPeehqRLNjF; Sat, 13 Jan 2024 21:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F3AD60EE5;
	Sat, 13 Jan 2024 21:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F3AD60EE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 754901BF867
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 599754032A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 599754032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhHjpXQy5QdV for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:18:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1014340132
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1014340132
Received: by mail.gandi.net (Postfix) with ESMTPSA id 247421BF203;
 Sat, 13 Jan 2024 21:18:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOlON-00DQBG-1T;
 Sat, 13 Jan 2024 22:18:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Hitz via buildroot <buildroot@buildroot.org>
References: <20240110171455.3978780-1-christian@klarinett.li>
Date: Sat, 13 Jan 2024 22:18:11 +0100
In-Reply-To: <20240110171455.3978780-1-christian@klarinett.li> (Christian Hitz
 via buildroot's message of "Wed, 10 Jan 2024 18:14:54 +0100")
Message-ID: <874jfhnd9o.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/duktape: add DUKTAPE_CPE_ID_VENDOR
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
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Hitz via buildroot <buildroot@buildroot.org> writes:

 > From: Christian Hitz <christian.hitz@bbv.ch>
 > cpe:2.3:a:duktape_project:duktape:2.7.0:*:*:*:*:*:*:* is a valid CPE
 > identifier for this package:

 >   https://nvd.nist.gov/products/cpe/detail/DEAF95D7-0DAB-4025-8C5A-9CCF80D75CF2

 > Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
