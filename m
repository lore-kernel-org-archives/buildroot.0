Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350B2C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 16:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFF94420DF;
	Fri, 26 Jan 2024 16:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFF94420DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNLXKI2uwD2R; Fri, 26 Jan 2024 16:12:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A4C0420B0;
	Fri, 26 Jan 2024 16:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A4C0420B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 251331BF284
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AFE8614D2
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AFE8614D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRRxaYV5Gdmu for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 16:12:04 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A33360C02
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 16:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A33360C02
Received: by mail.gandi.net (Postfix) with ESMTPSA id 529A760002;
 Fri, 26 Jan 2024 16:12:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rTOoD-00ADRK-0E;
 Fri, 26 Jan 2024 17:12:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Petr Vorel <petr.vorel@gmail.com>
References: <20240115210821.2175974-1-petr.vorel@gmail.com>
Date: Fri, 26 Jan 2024 17:12:01 +0100
In-Reply-To: <20240115210821.2175974-1-petr.vorel@gmail.com> (Petr Vorel's
 message of "Mon, 15 Jan 2024 22:08:21 +0100")
Message-ID: <87cyto2hwu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump version to 6.7.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Francois Perrad <fperrad@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Backport fix of ss's output.
 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
