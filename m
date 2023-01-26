Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11B1C05027
	for <buildroot@archiver.kernel.org>; Thu, 26 Jan 2023 13:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D19E81E16;
	Thu, 26 Jan 2023 13:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D19E81E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlXtWqQ0pm34; Thu, 26 Jan 2023 13:25:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A356381DE3;
	Thu, 26 Jan 2023 13:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A356381DE3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8456C1BF48D
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 13:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DD8660D65
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 13:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DD8660D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBLDvm33tsDg for <buildroot@lists.busybox.net>;
 Thu, 26 Jan 2023 13:25:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94A0C60D5A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94A0C60D5A
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 13:25:28 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 754EF40006;
 Thu, 26 Jan 2023 13:25:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pL2Fo-00G3OO-IX; Thu, 26 Jan 2023 14:25:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
References: <20230124125528.5801-1-nicolas.cavallari@green-communications.fr>
Date: Thu, 26 Jan 2023 14:25:24 +0100
In-Reply-To: <20230124125528.5801-1-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Tue, 24 Jan 2023 13:55:28 +0100")
Message-ID: <871qnha0mz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: security bump to 1.5.1
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

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > Fixes CVE-2023-22742: when compiled with BR2_PACKAGE_LIBSSH2,
 > libgit2 fails to verify SSH keys by default.

 > https://github.com/libgit2/libgit2/blob/v1.5.1/docs/changelog.md

 > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
