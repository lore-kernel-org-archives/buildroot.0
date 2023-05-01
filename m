Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B3BC77B7C
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 17:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EEA8613E1;
	Mon,  1 May 2023 17:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EEA8613E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PyXG_RZ_WUZQ; Mon,  1 May 2023 17:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2F74613D9;
	Mon,  1 May 2023 17:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F74613D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75F4A1BF41C
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 17:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E2BE41823
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 17:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E2BE41823
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOIOduPoYRlG for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 17:42:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 396E1410BD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 396E1410BD
 for <buildroot@buildroot.org>; Mon,  1 May 2023 17:42:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 45FBDC0002;
 Mon,  1 May 2023 17:42:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ptXXh-006qRi-Bi; Mon, 01 May 2023 19:42:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Knight <james.d.knight@live.com>
References: <SN4P221MB0682DC54AEEF8491EF1BBDF5A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
Date: Mon, 01 May 2023 19:42:29 +0200
In-Reply-To: <SN4P221MB0682DC54AEEF8491EF1BBDF5A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
 (James Knight's message of "Sat, 29 Apr 2023 15:05:50 -0400")
Message-ID: <87mt2oc5iy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/systemd: update help links
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

>>>>> "James" == James Knight <james.d.knight@live.com> writes:

 > When browsing the help references for various systemd features, it was
 > observed that the `systemd-rfkill` link was dead (originally pointing to
 > `systemd-rfkill@.service.html`; now `systemd-rfkill.service.html`). This
 > commit corrects this link, as well as updates all other links to https
 > (since freedesktop.org now force redirects to https).

 > Signed-off-by: James Knight <james.d.knight@live.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
