Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACCCEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC8B8409A6;
	Sun, 16 Jul 2023 06:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC8B8409A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uzzv5ZKfH78V; Sun, 16 Jul 2023 06:01:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 121A3409A4;
	Sun, 16 Jul 2023 06:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 121A3409A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 453F71BF3BB
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BC6340489
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BC6340489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pboYjTgBFYF5 for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:01:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A20F840354
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A20F840354
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:01:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C600C0005;
 Sun, 16 Jul 2023 06:01:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qKuoi-008m4s-4p; Sun, 16 Jul 2023 08:01:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
References: <20230622053618.3230837-1-m.niestroj@grinn-global.com>
Date: Sun, 16 Jul 2023 08:01:12 +0200
In-Reply-To: <20230622053618.3230837-1-m.niestroj@grinn-global.com> (Marcin
 Niestroj's message of "Thu, 22 Jun 2023 07:36:17 +0200")
Message-ID: <87pm4se6on.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/python-dbus-fast: drop
 python-async-timeout dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:

 > async-timeout dependency was dropped upstream for Python 3.11 (see [1]).
 > [1] https://github.com/Bluetooth-Devices/dbus-fast/commit/1b5c9e1cb94d19925776d91196cf1b657264c494

 > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
