Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A3AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BA278143B;
	Sun, 20 Mar 2022 18:31:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dUgsl99u779H; Sun, 20 Mar 2022 18:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE00981428;
	Sun, 20 Mar 2022 18:31:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9748C1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EA646070A
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbW_I-MrJyI0 for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:30:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0E1660670
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:30:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DC5FBFF803;
 Sun, 20 Mar 2022 18:30:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nW0KO-00FFjp-1Q; Sun, 20 Mar 2022 19:30:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kris Bahnsen via buildroot <buildroot@buildroot.org>
References: <20220310185921.8852-1-kris@embeddedTS.com>
Date: Sun, 20 Mar 2022 19:30:56 +0100
In-Reply-To: <20220310185921.8852-1-kris@embeddedTS.com> (Kris Bahnsen via
 buildroot's message of "Thu, 10 Mar 2022 10:59:21 -0800")
Message-ID: <87lex4mq73.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ts4900-fpga: bump version to
 20170510
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
Cc: Kris Bahnsen <kris@embeddedTS.com>, Mathieu Audat <mathieuaudat@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kris" == Kris Bahnsen via buildroot <buildroot@buildroot.org> writes:

 > Fixes TXEN on CPU UARTs not correctly asserting in some multi-byte
 > transmits.

 > Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
