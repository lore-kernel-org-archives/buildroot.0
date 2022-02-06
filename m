Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47399C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 15:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0998400F5;
	Sun,  6 Feb 2022 15:28:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSROAltLFBke; Sun,  6 Feb 2022 15:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16781400E4;
	Sun,  6 Feb 2022 15:28:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4DF71BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C13AD60A89
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xsccokuQP1Er for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 15:28:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BECB608A6
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 15:28:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7369960003;
 Sun,  6 Feb 2022 15:28:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGjSP-0002h4-QY; Sun, 06 Feb 2022 16:28:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220130215213.700B8817E3@busybox.osuosl.org>
Date: Sun, 06 Feb 2022 16:28:05 +0100
In-Reply-To: <20220130215213.700B8817E3@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sun, 30 Jan 2022 22:58:44 +0100")
Message-ID: <87r18gui9m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/pistache: disable package if
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d5b08f37a4c3fb4f56f2ca440bafc865bdf04bfe
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Package pistache is affected by binutils bug 27597 (Nios II), so let's
 > disable it when BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y. Let's also
 > indent the comment dependencies.

 > Fixes:

 >   http://autobuild.buildroot.net/results/0e7b74c5a07ced2bbae1a0a8c7d7ba26dfa04031/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
