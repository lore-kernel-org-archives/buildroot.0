Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665C1C3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F215F61441;
	Fri, 25 Aug 2023 13:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F215F61441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z84W2FPvErGL; Fri, 25 Aug 2023 13:09:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55B3161001;
	Fri, 25 Aug 2023 13:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55B3161001
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3AC51BF82F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D68C61001
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D68C61001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yS5S1vzCdzDK for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:09:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F2A660FE0
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F2A660FE0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42B3120008;
 Fri, 25 Aug 2023 13:09:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qZWYm-002tVt-G6; Fri, 25 Aug 2023 15:09:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Lothar Felten <lothar.felten@gmail.com>
References: <20230711094448.2482427-1-lothar.felten@gmail.com>
Date: Fri, 25 Aug 2023 15:09:08 +0200
In-Reply-To: <20230711094448.2482427-1-lothar.felten@gmail.com> (Lothar
 Felten's message of "Tue, 11 Jul 2023 11:44:48 +0200")
Message-ID: <87zg2fb763.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglebone_qt5_defconfig: build
 am335x-bonegreen-wireless
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

>>>>> "Lothar" == Lothar Felten <lothar.felten@gmail.com> writes:

 >   Build the am335x-bonegreen-wireless.dtb device tree.
 >   The genimage script which is shared between beaglebone and
 >   beaglebone_qt5 was updated to support the bonegreen-wireless.

 > Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
