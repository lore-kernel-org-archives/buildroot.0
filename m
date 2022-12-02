Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491FAC4332F
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 18:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8C5E400D6;
	Fri,  2 Dec 2022 18:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8C5E400D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Lw6VSrSQihy; Fri,  2 Dec 2022 18:51:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33C734019B;
	Fri,  2 Dec 2022 18:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C734019B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31EBD1BF348
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 18:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ACBE6114D
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 18:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ACBE6114D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5I32qUqm2tq6 for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 18:51:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F90460E0A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F90460E0A
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 18:51:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D96840009;
 Fri,  2 Dec 2022 18:51:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p1B7o-008gaq-45; Fri, 02 Dec 2022 19:51:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20221126105350.14687-1-neal.frager@amd.com>
 <20221126105350.14687-3-neal.frager@amd.com>
Date: Fri, 02 Dec 2022 19:51:04 +0100
In-Reply-To: <20221126105350.14687-3-neal.frager@amd.com> (Neal Frager's
 message of "Sat, 26 Nov 2022 03:53:50 -0700")
Message-ID: <87lenp8wrr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 3/3] configs/zynqmp_kria_kv260_defconfig:
 bump to Xilinx 2022.2
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch bumps the zynqmp_kria_kv260_defconfig to Xilinx release 2022.2.
 > Xilinx 2022.2 includes:
 > - U-Boot 2022.01 bug fixes
 > - Linux bump to Linux 5.15.36 with bug fixes
 > - TF-A 2.6 bug fixes
 > - PMUFW bug fixes

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
