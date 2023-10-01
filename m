Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9781E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 12:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 496A640A67;
	Sun,  1 Oct 2023 12:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 496A640A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jfeyJyGFyys9; Sun,  1 Oct 2023 12:35:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75899405BC;
	Sun,  1 Oct 2023 12:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75899405BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE58A1BF5A0
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 12:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C559D82052
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 12:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C559D82052
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QgM9FwEEyLYp for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 12:35:53 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD66182035
 for <buildroot@busybox.net>; Sun,  1 Oct 2023 12:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD66182035
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D7BE240003;
 Sun,  1 Oct 2023 12:35:49 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmvfo-00GMfY-QZ; Sun, 01 Oct 2023 14:35:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20231001103215.3333968-1-francois.perrad@gadz.org>
Date: Sun, 01 Oct 2023 14:35:48 +0200
In-Reply-To: <20231001103215.3333968-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sun, 1 Oct 2023 12:32:15 +0200")
Message-ID: <87msx25xln.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/lua-mqtt: bump to version 0.3.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
