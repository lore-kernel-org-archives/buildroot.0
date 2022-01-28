Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90477C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 20:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4956C84BF9;
	Fri, 28 Jan 2022 20:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqDyVFS9RifU; Fri, 28 Jan 2022 20:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A373384C01;
	Fri, 28 Jan 2022 20:50:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C4691BF842
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A11584BF9
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbQflqPSRF9n for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 20:50:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA85D84BF4
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 20:50:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E60D3200005;
 Fri, 28 Jan 2022 20:50:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nDYCK-0004H5-CN; Fri, 28 Jan 2022 21:50:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220124205811.15913-1-ps.report@gmx.net>
Date: Fri, 28 Jan 2022 21:50:20 +0100
In-Reply-To: <20220124205811.15913-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 24 Jan 2022 21:58:11 +0100")
Message-ID: <87zgnf4mb7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/gst1-interpipe: bump version to
 1.1.8
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

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Changelog (since 1.1.7):
 >   8b70f08 Add definition of new event GstAppSinkCallbacks for interpipesink element
 >   ddaa9b5 Add conditional build according to GST_VERSION_MINOR
 >   730dea6 Bump project version
 >   8718b12 Add initialization for the GstAppSinkCallbacks struct
 >   f015ff7 Remove redundant initialization of new_event callback
 >   530da92 Update copyright year in README file
 >   e8ce826 Add explanatory comment on the memset of GstAppSinkCallbacks struct
 >   f0f3b8e Fix README copyright date to 2016-2022
 >   814982e Merge branch 'hotfix/add-new-event-callback'

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
