Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1E3C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 21:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1666410C0;
	Mon, 28 Feb 2022 21:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3lmtRn0LJ9mf; Mon, 28 Feb 2022 21:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F0A410B6;
	Mon, 28 Feb 2022 21:41:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA40B1BF2FF
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D611D405E3
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:41:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obG7rMV49NBb for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 21:41:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7ED5B40273
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 21:41:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DF464200002
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 21:41:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1nOnlc-00EGlu-Mh
 for buildroot@buildroot.org; Mon, 28 Feb 2022 22:41:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 22:41:16 +0100
Message-ID: <87pmn6y8hv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02-rc3 released
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Buildroot 2022.02-rc3 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2022.02-rc3.tar.gz

or

http://buildroot.net/downloads/buildroot-2022.02-rc3.tar.xz

Or get it from Git:

git://git.buildroot.net/buildroot

Another week, another release candidate.

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -sn 2022.02-rc2..

    17  Fabrice Fontaine
     7  Peter Korsgaard
     1  Adrian Perez de Castro
     1  Bernd Kuhls
     1  Francois Perrad
     1  James Hilliard
     1  Neal Frager
     1  Romain Naour

For more details, see the CHANGES file:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.02-rc3

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
