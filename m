Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B812FC6FA99
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 21:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6307861101;
	Tue,  7 Mar 2023 21:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6307861101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZzynw0GDp2C; Tue,  7 Mar 2023 21:08:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C986058D;
	Tue,  7 Mar 2023 21:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C986058D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FD9E1BF33B
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79470402E0
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79470402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VyHV-NoAI2cv for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 21:08:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 434FE402E1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 434FE402E1
 for <buildroot@buildroot.net>; Tue,  7 Mar 2023 21:08:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1B5B040006;
 Tue,  7 Mar 2023 21:08:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pZeYB-003M4F-9S; Tue, 07 Mar 2023 22:08:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicola Di Lieto <nicola.dilieto@gmail.com>
References: <ZABq61t3vEixCwpm@einstein.dilieto.eu>
Date: Tue, 07 Mar 2023 22:08:47 +0100
In-Reply-To: <ZABq61t3vEixCwpm@einstein.dilieto.eu> (Nicola Di Lieto's message
 of "Thu, 2 Mar 2023 10:22:51 +0100")
Message-ID: <87edq046cg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/uacme: bump version to 1.7.4
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
Cc: buildroot@buildroot.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Nicola" == Nicola Di Lieto <nicola.dilieto@gmail.com> writes:

 > Includes https://github.com/ndilieto/uacme/commit/fe91f46b620f8c58805fcf48cb4f4a793c8a47a4
 > Fixes https://github.com/ndilieto/uacme/issues/64

 > Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
 > ---
 > Changes v1 -> v2: fix patch whitespace damage by email client

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
