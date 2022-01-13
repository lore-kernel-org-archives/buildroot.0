Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5B2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E9B4027A;
	Thu, 13 Jan 2022 19:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uq3SqZpX5gzI; Thu, 13 Jan 2022 19:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D95A40260;
	Thu, 13 Jan 2022 19:36:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 491651BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36727400E4
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZUQW5mLg8aiO for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:36:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1E02400E3
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:36:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 90F42100003;
 Thu, 13 Jan 2022 19:36:47 +0000 (UTC)
Date: Thu, 13 Jan 2022 20:36:46 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Jeremy Lyda via buildroot <buildroot@buildroot.org>
Message-ID: <20220113203646.1b921877@windsurf>
In-Reply-To: <03d134dec448470eb60d56a0c8a6ceb5@carnegierobotics.com>
References: <03d134dec448470eb60d56a0c8a6ceb5@carnegierobotics.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lvm2: LC_ALL set to "C" locale
 before generating cmds
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
Cc: Jeremy Lyda <jlyda@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jeremy,

On Thu, 13 Jan 2022 17:48:57 +0000
Jeremy Lyda via buildroot <buildroot@buildroot.org> wrote:

> 

Thanks a lot for your patch. Did you submit this patch to the upstream
lvm2 project?

Also, could you send the patch with "git send-email", so that it
appears inline, and not as an attached file?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
