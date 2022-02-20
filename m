Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9D3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 20:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9EA8401E2;
	Sun, 20 Feb 2022 20:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2yvHvQ5LUs-2; Sun, 20 Feb 2022 20:33:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A0F9401CF;
	Sun, 20 Feb 2022 20:33:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9332C1BF4E6
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 20:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81A7860C2F
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 20:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cHMN4-4ppC0 for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 20:33:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A30D960C0D
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 20:33:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D704F60004;
 Sun, 20 Feb 2022 20:33:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nLstK-004wBS-O0; Sun, 20 Feb 2022 21:33:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20220217230908.1532564-1-aperez@igalia.com>
 <20220217230908.1532564-2-aperez@igalia.com>
Date: Sun, 20 Feb 2022 21:33:10 +0100
In-Reply-To: <20220217230908.1532564-2-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Fri, 18 Feb 2022 01:09:08 +0200")
Message-ID: <87k0dp9t2x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/webkitgtk: use lcms2 if
 available
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Make webkitgtk enable color management support if the lcms2 package has
 > been selected.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
