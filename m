Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26870C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:54:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDA9561216
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDA9561216
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A591440297;
	Tue,  5 Oct 2021 14:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21gwcwaQaYJt; Tue,  5 Oct 2021 14:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D959540200;
	Tue,  5 Oct 2021 14:54:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C1C51BF215
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AA5C40200
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KV5rDgPIBBlj for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 14:54:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A8F3400EF
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 14:54:06 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 785AB4000E;
 Tue,  5 Oct 2021 14:54:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXlpT-0003oQ-Uo; Tue, 05 Oct 2021 16:54:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210927091813.3730562-1-quentin.schulz@theobroma-systems.com>
 <20211005134720.ruvwbrlw5jrzithi@fedora>
Date: Tue, 05 Oct 2021 16:54:03 +0200
In-Reply-To: <20211005134720.ruvwbrlw5jrzithi@fedora> (Quentin Schulz's
 message of "Tue, 5 Oct 2021 15:47:20 +0200")
Message-ID: <87wnmrbjzo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2021.02.x] boot/arm-trusted-firmware: point
 LICENSE_FILES to correct file
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <quentin.schulz@theobroma-systems.com> writes:

 > Hi all,
 > I'm seeing some activity on maintenance branches lately so just gently
 > pinging and adding Peter in Cc.

 > @Peter, I see also that 2021.05.x is still maintained, I'll work on a
 > patch for that one too. Do I need to send a backport request for
 > 2021.08.x branch too?

Thanks, I've just fixed it on 2021.02.x / 2021.05.x. The git server is
acting up so I haven't pushed yet, but will as soon as the server is
working again.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
