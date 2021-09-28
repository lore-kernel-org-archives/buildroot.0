Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDCBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 15:49:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25E0761206
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 15:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25E0761206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E82124074A;
	Tue, 28 Sep 2021 15:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9ZaLyEh2TKg; Tue, 28 Sep 2021 15:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6176F4072B;
	Tue, 28 Sep 2021 15:49:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15E141BF681
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 15:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11D1B40105
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 15:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uvML7xr8MVh0 for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 15:48:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EAF9400C5
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 15:48:58 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6A5F320000F;
 Tue, 28 Sep 2021 15:48:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mVFLh-00083S-Mc; Tue, 28 Sep 2021 17:48:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <aduskett@gmail.com>
References: <20210918005027.97811-1-aduskett@gmail.com>
Date: Tue, 28 Sep 2021 17:48:53 +0200
In-Reply-To: <20210918005027.97811-1-aduskett@gmail.com> (Adam Duskett's
 message of "Fri, 17 Sep 2021 17:50:27 -0700")
Message-ID: <87a6jwpuoq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: bump versions to
 11.0.12+7 and 16.0.2+7
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
Cc: Tudor Holton <buildroot@tudorholton.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > As the github repository has changed from github.com/AdoptOpenJDK/ to
 > github.com/adoptium, both versions are updated in the same patch.

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

These contains a number of security fixes, so marked as a security bump
and committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
