Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C304EDEC7E
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 15:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3260A82BA1;
	Wed, 13 Sep 2023 15:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3260A82BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5u5nveyMwMAg; Wed, 13 Sep 2023 15:57:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8378C8175B;
	Wed, 13 Sep 2023 15:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8378C8175B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DC111BF5EA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 15:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84DC6416A6
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 15:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84DC6416A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XJn4OgOqkHw6 for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 15:57:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84363405F8
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 15:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84363405F8
Received: by mail.gandi.net (Postfix) with ESMTPSA id C47761C0009;
 Wed, 13 Sep 2023 15:57:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgSEq-005zm1-4U; Wed, 13 Sep 2023 17:57:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Frank Vanbever via buildroot <buildroot@buildroot.org>
References: <20230823145300.1499071-1-frank.vanbever@mind.be>
Date: Wed, 13 Sep 2023 17:57:12 +0200
In-Reply-To: <20230823145300.1499071-1-frank.vanbever@mind.be> (Frank Vanbever
 via buildroot's message of "Wed, 23 Aug 2023 16:53:00 +0200")
Message-ID: <87cyym2hif.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump
 to version 3.0.10
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
Cc: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Frank" == Frank Vanbever via buildroot <buildroot@buildroot.org> writes:

 > - Fixes CVE-2023-38285 [1]
 > - Adapted 0001-configure.ac-drop-usage-of-git-at-configure-time.patch due to
 >   upstream moving to autoconf portable shell constructs.
 > - Added missing Upstream comments

 > Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>

 > [1] https://www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/modsecurity-v3-dos-vulnerability-in-four-transformations-cve-2023-38285/

 > Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
