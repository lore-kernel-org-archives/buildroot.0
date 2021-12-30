Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D7EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 21:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF8FE60AB5;
	Thu, 30 Dec 2021 21:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5vZgldtQdD4; Thu, 30 Dec 2021 21:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 094DE60A94;
	Thu, 30 Dec 2021 21:32:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B03B1BF3C4
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45D46409EA
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osKfF6ynVgvx for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 21:32:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13B99409E3
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 21:32:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 649211BF205;
 Thu, 30 Dec 2021 21:32:44 +0000 (UTC)
Date: Thu, 30 Dec 2021 22:32:43 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20211230223243.0fcd0c44@windsurf>
In-Reply-To: <MWHPR1201MB0239219A4C47B50911698503A1459@MWHPR1201MB0239.namprd12.prod.outlook.com>
References: <20211021115915.32447-1-abrodkin@synopsys.com>
 <20211230211458.4449d869@windsurf>
 <MWHPR1201MB0239219A4C47B50911698503A1459@MWHPR1201MB0239.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH,
 RE-SEND] openjdk: Add ARC HS3x/4x support via "Zero Assembly
 Project"
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
Cc: "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Dec 2021 21:04:21 +0000
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> Do you want me to send a separate patch which adds these "!BR2_arc" dependencies
> for both BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT &
> BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER or you prefer to do a fast fix-up yourself?

Please send a patch :-)

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
