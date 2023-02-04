Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DE9C61DA4
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 23:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 173BC4048E;
	Sat,  4 Feb 2023 23:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 173BC4048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ClvzMAKFZwm; Sat,  4 Feb 2023 23:19:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7573B404C2;
	Sat,  4 Feb 2023 23:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7573B404C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3FD51BF2B5
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 23:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDA44409D3
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 23:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDA44409D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id owE1V5lxqMfQ for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 23:18:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BA7C401CA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BA7C401CA
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 23:18:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 099441C0002;
 Sat,  4 Feb 2023 23:18:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pORo2-00DTO6-Ue; Sun, 05 Feb 2023 00:18:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
 <20230201051658.383420-5-james.hilliard1@gmail.com>
Date: Sun, 05 Feb 2023 00:18:50 +0100
In-Reply-To: <20230201051658.383420-5-james.hilliard1@gmail.com> (James
 Hilliard's message of "Tue, 31 Jan 2023 22:16:50 -0700")
Message-ID: <87v8khyq79.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 05/13] package/gst1-plugins-bad: bump
 version to 1.22.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
