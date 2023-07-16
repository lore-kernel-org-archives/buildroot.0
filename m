Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F35C001DC
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96E3581514;
	Sun, 16 Jul 2023 06:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96E3581514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bSyCczCPnXB; Sun, 16 Jul 2023 06:29:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC728141C;
	Sun, 16 Jul 2023 06:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDC728141C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 779C61BF322
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EDD5813E7
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EDD5813E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22VspaAGb4j8 for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:29:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 411078141C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 411078141C
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:29:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CFEBE0005;
 Sun, 16 Jul 2023 06:29:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qKvFe-008nV9-LI; Sun, 16 Jul 2023 08:29:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230606181148.454747-1-bernd.kuhls@t-online.de>
 <877crp1n0s.fsf@48ers.dk>
Date: Sun, 16 Jul 2023 08:29:02 +0200
In-Reply-To: <877crp1n0s.fsf@48ers.dk> (Peter Korsgaard's message of "Tue, 27
 Jun 2023 07:40:03 +0200")
Message-ID: <87r0p8cqtt.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH/next 1/1] package/dav1d: bump version to
 1.2.1
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
 >> Release notes:
 >> https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 > Committed, thanks.

 > I see that 1.2.0 fixed
 > https://security-tracker.debian.org/tracker/CVE-2023-32570, so I'll
 > backport both to 2023.02.x.

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
