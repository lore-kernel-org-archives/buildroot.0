Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6162CCDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 11:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11BE382374;
	Wed, 18 Oct 2023 11:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11BE382374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4uDjwAMlYq2; Wed, 18 Oct 2023 11:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7262482352;
	Wed, 18 Oct 2023 11:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7262482352
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51EC51BF267
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 11:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3848E41E52
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 11:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3848E41E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oy36cnJUsQ9x for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 11:27:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B41141E44
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 11:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B41141E44
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B52A1BF207;
 Wed, 18 Oct 2023 11:27:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qt4iB-00Bg1v-IW; Wed, 18 Oct 2023 13:27:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michal Simek <michal.simek@amd.com>
References: <20231018091002.2162735-1-neal.frager@amd.com>
 <20231018091002.2162735-2-neal.frager@amd.com>
 <87h6motghr.fsf@48ers.dk>
 <CH2PR12MB50049ACBED004D0940741439F0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <f88a31b0-b6dd-4bfa-921b-1f37b737847f@amd.com>
 <878r80tdrr.fsf@48ers.dk>
 <fa1501e0-b4ce-4d8d-9596-60b39c5f4fa1@amd.com>
Date: Wed, 18 Oct 2023 13:27:39 +0200
In-Reply-To: <fa1501e0-b4ce-4d8d-9596-60b39c5f4fa1@amd.com> (Michal Simek's
 message of "Wed, 18 Oct 2023 13:17:55 +0200")
Message-ID: <874jiotbkk.fsf@48ers.dk>
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Frager,
 Neal" <neal.frager@amd.com>, "Chaplin, Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michal" == Michal Simek <michal.simek@amd.com> writes:

Hi,

 >> > time where there shouldn't be major changes merged to that
 >> > branch. That's why .2 version stopped at .30 for running all
 >> > regressions and .1 can move on .40/.50(coming soon).
 >> Coming soon? .1.50 was tagged 4 weeks ago (see above).

 > We need to do the merge, resolve conflicts, run regression suite on the top of it.
 > It was in the middle for 2023.2 release where especially testing team
 > was quite occupied that's why it takes some time to finish it.

Ehh, what I mean is that your colleague already pushed a
xlnx_rebase_v6.1_LTS_2023.1_merge_6.1.50 tag 4 week ago:

commit 496752408d031f93159fcf1aba2831c807a389a3 (tag: xlnx_rebase_v6.1_LTS_2023.1_merge_6.1.50, xlnx/xlnx_rebase_v6.1_LTS_2023.1_update)
Merge: 0f7f048016e0 a2943d2d9a00
Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Date:   Wed Sep 20 17:50:18 2023 +0530

    Merge tag 'v6.1.50' into xlnx_rebase_v6.1_LTS_2023.1_update

    This is the 6.1.50 stable release

    Resolve merge conflicts in:
    drivers/usb/dwc3/core.c

    Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

(Upstream 6.1.50 is from Aug 30).


 >> Ok, thanks! So +/- until the (presumably 6.6 based?) 2024.1 release?

 > yes. We will be providing these LTS versions till new kernel version is released.

 > I hope that 6.6 is going to be next LTS and if yes it should be used in 2024.1.

Super!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
