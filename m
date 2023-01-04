Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0C0C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 16:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1D8C6108E;
	Wed,  4 Jan 2023 16:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1D8C6108E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xtB5IGlgImZ; Wed,  4 Jan 2023 16:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AF1F61087;
	Wed,  4 Jan 2023 16:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AF1F61087
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 750051BF5DF
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A7E34185B
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A7E34185B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71ZYZAT-3LXB for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 16:46:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24CDB41859
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24CDB41859
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 16:46:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FB5DFF809;
 Wed,  4 Jan 2023 16:46:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pD6uN-0053A9-2L; Wed, 04 Jan 2023 17:46:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
 <20230101233653.487175-8-ricardo.martincoski@gmail.com>
Date: Wed, 04 Jan 2023 17:46:31 +0100
In-Reply-To: <20230101233653.487175-8-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 1 Jan 2023 20:36:31 -0300")
Message-ID: <87cz7uz1qw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 07/29] package/ima-evm-utils: really install
 to staging
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

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Commit "8229196d41 package/ima-evm-utils: new package" added
 > IMA_EVM_UTILS_INSTALL_STAGING_CMDS without enabling
 > IMA_EVM_UTILS_INSTALL_STAGING, so currently the package is not installed
 > to staging.

 > Enable installing to staging.

 > Cc: Petr Vorel <petr.vorel@gmail.com>
 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
