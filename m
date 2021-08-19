Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1403DC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 13:25:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1F0C6113D
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 13:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1F0C6113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A85BD80F1A;
	Thu, 19 Aug 2021 13:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFNBdlE2VwAR; Thu, 19 Aug 2021 13:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D8080D6B;
	Thu, 19 Aug 2021 13:25:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AA981BF3CB
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 13:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77F094250D
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 13:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3E_dKL_2Sk7v for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 13:25:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 867AD407B3
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 13:25:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 46E1B200007;
 Thu, 19 Aug 2021 13:24:59 +0000 (UTC)
Date: Thu, 19 Aug 2021 15:24:58 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210819152458.1aedaae4@windsurf>
In-Reply-To: <ebd69515-63bf-5345-832d-0047d4cfae38@benettiengineering.com>
References: <20210818210635.352231-1-giulio.benetti@benettiengineering.com>
 <20210819000356.579c339d@windsurf>
 <ebd69515-63bf-5345-832d-0047d4cfae38@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] DEVELOPERS: add myself to toolchain topic
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu, 19 Aug 2021 00:23:40 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> >> diff --git a/DEVELOPERS b/DEVELOPERS
> >> index af97de02de..874d47352c 100644
> >> --- a/DEVELOPERS
> >> +++ b/DEVELOPERS
> >> @@ -1060,6 +1060,7 @@ F:	package/nfs-utils/
> >>   F:	package/sunxi-mali-mainline/
> >>   F:	package/sunxi-mali-mainline-driver/
> >>   F:	package/udisks/
> >> +F:	toolchain/  
> > 
> > For internal toolchains, toolchain/ doesn't have much. It's really
> > package/gcc, package/binutils, package/gdb, package/glibc,
> > package/uclibc and package/musl that matter the most.  
> 
> Ah yes. But also I touch lot of timer toolchain/Config.in to create new 
> bugs. I would add that file too IMHO.

I didn't mean that you should not add toolchain/. I suggested that in
addition to toolchain/, you should probably also add the relevant
packages involved in the toolchain build (gcc, binutils, gdb, C
libraries).

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
