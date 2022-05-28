Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6514C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 06:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A2CE84CAF;
	Sat, 28 May 2022 06:58:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oaGIPa6yqc2y; Sat, 28 May 2022 06:58:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7059684CAB;
	Sat, 28 May 2022 06:58:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AEAA1BF5DC
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 06:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 106DE60BD0
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 06:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eF6qrxJTc0vw for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 06:58:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D85560B98
 for <buildroot@buildroot.org>; Sat, 28 May 2022 06:58:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C7B49100003;
 Sat, 28 May 2022 06:58:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuqOr-002sxT-OO; Sat, 28 May 2022 08:58:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20220502074907.3941472-1-neal.frager@amd.com>
Date: Sat, 28 May 2022 08:58:13 +0200
In-Reply-To: <20220502074907.3941472-1-neal.frager@amd.com> (Neal Frager's
 message of "Mon, 2 May 2022 01:49:06 -0600")
Message-ID: <87a6b2f8je.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig:
 bump to Xilinx 2022.1
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch bumps configs/zynqmp_zcu102_defconfig to Xilinx software release 2022.1
 > which includes the following updates:
 >   - TF-A release version 2.6
 >   - U-Boot release version 2022.01
 >   - Linux kernel release version 5.15.19

 > It is better to use a Xilinx official release version than sha tags.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
