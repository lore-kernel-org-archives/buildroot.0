Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B675DC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 621004365C;
	Thu, 30 Nov 2023 23:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 621004365C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1eIyLlR4FvUn; Thu, 30 Nov 2023 23:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6986A43662;
	Thu, 30 Nov 2023 23:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6986A43662
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4501BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B9D66FA68
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B9D66FA68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzudjWYLe0fx for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:01:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 160B66FA42
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 160B66FA42
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01ABF1C000A;
 Thu, 30 Nov 2023 23:01:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8q1n-003YGE-0j;
 Fri, 01 Dec 2023 00:01:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier <brandon.maier@collins.com>
References: <20231128195507.5291-1-brandon.maier@collins.com>
 <878r6hd2ly.fsf@48ers.dk>
Date: Fri, 01 Dec 2023 00:01:02 +0100
In-Reply-To: <878r6hd2ly.fsf@48ers.dk> (Peter Korsgaard's message of "Tue, 28
 Nov 2023 21:50:17 +0100")
Message-ID: <871qc67snl.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] docs/website: fix favicon
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Brandon" == Brandon Maier <brandon.maier@collins.com> writes:
 >> When the favicon image was added in f26e61319f3f (docs/website: add
 >> favicon.png), it was added to a different directory then where the header's
 >> icon link points. This causes the favicon to fail to load with 404.

 >> While we are here, remove the "shortcut" rel attribute as it is non-standard
 >> and it's recommended not to use it[1].

 >> [1] https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rel#sect4

 >> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

 > Committed, thanks.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
