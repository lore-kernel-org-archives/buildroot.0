Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F0DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 11:51:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE6060F6F
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 11:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DE6060F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E8A540669;
	Sat,  9 Oct 2021 11:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lrCHfxoRuooW; Sat,  9 Oct 2021 11:51:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF5840661;
	Sat,  9 Oct 2021 11:51:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 056E51BF36E
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 11:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E82DD40661
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 11:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHMHaWje9Ijc for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 11:51:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 376644065F
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 11:51:09 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0C26BE0002;
 Sat,  9 Oct 2021 11:51:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mZAsc-00040j-BY; Sat, 09 Oct 2021 13:51:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20211007210844.4901-1-ps.report@gmx.net>
Date: Sat, 09 Oct 2021 13:51:06 +0200
In-Reply-To: <20211007210844.4901-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 7 Oct 2021 23:08:44 +0200")
Message-ID: <87h7dqto0l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/wireless-regdb: bump version to
 2021.08.28
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
Cc: Dimitrios Siganos <dimitris@siganos.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Changelog (since 2021.04.21):
 >   47007d0 wireless-regdb: update regulatory database based on preceding changes
 >   e983a25 Update regulatory rules for Ecuador (EC)
 >   a0bcb88 wireless-regdb: Update regulatory rules for Norway (NO) on 6 and 60 GHz
 >   cdf854d wireless-regdb: Update regulatory rules for Germany (DE) on 6GHz
 >   a4468e8 wireless-regdb: update regulatory database based on preceding changes
 >   86cba52 wireless-regdb: reduce bandwidth for 5730-5850 and 5850-5895 MHz in US
 >   6fa2384 wireless-regdb: remove PTMP-ONLY from 5850-5895 MHz for US
 >   9839e1e wireless-regdb: recent FCC report and order allows 5850-5895 immediately
 >   42dfaf4 wireless-regdb: update 5725-5850 MHz rule for GB

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
