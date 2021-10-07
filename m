Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F16C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:35:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C2EE60F4A
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C2EE60F4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D787401AD;
	Thu,  7 Oct 2021 20:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6dA2fsvRl19; Thu,  7 Oct 2021 20:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAA3E40208;
	Thu,  7 Oct 2021 20:35:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 110A71BF84C
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00D06405B6
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hE0PQYkyqrN2 for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:35:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAC734059F
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:34:59 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 62B2E100009;
 Thu,  7 Oct 2021 20:34:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mYa6R-0003iD-Ej; Thu, 07 Oct 2021 22:34:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Asaf Kahlon <asafka7@gmail.com>
References: <20211006161147.19864-1-asafka7@gmail.com>
Date: Thu, 07 Oct 2021 22:34:55 +0200
In-Reply-To: <20211006161147.19864-1-asafka7@gmail.com> (Asaf Kahlon's message
 of "Wed, 6 Oct 2021 19:11:45 +0300")
Message-ID: <87pmsgzi8g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-oauthlib: depend on
 python3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:

 > According to the package realease notes
 > (https://github.com/oauthlib/oauthlib/releases/tag/v3.1.1),
 > python2 isn't supported.

 > All the reverse dependencies are already python3-only.

 > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
