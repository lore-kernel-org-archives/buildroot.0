Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3500C43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 09:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88C9B40003;
	Fri,  3 Jun 2022 09:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8VezeqLRwvq; Fri,  3 Jun 2022 09:58:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A46CD40359;
	Fri,  3 Jun 2022 09:58:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 374211BF346
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26B1C833C6
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osBGtHyBU9_F for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 09:58:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B833383372
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 09:58:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED164200016
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654250314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8vojov9ll4Zyy8bKzgrhs6/OAdCBWKAuYuKPcJ5px1c=;
 b=iyq0SXj+l3ZQIOCWtz2kb7EKLVQR14RShkmYg85ACAlYaNR0Ew7gmQWjNyrB3hZQqNoxkj
 EQVIi/wqwlPRR2/7Cx3gqX5pyzY67JN1p14SIg5bVV+NA4wdRR41BQxaH/4uDJ6ZyqQMFX
 iHSA2cxCmDfVxQ4H4KICW769uCHeh0Wzpc3KyVAZZsJh2HQaHfU+gl7O2j7svOKR3RYSbQ
 CXD3Y42BWgrn3nQUb+d+IwPXe2OG9OPSddcpW0B3FEGsZGubUVrbEOoXOI0hqp2bxGpYwl
 Fs+DQg+HNvKwEAo5QCC9ZQ6QfULoVl3y8I2q0W7GaBy3SK6OqhI2Hq3BxQK47Q==
Date: Fri, 3 Jun 2022 11:58:33 +0200
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20220603115833.560e283f@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot Developers Meeting: September 17-18, in Dublin
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

We are very happy to say that we will be organizing the next Buildroot
Developers Meeting on September 17-18 in Dublin, Ireland.

These dates have been chosen because they are just after the Embedded
Linux Conference Europe (September 13-16), which hopefully will allow
interested participants to combine the trip to ELC-E together with the
Buildroot Developers Meeting.

Participation to this Buildroot Developers Meeting is free, and open to
all Buildroot contributors. It is really a nice way to meet each other,
make progress on Buildroot topics, and have side discussions.

A Wiki page has been set up at:

  https://elinux.org/Buildroot:DeveloperDaysELCE2022

If you intend to participate, please indicate your name on this page,
so that we know how many people will participate and plan the logistics
accordingly.

The exact location has not been defined yet, but we will work on
finding a place that is located reasonably close to the Dublin city
center and/or the ELC-E conference location.

I'm looking forward to meeting Buildroot contributors during this
meeting!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
