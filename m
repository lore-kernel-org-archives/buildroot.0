Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03082C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1A11405AE;
	Wed, 21 Sep 2022 20:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1A11405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F1U0knkbEzC3; Wed, 21 Sep 2022 20:34:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C046740580;
	Wed, 21 Sep 2022 20:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C046740580
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 715381BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48A7641707
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48A7641707
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6AYipiirlr3Q for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:34:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6407416B6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6407416B6
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:34:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CC728C0004;
 Wed, 21 Sep 2022 20:34:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ob6Q5-002NOo-Q8; Wed, 21 Sep 2022 22:34:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220917090521.DF2DC840C5@busybox.osuosl.org>
Date: Wed, 21 Sep 2022 22:34:09 +0200
In-Reply-To: <20220917090521.DF2DC840C5@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 17 Sep 2022 10:53:04 +0200")
Message-ID: <87zgescvr2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/libmdbx: drop useless hash
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=b831f84e1354487e715a15dfe2c1c81bc954c467
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit c099842544248b10f4284a5d47084db8f476fcda ("package/libmdbx:
 > bump version to 0.11.8") forgot to drop the hash for the previous
 > 0.11.7 version, let's do so now.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
