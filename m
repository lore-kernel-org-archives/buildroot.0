Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A136CCDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 11:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4BAB61033;
	Wed, 18 Oct 2023 11:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4BAB61033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Z3axSUf0Rce; Wed, 18 Oct 2023 11:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CCCD60F0D;
	Wed, 18 Oct 2023 11:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CCCD60F0D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B8BF1BF3B0
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 11:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E986681750
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 11:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E986681750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJTywMHJ_g8j for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 11:55:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37162815CC
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 11:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37162815CC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15DF5E0006;
 Wed, 18 Oct 2023 11:55:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qt58q-00BhHG-UA; Wed, 18 Oct 2023 13:55:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Frager, Neal" <neal.frager@amd.com>
References: <20231018091002.2162735-1-neal.frager@amd.com>
 <20231018091002.2162735-2-neal.frager@amd.com>
 <87h6motghr.fsf@48ers.dk>
 <CH2PR12MB50049ACBED004D0940741439F0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <f88a31b0-b6dd-4bfa-921b-1f37b737847f@amd.com>
 <CH2PR12MB5004328281E2B7ACDE8B5A2EF0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
Date: Wed, 18 Oct 2023 13:55:12 +0200
In-Reply-To: <CH2PR12MB5004328281E2B7ACDE8B5A2EF0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
 (Neal Frager's message of "Wed, 18 Oct 2023 10:36:59 +0000")
Message-ID: <87zg0grvq7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 2/3] configs/zynq_zed_defconfig: bump to
 xilinx-v2023.2
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>, "Simek, Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Frager," == Frager, Neal <neal.frager@amd.com> writes:

Hello,

 > Thank you for the very clear explanation.

 > @Peter Korsgaard, if you would like, I could start bumping the Linux
 > kernel release tag used by the buildroot zynq/zynqmp/versal example
 > defconfigs every time we release a merge of .10 patches.

Sure, makes sense.

 > Since there are bug fixes in 2023.2 that are specific to AMD devices,
 > I would think that 2023.2 with Linux kernel 6.1.30 is still a better
 > choice than 2023.1 with Linux kernel 6.1.50.  However, I am happy to
 > bump to 2023.2 with Linux kernel 6.1.60 as soon as this is released.

 > What do you think?

Sounds good to me, please go ahead.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
