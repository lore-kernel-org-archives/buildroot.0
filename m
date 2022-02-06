Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C59BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C3260C21;
	Sun,  6 Feb 2022 14:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RF6cUsn_OyQq; Sun,  6 Feb 2022 14:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1104260B75;
	Sun,  6 Feb 2022 14:36:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7BD31BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A40CE60B75
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7RtiLM1ScYA for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:36:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5D9960B12
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:36:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A337820002;
 Sun,  6 Feb 2022 14:36:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGieb-0001H1-2q; Sun, 06 Feb 2022 15:36:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220130140530.D72C082A75@busybox.osuosl.org>
Date: Sun, 06 Feb 2022 15:36:37 +0100
In-Reply-To: <20220130140530.D72C082A75@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sun, 30 Jan 2022 15:12:28 +0100")
Message-ID: <87czk0vz7u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit]
 docs/manual/adding-packages-directory.txt: reorder select/depends
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=39458e33c1e0c4704fd1dbcd64b87cb7016c6deb
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > From [1]:
 > "Even though the ordering has absolutely no consequences in Kconfig, it
 >  is not logical (when reading). It is more logical and far easier to
 >  understand when depends come first, followed by the selects."

 >  Also, the Config.in example in the manual suggests to use this coding
 >  style [2]."

 > Use the correct coding style in the chapter "Choosing depends on or select"
 > in the manual.

 > [1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
 > [2] https://nightly.buildroot.org/manual.html#_coding_style

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
