Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779ACC433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 21:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E43BB611C4;
	Thu, 29 Sep 2022 21:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E43BB611C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F21Zj6bwmEQc; Thu, 29 Sep 2022 21:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CB93611AD;
	Thu, 29 Sep 2022 21:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CB93611AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EEB41BF3D1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2F4541C07
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2F4541C07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQjE61zV2T6A for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 21:06:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BFDD418B1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BFDD418B1
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 21:06:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A561D1BF206;
 Thu, 29 Sep 2022 21:06:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oe0ji-009xqd-G1; Thu, 29 Sep 2022 23:06:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220922191350.29423-1-ps.report@gmx.net>
 <20220923233328.2955c3f3@windsurf>
Date: Thu, 29 Sep 2022 23:06:26 +0200
In-Reply-To: <20220923233328.2955c3f3@windsurf> (Thomas Petazzoni's message of
 "Fri, 23 Sep 2022 23:33:28 +0200")
Message-ID: <87wn9l6gbx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] DEVELOPERS: remove Peter Seiderer
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Peter
 > On Thu, 22 Sep 2022 21:13:50 +0200
 > Peter Seiderer <ps.report@gmx.net> wrote:

 >> No review/patches from my side the last few months, so drop my
 >> DEVELOPERS entry.
 >> 
 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 >> ---
 >> DEVELOPERS | 35 -----------------------------------
 >> 1 file changed, 35 deletions(-)

 > Thanks a lot Peter for all your contributions to Buildroot. It is sad
 > to see you go, but your contributions have been greatly appreciated. I
 > hope that you will nevertheless have the chance to get back to
 > Buildroot at some point in the future.

 > Patch applied, of course!

 > Once again, thanks a lot, and all the best!

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

Thanks for your work!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
