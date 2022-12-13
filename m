Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A09C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 20:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA0AC60E07;
	Tue, 13 Dec 2022 20:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA0AC60E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3n5iEWK9LLj3; Tue, 13 Dec 2022 20:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 177B160AFB;
	Tue, 13 Dec 2022 20:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 177B160AFB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5A1D1BF301
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F7174174B
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F7174174B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZ4cACCDk8RW for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 20:18:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2ABB4172A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2ABB4172A
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 20:18:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C1A3CFF807;
 Tue, 13 Dec 2022 20:18:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p5Bj4-00H0m6-QA; Tue, 13 Dec 2022 21:18:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Indrek Kruusa <indrek.kruusa@gmail.com>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <87359lytkg.fsf@dell.be.48ers.dk>
 <_Xy-l8Ny6TGT7WRiixo_CPZYHzdUIuGYexyAlFzMnPCN0loQWU_ydtPGjnGDOAPHohUUzztFqL1rbhYa5bVk7cO2NN6fK_cUPe8cL4MiTMo=@troodon-software.com>
 <87pmcoy07y.fsf@dell.be.48ers.dk>
 <CA+fTLhg18JH_4FzrFQP2cEQEmG3=CKBc3wntbYhrd9nT+_0Pow@mail.gmail.com>
Date: Tue, 13 Dec 2022 21:18:06 +0100
In-Reply-To: <CA+fTLhg18JH_4FzrFQP2cEQEmG3=CKBc3wntbYhrd9nT+_0Pow@mail.gmail.com>
 (Indrek Kruusa's message of "Tue, 13 Dec 2022 22:09:54 +0200")
Message-ID: <87bko7vz0h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] configs/nezha_defconfig: bump versions
 for uboot, sbi and linux kernel
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Indrek" == Indrek Kruusa <indrek.kruusa@gmail.com> writes:

Hi,

 > I also did a clean build with Peter's patches and the Lichee RV dock is
 > fine with it. Some snippets from output below. I will drop my patch series
 > as Peter's series is superior.

Great, thanks for the feedback!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
