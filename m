Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62133C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 22:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 191DB612BE;
	Tue, 28 Nov 2023 22:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 191DB612BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tP96iJECPEXI; Tue, 28 Nov 2023 22:57:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F8D060D6B;
	Tue, 28 Nov 2023 22:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F8D060D6B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72F871BF379
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 22:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C7FE81EB3
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 22:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C7FE81EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-VRau1BsEA6 for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 22:57:33 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1238C81EB2
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 22:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1238C81EB2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 514C0C0002;
 Tue, 28 Nov 2023 22:57:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r871F-000fFs-2C;
 Tue, 28 Nov 2023 23:57:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20231128175125.581858-1-bernd@kuhls.net>
Date: Tue, 28 Nov 2023 23:57:29 +0100
In-Reply-To: <20231128175125.581858-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 28 Nov 2023 18:51:25 +0100")
Message-ID: <87edg9bi5i.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 5, 6}.x series
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
