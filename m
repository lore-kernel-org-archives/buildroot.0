Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C30AC4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 16:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A543C83D9A;
	Tue, 31 Oct 2023 16:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A543C83D9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKCf28Tx1mvs; Tue, 31 Oct 2023 16:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1DC283D96;
	Tue, 31 Oct 2023 16:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1DC283D96
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E99961BF2C9
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 16:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFEA361513
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 16:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFEA361513
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tqW6Mg4H_qzt for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 16:39:41 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CBF761511
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 16:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CBF761511
Received: by mail.gandi.net (Postfix) with ESMTPSA id 056562000A;
 Tue, 31 Oct 2023 16:39:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1qxrmD-004Gab-06;
 Tue, 31 Oct 2023 17:39:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Frager, Neal" <neal.frager@amd.com>
References: <20231018111357.2898095-1-neal.frager@amd.com>
 <20231031121222.1dfa4035@booty>
 <CH2PR12MB50042DEEED0FC5E7D3BBCA99F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231031133415.1d89db5a@windsurf>
 <8a0d97bb-2fe5-4e09-8e95-b928a431ce1e@amd.com>
 <CH2PR12MB5004A3E0B5725A32D422E945F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
Date: Tue, 31 Oct 2023 17:39:36 +0100
In-Reply-To: <CH2PR12MB5004A3E0B5725A32D422E945F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
 (Neal Frager's message of "Tue, 31 Oct 2023 13:30:15 +0000")
Message-ID: <87bkce21br.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynq_zc702_defconfig: new
 defconfig
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Frager," == Frager, Neal <neal.frager@amd.com> writes:

Hi,

 > The remaining question is just a matter of how many zynq, zynqmp and
 > versal defconfigs is the right amount for buildroot?  I would like to
 > be able to support the following 11 boards, if it would be ok for the
 > buildroot community.  5 of these 11 are already included in
 > buildroot.

 > zynq_zc702
 > zynq_zc706
 > zynqmp_zcu102
 > zynqmp_zcu104
 > zynqmp_zcu106
 > zynqmp_kria_kd240
 > zynqmp_kria_kr260
 > zynqmp_kria_kv260
 > versal_vck190
 > versal_vek280 (coming next year)
 > versal_vmk180

 > In exchange, I would be ok with dropping the zynq_qmtech board and
 > possibly one of the zynq_zed
 > boards.

I think the main issue with a lot of defconfigs is maintaining them (but
you already do that) and the CI overhead from building all of them.

I guess we could come up with some logic to skip some of the zynq*
defconfigs from the Gitlab CI setup. Romain, any good ideas?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
