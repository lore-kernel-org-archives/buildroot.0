Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FA7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEC6441A68;
	Fri, 22 Jul 2022 07:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEC6441A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ITCP5ehaD435; Fri, 22 Jul 2022 07:36:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AEE7419AE;
	Fri, 22 Jul 2022 07:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AEE7419AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D86D31BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3128847FB
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3128847FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0jEbyFY5XMV for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:36:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C942B847F8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C942B847F8
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:36:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19F93240004;
 Fri, 22 Jul 2022 07:36:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oEnDF-0032pL-Ji; Fri, 22 Jul 2022 09:36:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michal Simek <michal.simek@xilinx.com>
References: <20220517183842.1389395-1-neal.frager@amd.com>
 <431dc45e-07fc-c615-9928-e0dccd3d1a27@xilinx.com>
Date: Fri, 22 Jul 2022 09:36:41 +0200
In-Reply-To: <431dc45e-07fc-c615-9928-e0dccd3d1a27@xilinx.com> (Michal Simek's
 message of "Wed, 18 May 2022 08:58:20 +0200")
Message-ID: <87mtd1wqd2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 1/3] board/zynqmp/kria/readme.txt:
 improve documentation for qspi programming
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
Cc: wesley@sonifex.co.uk, Neal Frager <neal.frager@amd.com>,
 buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michal" == Michal Simek <michal.simek@xilinx.com> writes:

 > On 5/17/22 20:38, Neal Frager wrote:
 >> [CAUTION: External Email]
 >> This patch improves the documentation for kria k26 som qspi
 >> programming.
 >> Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed to 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
