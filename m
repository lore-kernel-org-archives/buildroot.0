Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC07C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 12:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F33416AF;
	Thu, 17 Mar 2022 12:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9yAOiTFfbBs4; Thu, 17 Mar 2022 12:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F19E415E1;
	Thu, 17 Mar 2022 12:11:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4A061BF36E
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2E6660F73
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nFaDZYfYAz2e for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 12:11:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9937D60B6E
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 12:11:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 48C0C20003;
 Thu, 17 Mar 2022 12:11:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nUoyr-00Cwow-0N; Thu, 17 Mar 2022 13:11:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Andrei Gherghescu via buildroot <buildroot@buildroot.org>
References: <20220224213620.5899-1-andrei.gherghescu@protonmail.com>
Date: Thu, 17 Mar 2022 13:11:48 +0100
In-Reply-To: <20220224213620.5899-1-andrei.gherghescu@protonmail.com> (Andrei
 Gherghescu via buildroot's message of "Thu, 24 Feb 2022 21:36:33
 +0000")
Message-ID: <87r170srqz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/directfb: change upstream site
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
Cc: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Andrei" == Andrei Gherghescu via buildroot <buildroot@buildroot.org> writes:

 > The http://www.directfb.org/ has been down since 2015.
 > Use the Buildroot backup download site.

 > Fixes:
 >    - https://bugs.busybox.net/show_bug.cgi?id=13731

 > Signed-off-by: Andrei Gherghescu <andrei.gherghescu@protonmail.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
