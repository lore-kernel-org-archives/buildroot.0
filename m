Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487C2C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED1084174D;
	Mon,  5 Feb 2024 11:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED1084174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uCrva2KrsTkd; Mon,  5 Feb 2024 11:36:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0D784174F;
	Mon,  5 Feb 2024 11:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0D784174F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 371B01BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10A9982B34
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10A9982B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BnzbLKJ5sUOY for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:36:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48B4882A17
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48B4882A17
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40D561C0004;
 Mon,  5 Feb 2024 11:35:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWxGX-00C49N-32;
 Mon, 05 Feb 2024 12:35:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20240111053548.2930141-1-james.hilliard1@gmail.com>
Date: Mon, 05 Feb 2024 12:35:57 +0100
In-Reply-To: <20240111053548.2930141-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Wed, 10 Jan 2024 22:35:48 -0700")
Message-ID: <87ttmnta76.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to
 version 0.10.0
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
Cc: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
