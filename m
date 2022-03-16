Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4473DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 07:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA6BE401F4;
	Wed, 16 Mar 2022 07:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7mKOJjdD_nS2; Wed, 16 Mar 2022 07:18:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B10940290;
	Wed, 16 Mar 2022 07:18:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D20D1BF409
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 07:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42F2460F42
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 07:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QgLO1wld42EV for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 07:18:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F18C60F33
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 07:18:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 83B15C0003;
 Wed, 16 Mar 2022 07:18:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nUNv1-00C11K-Fg; Wed, 16 Mar 2022 08:18:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220214154925.6014-1-ps.report@gmx.net>
 <2c28b619-784f-6cf5-b2e1-6cae707051be@mind.be>
Date: Wed, 16 Mar 2022 08:18:03 +0100
In-Reply-To: <2c28b619-784f-6cf5-b2e1-6cae707051be@mind.be> (Arnout
 Vandecappelle's message of "Sat, 5 Mar 2022 15:51:20 +0100")
Message-ID: <87tubytlg4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/util-linux: bump version to
 2.37.4 (fixes CVE-2022-0563)
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 14/02/2022 16:49, Peter Seiderer wrote:
 >> For details see [1] and [2].
 >> [1]
 >> https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.37/v2.37.4-ChangeLog
 >> [2] https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.37/v2.37.4-ReleaseNotes
 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 >  Bugfix bump, so applied to master, thanks.

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
