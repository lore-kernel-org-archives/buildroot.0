Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0BEC46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 22:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70EFB83544;
	Tue, 30 Jan 2024 22:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70EFB83544
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8czHYa7n49WN; Tue, 30 Jan 2024 22:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC38583521;
	Tue, 30 Jan 2024 22:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC38583521
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49BD41BF5DF
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2331A60F45
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2331A60F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WXE0QgeLoaSv for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 22:05:39 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7098C60D4F
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 22:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7098C60D4F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A9C560002;
 Tue, 30 Jan 2024 22:05:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rUwEa-00GcJK-2t;
 Tue, 30 Jan 2024 23:05:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Robert Marko <robimarko@gmail.com>
References: <20240130100039.176171-1-robimarko@gmail.com>
Date: Tue, 30 Jan 2024 23:05:36 +0100
In-Reply-To: <20240130100039.176171-1-robimarko@gmail.com> (Robert Marko's
 message of "Tue, 30 Jan 2024 11:00:39 +0100")
Message-ID: <87eddyzdcf.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/mdio-tools: bump version to 1.3.1
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

>>>>> "Robert" == Robert Marko <robimarko@gmail.com> writes:

 > [v1.3.1] - 2023-12-02
 > ---------------------

 > Fixes mvls to work with kernels 6.2 and onwards.

 > - mdio: Multiple registers can now be dumped at once, via the generic
 >   dump operation.

 > - mvls: Relax the driver matching to accept the strings used in
 >   kernels 6.2 and newer.

 > Signed-off-by: Robert Marko <robimarko@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
