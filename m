Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC17C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 15:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 622608148A;
	Sun, 20 Feb 2022 15:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgCZ9ecvgl-x; Sun, 20 Feb 2022 15:37:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A128481465;
	Sun, 20 Feb 2022 15:37:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5A3B1BF303
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 15:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4FBB81465
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 15:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J7PrfY1D_aDT for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 15:37:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 927B081432
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 15:37:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C8666C0003;
 Sun, 20 Feb 2022 15:37:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nLoGo-000ued-9v; Sun, 20 Feb 2022 16:37:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220219102451.25602-1-ps.report@gmx.net>
Date: Sun, 20 Feb 2022 16:37:06 +0100
In-Reply-To: <20220219102451.25602-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 19 Feb 2022 11:24:51 +0100")
Message-ID: <87fsodblct.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/wireless-regdb: bump version to
 2022.02.18
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

 > Changelog (since 2021.08.28, [1]):
 >   e061299 wireless-regdb: Raise DFS TX power limit to 250 mW (24 dBm) for the US
 >   2ce78ed wireless-regdb: Update regulatory rules for Croatia (HR) on 6GHz
 >   0d39f4c wireless-regdb: Update regulatory rules for South Korea (KR)
 >   acad231 wireless-regdb: Update regulatory rules for France (FR) on 6 and 60 GHz
 >   ea83a82 wireless-regdb: add support for US S1G channels
 >   4408149 wireless-regdb: add 802.11ah bands to world regulatory domain
 >   5f3cadc wireless-regdb: Update regulatory rules for Spain (ES) on 6GHz
 >   e0ac69b Revert "wireless-regdb: Update regulatory rules for South Korea (KR)"
 >   40e5e80 wireless-regdb: Update regulatory rules for South Korea (KR)
 >   e427ff2 wireless-regdb: Update regulatory rules for China (CN)
 >   0970116 wireless-regdb: Update regulatory rules for the Netherlands (NL) on 6GHz
 >   4dac44b wireless-regdb: update regulatory database based on preceding changes

 > [1] https://lore.kernel.org/linux-wireless/YhBCKWNw3IMfGs0L@ubuntu-x1/

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
