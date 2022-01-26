Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADBEC2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3410240338;
	Wed, 26 Jan 2022 20:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MyyGjohc-ynG; Wed, 26 Jan 2022 20:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46173400E3;
	Wed, 26 Jan 2022 20:03:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B11151BF5A0
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EF1B80C50
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilx6O-BsMyHe for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:03:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BEE180A9E
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:03:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D0EE4200003;
 Wed, 26 Jan 2022 20:03:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCoVh-00064u-MN; Wed, 26 Jan 2022 21:03:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Erik Larsson <who+buildroot@cnackers.org>
References: <20220101223900.2970405-1-who+buildroot@cnackers.org>
Date: Wed, 26 Jan 2022 21:03:17 +0100
In-Reply-To: <20220101223900.2970405-1-who+buildroot@cnackers.org> (Erik
 Larsson's message of "Sat, 1 Jan 2022 23:38:58 +0100")
Message-ID: <87k0emfenu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/tpm2-tss: remove unused
 dependency
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

>>>>> "Erik" == Erik Larsson <who+buildroot@cnackers.org> writes:

 > The last reference of uriparser was removed in:
 > https://github.com/tpm2-software/tpm2-tss/commit/17a670dd4c0e4effc2ac3cdf021c299fa92df70e

 > Signed-off-by: Erik Larsson <who+buildroot@cnackers.org>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
