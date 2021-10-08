Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7514AC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 10:48:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1644860FD9
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 10:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1644860FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3CB1840F5;
	Fri,  8 Oct 2021 10:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id exPhGdue7q27; Fri,  8 Oct 2021 10:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F2B840EF;
	Fri,  8 Oct 2021 10:48:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 842ED1C1127
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 10:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7491440531
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 10:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVG_gQN72cFz for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 10:48:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FDCB404EE
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 10:48:08 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id E4137100005;
 Fri,  8 Oct 2021 10:48:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mYnQ3-0004U8-W8; Fri, 08 Oct 2021 12:48:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20211007210844.4901-1-ps.report@gmx.net>
Date: Fri, 08 Oct 2021 12:48:03 +0200
In-Reply-To: <20211007210844.4901-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 7 Oct 2021 23:08:44 +0200")
Message-ID: <877denztb0.fsf@dell.be.48ers.dk>
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

Committed, thanks. Given the above changes, this should presumably also
be applied to our stable branches?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
