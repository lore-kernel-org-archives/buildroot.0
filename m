Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20244C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 22:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0CD781F37;
	Tue, 30 Jan 2024 22:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0CD781F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQdXKLA7aD8Z; Tue, 30 Jan 2024 22:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 331A681DE3;
	Tue, 30 Jan 2024 22:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 331A681DE3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 300CD1BF275
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15AF441DAB
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15AF441DAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h105bN7Ezuzv for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 22:14:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D4FF4179F
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 22:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D4FF4179F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D7FBE0002;
 Tue, 30 Jan 2024 22:14:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rUwMv-00GdMe-2B;
 Tue, 30 Jan 2024 23:14:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240129210623.408245-1-ju.o@free.fr>
Date: Tue, 30 Jan 2024 23:14:13 +0100
In-Reply-To: <20240129210623.408245-1-ju.o@free.fr> (Julien Olivain's message
 of "Mon, 29 Jan 2024 22:06:23 +0100")
Message-ID: <87jznqxydm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/opencsd: bump to version 1.5.1
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > For change log, see:
 > https://github.com/Linaro/OpenCSD/blob/v1.5.1/README.md?plain=1#L316

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
